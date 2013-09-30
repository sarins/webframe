package com.huatek.fos.assetdebtmanagement.service;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import com.huatek.base.service.BaseServiceImpl;
import com.huatek.fos.basemanagement.entity.hibernate.AssetInformation;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;

/**
 * 地区服务接口实现类.
 * 
 * @author Allen_Huang
 * 
 */
public class AssetDebtServiceImpl extends BaseServiceImpl implements
		AssetDebtService {

	/**
	 * 根据参数查询分页数据.
	 * 
	 * @param pageBean
	 *            分页对象
	 * @param paramterList
	 *            参数列表
	 * @return 分页结果对象
	 */
	public CutPageBean getAssetDebtPageBean(final CutPageBean pageBean,
			final List<CommonBean> paramterList) {

		// 为了拼接检索条件方便，加入一个永远为真的条件
		String queryCondition = " 1=1 ";

		// 数据总条数HQL
		String totalRowsHsql = "select count(t) from AssetDebt t where "
				+ queryCondition;

		// 查询页面HQL
		String resultSql = "from AssetDebt t where " + queryCondition;

		// 返回查询结果
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.id desc", pageBean, paramterList);
	}

	/**
	 * 根据参数查询分页数据.
	 * 
	 * @param pageBean
	 *            分页对象
	 * @param paramterList
	 *            参数列表
	 * @return 分页结果对象
	 * @throws ParseException
	 */
	public List getAssetDebtPageBeanInformation() throws ParseException {
		String querySql = "from AssetDebt t order by t.id desc";
		return hibernateTemplate.find(querySql);
	}

	/**
	 * 
	 * @param type
	 *            ：分类 参数列表
	 * @return 分页结果对象
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	public List<AssetInformation> getAssetUserTypeInfo(final String type)
			throws ParseException {
		String timeLimit = this.getCurrDateFrom1To12();
		String twoDate[] = timeLimit.split("~");
		String startDate = twoDate[0];
		String endDate = twoDate[1];
		return hibernateTemplate
				.find("from AssetInformation t where t.userType= '" + type
						+ "' and t.startDate>=TO_DATE('" + startDate
						+ "','YYYY-MM-DD') and t.endDate <= TO_DATE('"
						+ endDate + "','YYYY-MM-DD')");
	}

	/**
	 * 用于刷新缓存数据.
	 * 
	 * @param isLocalNode
	 *            如果是集群刷新，则判断是否是本节点.
	 * **/
	public void flushCahche(final boolean isLocalNode) {

	}

	/**
	 * 获取融资总金额 .
	 * 
	 * @return
	 */
	@Override
	public List getFinancingTotalAmountFromFinancing() throws ParseException {
		String timeLimit = this.getCurrDateFrom1To12();
		String twoDate[] = timeLimit.split("~");
		String startDate = twoDate[0];
		String endDate = twoDate[1];
		String hSql = "select nvl(sum(t.financingMoney),0) from FinancingDetail t where t.isNewest='1' and t.startDate >= TO_DATE('"
				+ startDate
				+ "','YYYY-MM-DD')  and t.endDate <=  TO_DATE('"
				+ endDate + "','YYYY-MM-DD')";
		return hibernateTemplate.find(hSql);

	}

	public String getCurrDateFrom1To12() {
		Date currDate = new Date();
		GregorianCalendar calendar = new GregorianCalendar();
		calendar.setTime(currDate);
		int year = calendar.get(Calendar.YEAR);
		String startDate = String.valueOf(year) + "-01-01";
		String endDate = String.valueOf(year) + "-12-31";
		return startDate + "~" + endDate;

	}

	/**
	 * 获取担保总金额 .
	 * 
	 * @return
	 */
	@Override
	public List getSecurityTotalAmountFrom() throws ParseException {
		String timeLimit = this.getCurrDateFrom1To12();
		String twoDate[] = timeLimit.split("~");
		String startDate = twoDate[0];
		String endDate = twoDate[1];
		String hSql = "select nvl(sum(t.securityMoney),0) from SecurityAuthorization t where t.eventInitialDate >= TO_DATE('"
				+ startDate
				+ "','YYYY-MM-DD')  or t.eventEndDate <=  TO_DATE('"
				+ endDate
				+ "','YYYY-MM-DD')";
		return hibernateTemplate.find(hSql);

	}
}
