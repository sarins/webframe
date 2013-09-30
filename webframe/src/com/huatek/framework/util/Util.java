package com.huatek.framework.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import org.apache.log4j.Logger;
import org.springframework.context.HierarchicalMessageSource;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.huatek.base.entity.BaseEntity;
import com.huatek.framework.entity.FwAccountDuty;
import com.huatek.framework.entity.FwSrcAction;
import com.huatek.framework.exception.BusinessCheckException;
import com.huatek.framework.exception.BusinessLogicException;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.tag.CommonBean;
import com.huatek.zip.ZipEntry;
import com.huatek.zip.ZipInputStream;

/**
 * 该类是项目中常用到的一些公共方法.
 *
 * @author winner pan
 */
public class Util {
	/**
	 * 一次读取的字节数.
	 * **/
	private static final int READ_BYTE_ONCE = 1024;
	/**
	 * 日志常量.
	 */
	private static final Logger LOGGER = Logger.getLogger(Util.class);


	/**
	 * 默认的私有的构造函数，不能生成新的实例.
	 * **/
	private Util() {

	}
	/***
	 *
	 * @param result
	 * @param formName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String getErrorMsgInfo(final BindingResult result, final String formName){
		List<FieldError> errors = result.getFieldErrors();
		StringBuffer buffer = new StringBuffer();
		if(result.getGlobalErrorCount()>0){
			for(int i=0;i<result.getGlobalErrorCount();i++){
				if(i>0){
					buffer.append("；");
				}
				buffer.append(((ObjectError)result.getGlobalErrors().get(i)).getCodes()[1]);
			}
		}
		HierarchicalMessageSource messageSource = (HierarchicalMessageSource)SpringContext.getBean("messageSource");
		if (messageSource == null) {
			for (int i = 0; i < errors.size(); i++) {
				if (buffer.length() > 0) {
					buffer.append("； ");
				}
				buffer.append("\"" + errors.get(i).getField()).append(
						"\":\"").append(errors.get(i).getDefaultMessage())
						.append("\"");
			}
		} else {
			Locale locale = ThreadLocalClient.get().getLocale();
			for (int i = 0; i < errors.size(); i++) {
				String errorInfo = null;

				try {
					String errorCode = errors.get(i).getCode();
					if("typeMismatch".equals(errorCode)){
						String defaultMessage = errors.get(i).getDefaultMessage();
						if(defaultMessage.indexOf("[")>0&&defaultMessage.indexOf("]")>0){
							errorCode = errorCode+"."+defaultMessage.substring(defaultMessage.lastIndexOf("[")+1,
							defaultMessage.lastIndexOf("]"));
						}
					}
					errorInfo = messageSource.getMessage(errorCode, errors.get(i).getArguments(),
							locale);
				} catch (Exception e) {
					LOGGER.warn("Can not find the message resource " + locale
							+ " for " + errors.get(i).getCode());
					errorInfo = errors.get(i).getDefaultMessage();
				}
				if (formName != null) {
					String messageInfo = null;
					String fieldMessage = formName + "."
							+ errors.get(i).getField() + ".displayName";
					try {
						messageInfo = messageSource.getMessage(
								fieldMessage, null, locale);
					} catch (Exception e) {
						LOGGER.warn("Can not find the message resource "
								+ locale + " for  " + fieldMessage);
						messageInfo = errors.get(i).getField();
					}
					errorInfo = messageInfo + errorInfo;
				}
				if (buffer.length() > 0) {
					buffer.append("； ");
				}
				buffer.append(errorInfo);
			}
		}
		return buffer.toString();
	}

	/**
	 *判断客户端请求是否是Ajax请求.
	 *
	 * @param request
	 *            servlet内置对象.
	 * @return 返回是或否
	 */
	public static boolean isAjaxRequest(final HttpServletRequest request) {
		String header = request.getHeader("X-Requested-With");
		return "XMLHttpRequest".equals(header);
	}


	/**
	 * 解压ZIP文件方法.
	 *
	 * @param zipFileName
	 *            压缩文件.
	 * @param outputDirectory
	 *            解压目录.
	 * @return List 返回解压的文件列表.
	 * @throws Exception
	 *             抛出异常
	 */
	public static List<File> unzip(final String zipFileName,
			final String outputDirectory) throws Exception {

		if (zipFileName.equalsIgnoreCase(".zip")) {
			throw new BusinessCheckException("解压文件格式不正确！");
		}

		List<File> files = new ArrayList<File>();

		File outputFile = new File(outputDirectory);
		if (!outputFile.exists()) {
			if (!outputFile.mkdirs()) {
				throw new BusinessLogicException("创建解压文件目录失败！");
			}
		}

		ZipInputStream zis = null;
		FileOutputStream fos = null;
		try {
			zis = new ZipInputStream(new FileInputStream(zipFileName));
			ZipEntry entry = null;
			while ((entry = zis.getNextEntry()) != null) {

				String entryName = UUID.randomUUID() + "_" + entry.getName();

				// 文件夹
				if (entry.isDirectory()) {
					File directory = new File(outputDirectory, entryName);
					if (!directory.exists()) {
						if (!directory.mkdir()) {
							throw new BusinessLogicException("创建解压文件目录失败！");
						}
					}
				}

				// 文件
				if (!entry.isDirectory()) {

					File temp = new File(outputDirectory + "/" + entryName);

					fos = new FileOutputStream(temp);

					byte[] buf = new byte[READ_BYTE_ONCE];

					int length = 0;
					while ((length = zis.read(buf)) > 0) {
						fos.write(buf, 0, length);
					}

					files.add(temp);
				}

			}
		} finally {
			if (fos != null) {
				fos.close();
			}
			if (zis != null) {
				zis.close();
			}
			// 删除解压文件
			new File(zipFileName).deleteOnExit();
		}

		return files;
	}




	/**
	 * 根据对象获取字符串.
	 *
	 * @param obj
	 *            输入对象.
	 * @return String
	 */
	public static String getString(final Object obj) {
		if (obj == null) {
			return "";
		}
		return obj.toString().trim();
	}

	/**
	 * 根据对象获取整数.
	 *
	 * @param obj
	 *            输入对象.
	 * @return Integer
	 */
	public static int getInteger(final Object obj) {
		if (obj == null || obj.equals("")) {
			return 0;
		}
		return Integer.valueOf(obj.toString()).intValue();
	}

	/**
	 * 根据对象获取大精度数据对象.
	 *
	 * @param obj
	 *            输入对象.
	 * @return Integer
	 */
	public static BigDecimal getBigDecimal(final Object obj) {
		if (obj == null|| obj.equals("")) {
			return new BigDecimal("0");
		}
		return new BigDecimal(obj.toString());
	}

	/**
	 * 根据数据ID获取数据列表中的对象.
	 *
	 * @param datas
	 *            数据列表.
	 * @param id
	 *            查询ID.
	 * @return 返回查询的数据对象.
	 */
	public static BaseEntity getObject(final List<? extends BaseEntity> datas,
			final Long id) {
		if (datas == null || id == null) {
			return null;
		}
		for (int i = 0; i < datas.size(); i++) {
			if (datas.get(i).getId().intValue() == id.intValue()) {
				return datas.get(i);
			}
		}
		return null;
	}

	/**
	 * 根据数据输入域获取参数对象CommonBean.
	 *
	 * @param paramterList
	 *            参数对象列表.
	 * @param name
	 *            查询的域名称(不带ht_).
	 * @return 返回查询的数据对象.
	 */
	public static CommonBean getParamCommonBean(
			final List<CommonBean> paramterList, final String name) {
		if (paramterList == null || paramterList.size() == 0) {
			return null;
		}
		for (int i = 0; i < paramterList.size(); i++) {
			if (paramterList.get(i).getName().equals(name)) {
				return paramterList.get(i);
			}
		}
		return null;
	}

	/**
	 * 根据ID判断是否有操作权限.
	 *
	 * @param actionId
	 *            操作ID.
	 *@return boolean
	 * **/
	public static boolean isPermitAction(final long actionId) {
		List<FwSrcAction> actions = ThreadLocalClient.get().getPermitAction();
		for (int i = 0; i < actions.size(); i++) {
			if (actions.get(i).getId() == actionId) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 向客户端浏览器输出字符串.
	 *
	 * @param response
	 *            servlet内置对象.
	 *@param outputStr
	 *            需要输出的字符串.
	 *@throws IOException
	 *             输出报错信息.
	 * **/
	public static String printString(final String outputStr) {
		HttpServletRequest request =((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		request.setAttribute(Constant.AJAX_OUT_DATA, outputStr);
		return "frame/out_data.jsp";
	}
	/**
	 * 向客户端浏览器输出字符串.
	 *
	 * @param response
	 *            servlet内置对象.
	 *@param outputStr
	 *            需要输出的字符串.
	 *@throws IOException
	 *             输出报错信息.
	 * **/
	public static String printErrorString(final String outputStr) {
		HttpServletRequest request =((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		request.setAttribute(Constant.AJAX_ERROR, "true");
		request.setAttribute(Constant.AJAX_OUT_DATA, outputStr);
		return "frame/out_data.jsp";
	}

	/**
	 * 根据页面变量名，获取页面上JSTL中的变量的数值.
	 *
	 * @param pageContext
	 *            页面内置对象.
	 *@param name
	 *            页面上JSTL变量名
	 *@return 返回变量名的值
	 * **/
	public static String getParamValue(final PageContext pageContext,
			final String name) {
		String satrribute = pageContext.findAttribute(name).toString();
		String value = pageContext.getRequest().getParameter(satrribute);
		if (value == null || value.trim().length() == 0) {
			return "";
		}
		return value;
	}

	/**
	 * 根据页面变量名，获取页面上JSTL中的变量的数值.
	 *
	 * @param pageContext
	 *            页面内置对象.
	 *@param name
	 *            页面上JSTL变量名
	 *@return 返回变量名的值
	 * **/
	public static BigDecimal getBigDecimal(final PageContext pageContext,
			final String name) {
		String value = null;
		if (pageContext.findAttribute(name) == null) {
			value = "1";
		} else {
			value = pageContext.findAttribute(name).toString();
		}
		return new BigDecimal(value);
	}

	/**
	 * 根据页面变量名，获取页面上Request中的变量的数值.
	 *
	 * @param request
	 *            页面内置对象.
	 *@param name
	 *            页面变量名
	 *@return 返回变量名的值
	 * **/
	public static String getParamValue(final HttpServletRequest request,
			final String name) {
		String value = request.getParameter(name);
		if (value == null || value.trim().length() == 0) {
			return "";
		}
		return value;
	}

	/**
	 * 根据文件路径下载文件.
	 *
	 * @param response
	 *            Servlet 内置对象.
	 * @param fileName
	 *            文件路径
	 * @return 返回是否下载
	 * @throws BusinessCheckException
	 *             抛出错误信息.
	 */
	public static boolean downloadFile(final HttpServletResponse response,
			final String fileName) throws BusinessCheckException {
		// 获取系统配置路径
		String dataPath = "";
		File exportDataFloder = new File(dataPath);
		if (!exportDataFloder.exists()) {
			throw new BusinessRuntimeException("系统设置中'指定基础数据导出目录'地址不存在.");
		}
		if (!dataPath.endsWith("/") || dataPath.endsWith("\\")) {
			dataPath = dataPath + "/";
		}
		File file = new File(dataPath + fileName);
		if (!file.exists()) {
			return false;
		}
		try {
			FileInputStream fileStream = new FileInputStream(file);
			int i = fileStream.available();
			byte[] data = new byte[i];
			fileStream.read(data);
			fileStream.close();
			response.reset();
			response.setContentType("application/octet-stream"); // 设置返回的文件类型
			response.setHeader("Content-Disposition", "attachment; filename=\""
					+ file.getName() + "\"");
			ServletOutputStream toClient = response.getOutputStream(); // 得到向客户端输出二进制数据的对象
			toClient.write(data); // 输出数据
			toClient.flush();
			toClient.close();
		} catch (IOException ex) {
			LOGGER.error(ex.getMessage());
			throw new BusinessCheckException("下载文件出错！");
		}
		return true;
	}

	/**
	 * 指定角色在访问指定资源时,如果该资源存在于资源黑名单中，不可访问.
	 *
	 * @param roles
	 *            指定角色
	 * @param sources
	 *            资源黑名单
	 * @param target
	 *            访问目标资源ID
	 * @return boolean
	 */
	public static boolean checkCurrentUserRoleCode(final String[] roles,
			final String[] sources, final String target) {
		Set<FwAccountDuty> duties = ThreadLocalClient.get().getOperator()
				.getFwAccountDuties();
		Iterator<FwAccountDuty> iterator = duties.iterator();
		FwAccountDuty accountDuty = null;
		while (iterator.hasNext()) {
			accountDuty = iterator.next();
			boolean isRole = false;
			for (int i = 0; i < roles.length; i++) {
				if (accountDuty.getFwDuty().getId().toString().equals(roles[i])) {
					isRole = true;
				}
			}
			if (isRole) {
				for (int k = 0; k < sources.length; k++) {
					if (target.equals(sources[k])) {
						return false;
					}
				}
			}
		}
		return true;
	}

	/**
	 * 获取上传文件路径.
	 *
	 * @param uploadFile
	 *            上传文件
	 * @return 文件路径
	 * @throws Exception
	 *             错误信息
	 */
	public static String getUploadPath(final MultipartFile uploadFile)
			throws Exception {

		String directory = Parameter.getInstance().getProp().getProperty(
				"upload.dir");
		File copyPath = new File(directory);
		if (!copyPath.isDirectory()) {
			if(!copyPath.mkdirs()){
				throw new BusinessRuntimeException("错误: 创建目录:"+copyPath+" 失败!");
			}
		}
		// 获取上传文件名称
		String uploadFileName = uploadFile.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String dateStr = sdf.format(new Date());
		// 获取放置上传文件路径
		File uploadPath = new File(copyPath + "/" + dateStr);
		if (!uploadPath.isDirectory()) {
			if (!uploadPath.mkdirs()) {
				throw new BusinessCheckException("上传文件目录不存在");
			}
		}
		// 拷贝上传文件到指定文件目录
		String filePath = uploadPath + "/" + uploadFileName;
		FileCopyUtils.copy(uploadFile.getBytes(), new File(filePath));
		// 得到上传文件后缀名
		String ext = uploadFileName.substring(
				uploadFileName.lastIndexOf(".") + 1).toLowerCase();

		// 解压ZIP文件格式
		if (!ext.equalsIgnoreCase("xls")) {
			throw new BusinessCheckException("上传文件格式不对,只支持xls格式");
		}

		return filePath;
	}

	/**
	 * 判断参数是否是Number型
	 * @param str 参数
	 * @return 返回真和假
	 */
    public static boolean isNumeric(String str) {
        for (int i = str.length(); --i >= 0;) {
            if (!Character.isDigit(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }
	/**
	 * 判断字符串是否匹配正则表达式.
	 *
	 *@param aimStr
	 *            目标字符串
	 *@param regex
	 *            正则表达式
	 *@return 匹配结果(true:匹配, false:不匹配)
	 * **/
	public static boolean getMatchResult(final String aimStr, final String regex) {
  		 Pattern pattern = Pattern.compile(regex);
  		 Matcher matcher = pattern.matcher(aimStr);
  		 return matcher.matches();
	}

	/***
	 * 把数组转为字符串.
	 * @param objs 输入的数组
	 * @return 返回字符串
	 */
	public static String getStringFromArray(final Long[] objs){
		if(objs==null||objs.length==0){
			return "";
		}
		StringBuffer strBf = new StringBuffer(objs[0]+"");
		for(int i=1;i<objs.length;i++){
			strBf.append(",").append(objs[i]+"");
		}
		return strBf.toString();
	}
	/***
	 * 把数组转为字符串.
	 * @param objs 输入的数组
	 * @return 返回字符串
	 */
	public static String getStringFromArray(final long[] objs){
		if(objs==null||objs.length==0){
			return "";
		}
		StringBuffer strBf = new StringBuffer(objs[0]+"");
		for(int i=1;i<objs.length;i++){
			strBf.append(",").append(objs[i]+"");
		}
		return strBf.toString();
	}
    /**
     * 按指定长度截断字符串
     * @param s
     * @param size
     * @return
     */
    public static String substring(final String sourceStr, int size) {
        String s=sourceStr;
    	if (size <= 0) {
            return "";
        }
        else if (s == null || s.getBytes().length <= size) {
            return s;
        }

        int index = 0;
        byte[] bs = s.getBytes();
        if ((bs[size] >> 7) == 0x0 || ((bs[size] >> 6) & 0x03) == 0x03) {
            index = size;
        }
        else {
            for (int i = size - 1; i >= 0; i--) {
                if (((bs[i] >> 6) & 0x03) == 0x03) {
                    index = i;
                    break;
                }
            }
        }
        return new String(Arrays.copyOf(s.getBytes(), index));
    }


    static final String SEARCH_KEY = "new Ext.grid.TableGrid(";
	static int  searchKeyLen = SEARCH_KEY.length();
    public static void main(String[] args) throws IOException{
    	String dirs = "c:\\logs\\";//"D:\\workspace3.4\\ops2\\WebContent\\WEB-INF\\jsp\\ops2";
    	File director = new File(dirs);
    	FileWriter requestContentFile = new FileWriter(dirs+"request.txt");

    	for(File file:director.listFiles()){
    		if(file.getName().startsWith("ops2.")){
    			BufferedReader input = new BufferedReader(new FileReader(file));
    			String line = null;
    			while((line = input.readLine())!=null){
    				if(line.indexOf("请求访问:/")>0){
    					line = line.substring(0,line.indexOf("INFO"))+"\t"+line.substring(line.indexOf(":/")+2)+"\n";
    					requestContentFile.write(line);
    				}

    			}
    			input.close();
    		}
    	}
    	requestContentFile.close();


    }

    public static String getAssignedLengthStr(String sourceStr, int assignedLength){
    	return substring(sourceStr,assignedLength);
    }

	public static File logFile(String data, Date recDate, String fileName)throws IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String filePath = Parameter.getInstance().getProp().getProperty(
		"upload.dir")+ File.separator+sdf.format(recDate);
		File dir = new File(filePath);
		if(!dir.exists()){
			if(!dir.mkdirs()){
				throw new IOException("Creation directory "+filePath+" is  failure.");
			}
		}
		File file = new File(filePath+File.separator+fileName);
		FileWriter fileWriter = new FileWriter(file);
		fileWriter.write(data);
		fileWriter.close();
		return file;
	}

	public static String getFileContent(String fileName, Date recDate){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String filePath = Parameter.getInstance().getProp().getProperty(
		"upload.dir")+ File.separator+sdf.format(recDate);
		File dir = new File(filePath);
		if(!dir.exists()){
			throw new BusinessRuntimeException("该文件目录不存在:"+dir.getPath());
		}
		File file = new File(filePath+File.separator+fileName);
		byte[] fileContentByte = null;
		FileInputStream inStream = null;
		try {
			inStream = new FileInputStream(file);
			fileContentByte = new byte[inStream.available()];
			inStream.read(fileContentByte);
			return new String(fileContentByte);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(inStream!=null){
				try {
					inStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	public static void deleteFile(String fileName, Date recDate){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String filePath = Parameter.getInstance().getProp().getProperty(
		"upload.dir")+ File.separator+sdf.format(recDate);
		File file = new File(filePath+File.separator+fileName);
		file.deleteOnExit();
	}


}
