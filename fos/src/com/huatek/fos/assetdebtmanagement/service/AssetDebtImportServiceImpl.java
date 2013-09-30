package com.huatek.fos.assetdebtmanagement.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.huatek.base.entity.BaseEntity;
import com.huatek.fos.assetdebtmanagement.entity.hibernate.AssetDebt;
import com.huatek.fos.upload.service.ImportService;
import com.huatek.fos.upload.service.InfoBean;
import com.huatek.fos.util.FosUtil;

/**
 * 地区导入服务类. 完成地区导入相关操作接口实现.
 * 
 * @author Allen_Huang
 */
public class AssetDebtImportServiceImpl implements ImportService {
	/**
	 * 日志常量.
	 * **/
	private static final Logger LOGGER = Logger
			.getLogger(AssetDebtImportServiceImpl.class);
	/**
	 * 自动注入服务类.
	 */
	@Resource(name = "hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	/**
	 * Cache服务接口.
	 */
	@Autowired
	private AssetDebtService assetDebtService;

	/**
	 * 第一列Date.
	 */
	private static final int COL_FIRST = 0;

	/**
	 * 第三列资产总计.
	 */
	private static final int COL_THREE = 2;

	/**
	 * 第七列负债合计.
	 */
	private static final int COL_SEVEN = 6;

	/**
	 * 导入数据.
	 * 
	 * @param uploadInfoBean
	 *            上传信息对象
	 * @throws IOException
	 *             抛出IO异常
	 */
	public void importData(final InfoBean uploadInfoBean) throws IOException {
		save(uploadInfoBean);
	}

	/**
	 * 保存数据.
	 * 
	 * @param uploadInfoBean
	 *            上传信息对象
	 */
	private void save(final InfoBean uploadInfoBean) {
		List<BaseEntity> datas = uploadInfoBean.getData();
		for (int i = 0; i < datas.size(); i++) {
			AssetDebt region = (AssetDebt) datas.get(i);
			hibernateTemplate.save(region);
		}
		assetDebtService.flushCahche(true);
	}

	/**
	 * 验证数据.
	 * 
	 * @param uploadFile
	 *            上传的文件
	 * @return InfoBean 返回信息对象
	 */
	public InfoBean validateData(final MultipartFile uploadFile) {

		try {
			// 获取上传文件路径
			InfoBean uploadInfoBean = new InfoBean();
			String filePath = FosUtil.getUploadPath(uploadFile);
			uploadInfoBean.setFile(new File(filePath));

			// 调用解析文件并返回数据列表
			InfoBean regionInfoBean = parseContentXsl(new File(filePath));
			uploadInfoBean.setData(regionInfoBean.getData());
			uploadInfoBean.setErrorMsg(regionInfoBean.getErrorMsg());

			// 判断是否存在错误信息
			if (regionInfoBean.getErrorMsg().length() > 0) {
				uploadInfoBean.setSuccess(false);
			} else {
				uploadInfoBean.setSuccess(true);
			}

			// 上传条数
			String total = "0";
			if (regionInfoBean.getData() != null) {
				total = Integer.toString(regionInfoBean.getData().size());
			}
			uploadInfoBean.setInfoMsg("总共上传数据为：" + total);
			return uploadInfoBean;
		} catch (Exception e) {
			e.printStackTrace();
			InfoBean userInfoBean = new InfoBean();
			userInfoBean.setErrorMsg("模版错误，请重新下载模版并认真填写。");
			return userInfoBean;
		}
	}

	/**
	 * 解析文件.
	 * 
	 * @param file
	 *            上传的文件
	 * @return List 返回信息对象列表
	 */
	private InfoBean parseContentXsl(final File file) {

		// 读取excel文件
		StringBuffer errorMsg = new StringBuffer();
		XSSFWorkbook wb = null;
		HSSFSheet sheet_03 = null;
		XSSFSheet sheet_07 = null;

		try {
			String ext = file.getName()
					.substring(file.getName().lastIndexOf(".") + 1)
					.toLowerCase();
			// 2003
			/*
			 * if(ext.equalsIgnoreCase("xls")){ HSSFWorkbook wb = new
			 * HSSFWorkbook(new POIFSFileSystem( new FileInputStream(file)));
			 * sheet_03 = wb.getSheetAt(0); }
			 */
			// 2007
			// else
			if (ext.equalsIgnoreCase("xlsx")) {
				wb = new XSSFWorkbook(new FileInputStream(
						file.getAbsolutePath()));
				sheet_07 = wb.getSheetAt(0);
			}

			// 解析excel文件并验证
			int i = 0;
			int rows = 0;
			rows = sheet_07.getPhysicalNumberOfRows();
			if (rows < 2) {
				errorMsg.append("上传文件为空，无法进行导入。<br>");
			}

			// 定义一个数组，用于保存可上传的文件类型
			Integer[] fileRow = new Integer[3];
			fileRow[0] = 1;
			fileRow[1] = 36;
			fileRow[2] = 60;
			String endDate = "";
			String assetAmount = "";
			String debtTotal = "";

			Date date = new Date(0);
			FormulaEvaluator evaluator = wb.getCreationHelper()
					.createFormulaEvaluator();
			for (; i < fileRow.length; i++) {
				// 2007
				XSSFRow row = (XSSFRow) sheet_07.getRow(fileRow[i]); // 从0开始

				if (row != null) {

					if (fileRow[i] == 1) {
						date = HSSFDateUtil
								.getJavaDate(new Double(FosUtil
										.getCellValueFor2007(COL_FIRST, row,
												evaluator)));
						String endDateExl = FosUtil.getStringDate(date);
						endDate = endDateExl;
					}

					// 资产总计
					String assetAmountExl = FosUtil.getCellValueFor2007(
							COL_THREE, row, evaluator).trim();
					if (fileRow[i] == 60) {
						assetAmount = assetAmountExl;
						if (assetAmount == null || "".equals(assetAmount)) {
							errorMsg.append("资产总计为空，无法进行导入。<br>");
							continue;
						}
					}

					// 负债总计
					String debtTotalExl = FosUtil.getCellValueFor2007(
							COL_SEVEN, row, evaluator).trim();
					if (fileRow[i] == 36) {
						debtTotal = debtTotalExl;
						if (debtTotal == null || "".equals(debtTotal)) {
							errorMsg.append("负债总计为空，无法进行导入。<br>");
							continue;
						}
					}

				}
			}
			AssetDebt assetDebt = new AssetDebt();
			if (assetAmount != null && !"".equals(assetAmount)) {
				if (debtTotal != null && !"".equals(debtTotal)) {
					BigDecimal assetAmountNew = new BigDecimal(assetAmount);
					assetDebt.setAssetAmount(assetAmountNew);
					BigDecimal debtTotalNew = new BigDecimal(debtTotal);
					assetDebt.setDebtToatl(debtTotalNew);
					BigDecimal hundrend = new BigDecimal(100);
					BigDecimal zero = new BigDecimal(0);
					if (zero == assetAmountNew) {
						assetDebt.setDebtRatio(zero);
					} else {
						BigDecimal rate = debtTotalNew.divide(assetAmountNew,
								2, BigDecimal.ROUND_HALF_DOWN).multiply(
								hundrend);
						assetDebt.setDebtRatio(rate);
					}
				}
			}
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date endDateNew = df.parse(endDate);
			GregorianCalendar calendar = new GregorianCalendar();
			calendar.setTime(endDateNew);
			int year = calendar.get(Calendar.YEAR);
			int month = calendar.get(Calendar.MONTH) + 1;
			String startDate = String.valueOf(year) + "-"
					+ String.valueOf(month) + "-01";
			Date startDateNew = df.parse(startDate);
			assetDebt.setStartDate(startDateNew);
			assetDebt.setEndDate(endDateNew);
			assetDebt.setFoundDate(new Date());
			List<BaseEntity> datas = new ArrayList<BaseEntity>();
			datas.add(assetDebt);
			InfoBean userInfoBean = new InfoBean();
			userInfoBean.setData(datas);
			userInfoBean.setErrorMsg(errorMsg.toString());
			return userInfoBean;
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error(e.getMessage());
			InfoBean userInfoBean = new InfoBean();
			userInfoBean.setErrorMsg("模版错误，请确认选择模版并认真填写。");
			return userInfoBean;
		}
	}
}
