package com.huatek.fos.util;

import java.io.File;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.ss.usermodel.CellValue;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.huatek.framework.exception.BusinessCheckException;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.Parameter;

public class FosUtil {

	/**
	 * 根据当前日期，计算每月的10日，20日或者月末最后一天 日期
	 * 
	 * @param date
	 *            格式：yyyy-MM
	 * @return 指定月份的最大天数
	 */
	public static String getInitDate() throws ParseException {
		SimpleDateFormat monthFormat = new SimpleDateFormat("yyyy-MM");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date nowDate = new Date();
		Date tenDate = format.parse(monthFormat.format(nowDate) + "-10");
		Date twentyDate = format.parse(monthFormat.format(nowDate) + "-20");
		Date nowDateDay = format.parse(format.format(nowDate));
		if (nowDateDay.getTime() <= tenDate.getTime()) {
			return format.format(tenDate);
		} else if (nowDateDay.getTime() > tenDate.getTime()
				&& nowDateDay.getTime() <= twentyDate.getTime()) {
			return format.format(twentyDate);
		} else if (nowDateDay.getTime() > twentyDate.getTime()) {
			int maxDay = getMaxDayFromDate(monthFormat.format(nowDate));
			return monthFormat.format(nowDate) + "-" + maxDay;
		}
		return "";
	}

	/**
	 * 计算每月的最大天数
	 * 
	 * @param date
	 *            格式：yyyy-MM
	 * @return 指定月份的最大天数
	 */
	public static int getMaxDayFromDate(String date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Calendar calendar = GregorianCalendar.getInstance();
		calendar.setTime(sdf.parse(date));
		int monthDay = getMonthLastDay(calendar.get(Calendar.YEAR),
				calendar.get(Calendar.MONTH) + 1);
		return monthDay;
	}

	/**
	 * 根据传入字符串的日期，返回java.util.Date
	 * 
	 * @param date
	 *            格式：yyyy-MM-dd
	 * @return 日期
	 */
	public static Date getInitDate(String date) throws ParseException {
		if (CommonUtil.isZeroLengthTrimString(date)) {
			return null;
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date newDate = format.parse(date);
		return newDate;
	}

	/**
	 * 根据传入对象类型的日期，返回字符串日期
	 * 
	 * @param date
	 *            格式：yyyy-MM-dd
	 * @return 日期
	 */
	public static String getStringDate(Date date) throws ParseException {
		if (date == null) {
			return null;
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String newDate = format.format(date);
		return newDate;
	}

	/**
	 * 计算月份对应的天数.
	 */
	public static String[] getDaysByMonth() {
		Date curDate = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sf.format(curDate);
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, Integer.parseInt(date.substring(0, 4)));
		calendar.set(Calendar.MONTH, Integer.parseInt(date.substring(5, 7)) - 1);
		int maxDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		String[] days = new String[maxDay];
		for (int i = 1; i <= maxDay; i++) {
			String d = String.valueOf(i);
			days[i - 1] = d;
		}
		return days;

	}

	/***
	 * 计算两个日期相隔的天数.
	 * 
	 * @param startDate
	 * @param endDate
	 * @return
	 * @throws ParseException
	 */
	public static int countDays(String startDate, String endDate)
			throws ParseException {
		int days = 0;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date beginDate = df.parse(startDate);
		Date endsDate = df.parse(endDate);

		Calendar c_b = Calendar.getInstance();
		Calendar c_e = Calendar.getInstance();
		c_b.setTime(beginDate);
		c_e.setTime(endsDate);
		while (c_b.before(c_e)) {
			days++;
			c_b.add(Calendar.DAY_OF_YEAR, 1);
		}
		return days;

	}

	/**
	 * 计算每月的初始天数
	 * 
	 * @param year
	 * @param month
	 * 
	 * @return 指定月份的最大天数
	 */
	public static int getMonthLastDay(int year, int month) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month - 1);
		cal.set(Calendar.DATE, 1);// 把日期设置为当月第一天
		cal.roll(Calendar.DATE, -1);// 日期回滚一天，也就是最后一天
		int maxDate = cal.get(Calendar.DATE);
		return maxDate;
	}

	/**
	 * 根据map，key获取金额
	 * 
	 * @param obj
	 * @param key
	 * @return
	 */
	public static BigDecimal getAmountByMapKey(Object obj, String key) {
		String value = "";
		BigDecimal returnVal = new BigDecimal(0.00);
		if (obj != null) {
			HashMap map = (HashMap) obj;
			if (map.get(key) != null && !map.get(key).equals("")) {
				value = map.get(key).toString();
				returnVal = new BigDecimal(value);
			} else {
				value = "";
				returnVal = new BigDecimal("0");
			}
		}
		return returnVal.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	/**
	 * 获得开始日期和结束日期之间每个月的相差天数。 例如： 2012-10-20<-->2012-11-20 相差天数=31
	 * 2012-11-20<-->2012-12-20 相差天数=30 2012-12-20<-->2013-1-20 相差天数=31
	 * 2013-1-20<-->2013-2-20 相差天数=31 2013-2-20<-->2013-3-20 相差天数=28
	 * 
	 * @param startYear
	 *            开始日期 年份
	 * @param startMonth
	 *            开始日期 月份
	 * @param endYear
	 *            结束日期 年份
	 * @param endMonth
	 *            结束日期 月份
	 * @param endInterestDate
	 *            结息日
	 * @return List 间隔日期每月的相差天数list
	 */
	@SuppressWarnings("unchecked")
	public static List getEveryMonthDays(int startYear, int startMonth,
			int endYear, int endMonth, int endInterestDate)
			throws ParseException {
		List<Integer> list = new ArrayList<Integer>();

		int differ_month = 12 * (endYear - startYear) + endMonth - startMonth;// 两个日期相差几个月，即月份差
		String date1 = startYear + "-" + startMonth + "-" + endInterestDate;
		String date2 = "";
		for (int i = 1; i <= differ_month; i++) {
			if (startMonth + 1 > 12) {
				startYear++;
				startMonth = 1;
				date2 = startYear + "-" + startMonth + "-" + endInterestDate;

			} else {
				date2 = startYear + "-" + (startMonth + 1) + "-"
						+ endInterestDate;
				startMonth++;
			}
			if (startMonth == endMonth + 1 && startYear == endYear) {
				break;
			}
			list.add(FosUtil.countDays(date1, date2));
			date1 = date2;
		}
		return list;
	}

	/**
	 * 获取一个季度内的天数总和.
	 * 
	 * @param startYear
	 * @param startMonth
	 * @param endYear
	 * @param endMonth
	 * @param endInterestDate
	 * @return
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	public static List getQuarterDays(int startYear, int startMonth,
			int endYear, int endMonth, int endInterestDate)
			throws ParseException {
		List<Integer> list = new ArrayList<Integer>();
		List<Integer> daysList = FosUtil.getEveryMonthDays(startYear,
				startMonth, endYear, endMonth, endInterestDate);
		int result = 0;
		int size = daysList.size();
		for (int i = 0; i < size; i++) {
			if (size % 3 == 0) {
				result = daysList.get(i) + daysList.get(i + 1)
						+ daysList.get(i + 2);
				i = i + 3;
				list.add(result);
			}
		}
		return list;
	}

	/**
	 * 根据开始日期，结束日期，付息日期获取付息明细时间段list.月付
	 * 
	 * @param startDate
	 * @param endDate
	 * @param payInterestDate
	 * @return
	 * @throws ParseException
	 */
	public static List getPayInterstPeriodDate(String startDate,
			String endDate, String payInterestDate) throws ParseException {
		List<String> list = new ArrayList<String>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate1 = sdf.parse(startDate);
		// 开始日期转成 Calendar类型，并且获取到开始日期的年和月
		GregorianCalendar beginCalendar = new GregorianCalendar();
		beginCalendar.setTime(startDate1);
		int startYear = beginCalendar.get(Calendar.YEAR);
		int startMonth = beginCalendar.get(Calendar.MONTH) + 1;
		// 结束日期转成Calendar类型，并且获取到结束日期的年和月
		Date endDate1 = sdf.parse(endDate);
		GregorianCalendar endCalendar = new GregorianCalendar();
		endCalendar.setTime(endDate1);
		int endYear = endCalendar.get(Calendar.YEAR);
		int endMonth = endCalendar.get(Calendar.MONTH) + 1;
		// 获取到两个日期相差的月份
		int differ_month = 12 * (endYear - startYear) + endMonth - startMonth;
		boolean flag = false;
		// 定义一个变动的开始日期.
		Date startDateChange = startDate1;
		for (int i = 0; i <= differ_month; i++) {
			Calendar cd = Calendar.getInstance();
			cd.setTime(startDateChange);
			cd.add(Calendar.MONTH, i); // 增加一个月,第一条起始日期加0
			int tempYear = cd.get(Calendar.YEAR);
			int tempMonth = cd.get(Calendar.MONTH) + 1;
			int tempDay = cd.get(Calendar.DAY_OF_MONTH);
			// 如果开始日期的天小于付息日的话
			if (tempDay <= Integer.parseInt(payInterestDate)) {
				String tempStartDate = tempYear + "-" + tempMonth + "-"
						+ tempDay;
				String tempEndDate = tempYear + "-" + tempMonth + "-"
						+ payInterestDate;
				// 如果结息日大于合同结束日期的话，就把合同结束日期作为结息日
				if (sdf.parse(tempEndDate).compareTo(endDate1) > 0) {
					tempEndDate = endDate;
				}
				list.add(tempStartDate + "~" + tempEndDate);
				// 上次的结息日加一为下次的开始日期
				startDateChange = sdf.parse(tempYear + "-" + tempMonth + "-"
						+ (Integer.parseInt(payInterestDate) + 1));
				flag = true;
			} else {
				// 如果
				String tempStartDate = tempYear + "-" + tempMonth + "-"
						+ tempDay;
				cd.add(Calendar.MONTH, 1);
				Date nextMonth = cd.getTime();
				cd.setTime(nextMonth);
				int nextMonthYear = cd.get(Calendar.YEAR);
				int nextMonthMonth = cd.get(Calendar.MONTH) + 1;
				String tempEndDate = nextMonthYear + "-" + nextMonthMonth + "-"
						+ payInterestDate;
				if (sdf.parse(tempEndDate).compareTo(endDate1) > 0) {
					tempEndDate = endDate;
				}
				list.add(tempStartDate + "~" + tempEndDate);
				startDateChange = sdf.parse(nextMonthYear + "-"
						+ nextMonthMonth + "-"
						+ (Integer.parseInt(payInterestDate) + 1));
				flag = true;
			}
			if (flag) {
				i--;
			}
			// 比较开始日期和结束日期
			if (startDateChange.compareTo(endDate1) > 0) {
				break;
			}
		}
		return list;

	}

	public static List getPaymentIntestQuaterPeriod(String startDate,
			String endDate, String payInterestDate) throws ParseException {
		List<String> list = new ArrayList<String>();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate1 = df.parse(startDate);
		// 开始日期转成Calendar类型，并且获取到开始日期的年，月
		GregorianCalendar begainCalendar = new GregorianCalendar();
		begainCalendar.setTime(startDate1);
		int startYear = begainCalendar.get(Calendar.YEAR);
		int startMonth = begainCalendar.get(Calendar.MONTH) + 1;
		// 结束日期转成Calendar类型，并且获取到结束日期的年，月
		Date endDate1 = df.parse(endDate);
		GregorianCalendar endCalendar = new GregorianCalendar();
		endCalendar.setTime(endDate1);
		int endYear = endCalendar.get(Calendar.YEAR);
		int endMonth = endCalendar.get(Calendar.MONTH) + 1;
		// 计算开始日期，结束日期相差的月份
		int diff_month = 12 * (endYear - startYear) + endMonth - startMonth;
		// 定义一个变动的开始日期.
		Date startDateChange = startDate1;
		Calendar cd = Calendar.getInstance();
		cd.setTime(startDateChange);
		int tempYear = cd.get(Calendar.YEAR);
		int tempMonth = cd.get(Calendar.MONTH) + 1;
		int tempDay = cd.get(Calendar.DAY_OF_MONTH);
		String tempStartDate;
		String tempEndDate;
		boolean flag = false;
		if (diff_month % 3 == 0) {
			int diffMonthValue = diff_month / 3 + 1;
			if (tempDay < Integer.parseInt(payInterestDate)) {
				if (tempMonth == 3 || tempMonth == 6 || tempMonth == 9
						|| tempMonth == 12) {
					tempStartDate = tempYear + "-" + tempMonth + "-" + tempDay;
					cd.add(Calendar.MONTH, 0);
					Date nextDate = cd.getTime();
					cd.setTime(nextDate);
					int nextMonthYear = cd.get(Calendar.YEAR);
					int nextMonthMonth = cd.get(Calendar.MONTH) + 1;
					tempEndDate = nextMonthYear + "-" + nextMonthMonth + "-"
							+ payInterestDate;
					if (df.parse(tempEndDate).compareTo(endDate1) > 0) {
						tempEndDate = endDate;
					}
					list.add(tempStartDate + "~" + tempEndDate);
					startDateChange = df.parse(nextMonthYear + "-"
							+ nextMonthMonth + "-"
							+ (Integer.parseInt(payInterestDate) + 1));
				}
			}
			for (int i = 0; i < diffMonthValue; i++) {
				if (tempDay <= Integer.parseInt(payInterestDate)) {
					if (tempMonth == 1 || tempMonth == 2 || tempMonth == 3) {
						tempStartDate = tempYear + "-" + tempMonth + "-"
								+ tempDay;
						cd.add(Calendar.MONTH, 3);
						Date nextDate = cd.getTime();
						cd.setTime(nextDate);
						int nextMonthYear = cd.get(Calendar.YEAR);
						int nextMonthMonth = cd.get(Calendar.MONTH) + 1;
						tempEndDate = nextMonthYear + "-" + nextMonthMonth
								+ "-" + payInterestDate;
						if (df.parse(tempEndDate).compareTo(endDate1) > 0) {
							tempEndDate = endDate;
						}
						list.add(tempStartDate + "~" + tempEndDate);
						startDateChange = df.parse(nextMonthYear + "-"
								+ nextMonthMonth + "-"
								+ (Integer.parseInt(payInterestDate) + 1));
					}
					if (tempMonth == 4 || tempMonth == 5 || tempMonth == 6) {
						tempStartDate = tempYear + "-" + tempMonth + "-"
								+ tempDay;
						cd.add(Calendar.MONTH, 3);
						Date nextDate = cd.getTime();
						cd.setTime(nextDate);
						int nextMonthYear = cd.get(Calendar.YEAR);
						int nextMonthMonth = cd.get(Calendar.MONTH) + 1;
						tempEndDate = nextMonthYear + "-" + nextMonthMonth
								+ "-" + payInterestDate;
						if (df.parse(tempEndDate).compareTo(endDate1) > 0) {
							tempEndDate = endDate;
						}
						list.add(tempStartDate + "~" + tempEndDate);
						startDateChange = df.parse(nextMonthYear + "-"
								+ nextMonthMonth + "-"
								+ (Integer.parseInt(payInterestDate) + 1));
					}
					if (tempMonth == 7 || tempMonth == 8 || tempMonth == 9) {
						tempStartDate = tempYear + "-" + tempMonth + "-"
								+ tempDay;
						cd.add(Calendar.MONTH, 3);
						Date nextDate = cd.getTime();
						cd.setTime(nextDate);
						int nextMonthYear = cd.get(Calendar.YEAR);
						int nextMonthMonth = cd.get(Calendar.MONTH) + 1;
						tempEndDate = nextMonthYear + "-" + nextMonthMonth
								+ "-" + payInterestDate;
						if (df.parse(tempEndDate).compareTo(endDate1) > 0) {
							tempEndDate = endDate;
						}
						list.add(tempStartDate + "~" + tempEndDate);
						startDateChange = df.parse(nextMonthYear + "-"
								+ nextMonthMonth + "-"
								+ (Integer.parseInt(payInterestDate) + 1));
					}
					if (tempMonth == 10 || tempMonth == 11 || tempMonth == 12) {
						tempStartDate = tempYear + "-" + tempMonth + "-"
								+ tempDay;
						cd.add(Calendar.MONTH, 3);
						Date nextDate = cd.getTime();
						cd.setTime(nextDate);
						int nextMonthYear = cd.get(Calendar.YEAR);
						int nextMonthMonth = cd.get(Calendar.MONTH) + 1;
						tempEndDate = nextMonthYear + "-" + nextMonthMonth
								+ "-" + payInterestDate;
						if (df.parse(tempEndDate).compareTo(endDate1) > 0) {
							tempEndDate = endDate;
						}
						list.add(tempStartDate + "~" + tempEndDate);
						startDateChange = df.parse(nextMonthYear + "-"
								+ nextMonthMonth + "-"
								+ (Integer.parseInt(payInterestDate) + 1));
					}
					flag = true;
				} else {
					if (tempMonth == 1 || tempMonth == 2 || tempMonth == 3) {
						tempStartDate = tempYear + "-" + tempMonth + "-"
								+ tempDay;
						tempEndDate = tempYear + "-" + "03" + "-"
								+ payInterestDate;
						if (df.parse(tempEndDate).compareTo(endDate1) > 0) {
							tempEndDate = endDate;
						}
						list.add(tempStartDate + "~" + tempEndDate);
						startDateChange = df.parse(tempYear + "-" + "03" + "-"
								+ (Integer.parseInt(payInterestDate) + 1));
					}
					if (tempMonth == 4 || tempMonth == 5 || tempMonth == 6) {
						tempStartDate = tempYear + "-" + tempMonth + "-"
								+ tempDay;
						tempEndDate = tempYear + "-" + "06" + "-"
								+ payInterestDate;
						if (df.parse(tempEndDate).compareTo(endDate1) > 0) {
							tempEndDate = endDate;
						}
						list.add(tempStartDate + "~" + tempEndDate);
						startDateChange = df.parse(tempYear + "-" + "06" + "-"
								+ (Integer.parseInt(payInterestDate) + 1));
					}
					if (tempMonth == 7 || tempMonth == 8 || tempMonth == 9) {
						tempStartDate = tempYear + "-" + tempMonth + "-"
								+ tempDay;
						tempEndDate = tempYear + "-" + "09" + "-"
								+ payInterestDate;
						if (df.parse(tempEndDate).compareTo(endDate1) > 0) {
							tempEndDate = endDate;
						}
						list.add(tempStartDate + "~" + tempEndDate);
						startDateChange = df.parse(tempYear + "-" + "09" + "-"
								+ (Integer.parseInt(payInterestDate) + 1));
					}
					if (tempMonth == 10 || tempMonth == 11 || tempMonth == 12) {
						tempStartDate = tempYear + "-" + tempMonth + "-"
								+ tempDay;
						cd.add(Calendar.MONTH, 3);
						Date nextDate = cd.getTime();
						cd.setTime(nextDate);
						int nextMonthYear = cd.get(Calendar.YEAR);
						int nextMonthMonth = cd.get(Calendar.MONTH) + 1;
						tempEndDate = nextMonthYear + "-" + nextMonthMonth
								+ "-" + payInterestDate;
						if (df.parse(tempEndDate).compareTo(endDate1) > 0) {
							tempEndDate = endDate;
						}
						list.add(tempStartDate + "~" + tempEndDate);
						startDateChange = df.parse(nextMonthYear + "-"
								+ nextMonthMonth + "-"
								+ (Integer.parseInt(payInterestDate) + 1));
					}
					if (flag) {
						i--;
					}
					// 比较开始日期和结束日期
					if (startDateChange.compareTo(endDate1) > 0) {
						break;
					}
				}

			}

		}

		return list;
	}

	/***
	 * 获取当前日期所在月份的季度，并取到之后的11个季度
	 * 
	 * @return
	 */
	public static List<Object> getQuarterValueFromNow() {
		List<Object> quaterValuesList = new ArrayList<Object>();
		Calendar c = Calendar.getInstance();
		int y = c.get(Calendar.YEAR);
		int m = c.get(Calendar.MONTH) + 1; // 月份
		int s; // 季度
		for (int i = 0; i < 12; i++) {
			s = (m - 1) / 3 + 1;
			;
			int em = s * 3; // 获取到下个季度的最后一个月
			if (s > 4) {
				y = y + 1;
				s = 1;
			}
			if (em > 12) {
				em = 3;

			}
			m = em + 1;
			quaterValuesList.add(y + "年" + s + "季度");

		}
		return quaterValuesList;

	}

	public static void main(String args[]) throws ParseException {
		List<Object> list = getPayInterstPeriodDateByQuater("2013-03-18",
				"2014-3-10", "20");
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
	}

	/**
	 * 根据开始日期，结束日期得到季付的list.
	 * 
	 * @param startDate
	 * @param endDate
	 * @param payInterestDate
	 * @return
	 * @throws ParseException
	 */
	public static List getPayInterstPeriodDateByQuater(String startDate,
			String endDate, String payInterestDate) throws ParseException {
		List<String> list = new ArrayList<String>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate1 = sdf.parse(startDate);
		// 开始日期转成 Calendar类型，并且获取到开始日期的年和月
		GregorianCalendar beginCalendar = new GregorianCalendar();
		beginCalendar.setTime(startDate1);
		int startYear = beginCalendar.get(Calendar.YEAR);
		int startMonth = beginCalendar.get(Calendar.MONTH) + 1;
		// 结束日期转成Calendar类型，并且获取到结束日期的年和月
		Date endDate1 = sdf.parse(endDate);
		GregorianCalendar endCalendar = new GregorianCalendar();
		endCalendar.setTime(endDate1);
		int endYear = endCalendar.get(Calendar.YEAR);
		int endMonth = endCalendar.get(Calendar.MONTH) + 1;
		// 获取到两个日期相差的月份
		int differ_month = 12 * (endYear - startYear) + endMonth - startMonth;
		boolean flag = false;
		// 定义一个变动的开始日期.
		Date startDateChange = startDate1;

		Date testStart = startDate1;
		boolean testFlag = false;
		for (int i = 0; i <= differ_month; i++) {
			Calendar cd = Calendar.getInstance();
			cd.setTime(startDateChange);
			cd.add(Calendar.MONTH, i); // 增加一个月,第一条起始日期加0
			int tempYear = cd.get(Calendar.YEAR);
			int tempMonth = cd.get(Calendar.MONTH) + 1;
			int tempDay = cd.get(Calendar.DAY_OF_MONTH);
			// 如果开始日期的天小于付息日的话
			if (tempDay <= Integer.parseInt(payInterestDate)) {
				String tempStartDate = tempYear + "-" + tempMonth + "-"
						+ tempDay;
				String tempEndDate = tempYear + "-" + tempMonth + "-"
						+ payInterestDate;
				// 如果结息日大于合同结束日期的话，就把合同结束日期作为结息日
				if (sdf.parse(tempEndDate).compareTo(endDate1) > 0) {
					tempEndDate = endDate;
				}
				if (tempMonth == 3 || tempMonth == 6 || tempMonth == 9
						|| tempMonth == 12) {
					list.add(sdf.format(testStart) + "~" + tempEndDate);
					cd.setTime(sdf.parse(tempEndDate));
					cd.add(Calendar.DAY_OF_MONTH, 1);
					testStart = cd.getTime();
				} else {
					// 当前结算结束日期=实际结束日期
					if (tempEndDate.equals(endDate)) {
						list.add(sdf.format(testStart) + "~" + tempEndDate);
					}
				}
				startDateChange = sdf.parse(tempYear + "-" + tempMonth + "-"
						+ (Integer.parseInt(payInterestDate) + 1));

				flag = true;
			} else {
				// 如果
				String tempStartDate = tempYear + "-" + tempMonth + "-"
						+ tempDay;
				cd.add(Calendar.MONTH, 1);
				Date nextMonth = cd.getTime();
				cd.setTime(nextMonth);
				int nextMonthYear = cd.get(Calendar.YEAR);
				int nextMonthMonth = cd.get(Calendar.MONTH) + 1;
				String tempEndDate = nextMonthYear + "-" + nextMonthMonth + "-"
						+ payInterestDate;
				if (sdf.parse(tempEndDate).compareTo(endDate1) > 0) {
					tempEndDate = endDate;
				}
				if (nextMonthMonth == 3 || nextMonthMonth == 6
						|| nextMonthMonth == 9 || nextMonthMonth == 12) {
					list.add(sdf.format(testStart) + "~" + tempEndDate);
					cd.setTime(sdf.parse(tempEndDate));
					cd.add(Calendar.DAY_OF_MONTH, 1);
					testStart = cd.getTime();
				} else {
					// 当前结算结束日期=实际结束日期
					if (tempEndDate.equals(endDate)) {
						list.add(sdf.format(testStart) + "~" + tempEndDate);
					}
				}
				startDateChange = sdf.parse(nextMonthYear + "-"
						+ nextMonthMonth + "-"
						+ (Integer.parseInt(payInterestDate) + 1));

				flag = true;
			}
			if (flag) {
				i--;
			}
			// 比较开始日期和结束日期
			if (startDateChange.compareTo(endDate1) > 0) {
				break;
			}
		}
		return list;

	}

	/**
	 * 获取Excel2003单元格内容字符串.
	 * 
	 * @param column
	 *            单元格的X坐标值.
	 * @param row
	 *            Excel单元个所在行对象.
	 * @return 返回单元格内容字符串.
	 */
	public static String getCellValueFor2003(final int column, final HSSFRow row) {
		HSSFCell cell = row.getCell((short) column);

		if (cell == null) {
			return "";
		}

		if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
			return cell.getRichStringCellValue().getString().trim();
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
			return String.valueOf(cell.getNumericCellValue()).trim();
		}
		return "";
	}

	/**
	 * 获取Excel2007单元格内容字符串.
	 * 
	 * @param column
	 *            单元格的X坐标值.
	 * @param row
	 *            Excel单元个所在行对象.
	 * @return 返回单元格内容字符串.
	 */
	/*
	 * public static String getCellValueFor2007(final int column, final XSSFRow
	 * row) { XSSFCell cell = row.getCell((short) column);
	 * 
	 * if (cell == null) { return ""; }
	 * 
	 * if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING) { return
	 * cell.getRichStringCellValue().getString().trim(); } else if
	 * (cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC) { return
	 * String.valueOf(cell.getNumericCellValue()).trim(); } return ""; }
	 */

	/**
	 * 获取Excel2007单元格内容字符串.
	 * 
	 * @param column
	 *            单元格的X坐标值.
	 * @param row
	 *            Excel单元个所在行对象.
	 * @return 返回单元格内容字符串.
	 */
	public static String getCellValueFor2007(final int column,
			final XSSFRow row, FormulaEvaluator evaluator) {
		XSSFCell cell = row.getCell((short) column);
		if (cell == null) {
			return "";
		}
		CellValue cellValue = evaluator.evaluate(cell);
		String value = null;
		if (cellValue != null) {
			switch (cellValue.getCellType()) {
			case HSSFCell.CELL_TYPE_FORMULA: {
				value = cellValue.getStringValue();
				break;
			}
			case HSSFCell.CELL_TYPE_NUMERIC: {
				value = String.valueOf(cellValue.getNumberValue());
				break;
			}
			case HSSFCell.CELL_TYPE_STRING:
				value = cellValue.getStringValue();
				break;
			}
		} else {
			value = "";
		}

		return value;
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

		String directory = Parameter.getInstance().getProp()
				.getProperty("upload.dir");
		File copyPath = new File(directory);
		if (!copyPath.isDirectory()) {
			if (!copyPath.mkdirs()) {
				throw new BusinessRuntimeException("错误: 创建目录:" + copyPath
						+ " 失败!");
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
		if (!ext.equalsIgnoreCase("xlsx")) {
			throw new BusinessCheckException("上传文件格式不对,只支持xlsx格式");
		}

		return filePath;
	}
}
