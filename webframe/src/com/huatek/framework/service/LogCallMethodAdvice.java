package com.huatek.framework.service;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;

import com.huatek.framework.security.ThreadLocalClient;

public class LogCallMethodAdvice implements java.io.Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = -4226268212038890679L;
	/**
	 * 日志常量.
	 * **/
	private static final Logger LOGGER = Logger
			.getLogger(LogCallMethodAdvice.class);
	private static int kb = 1024;

	static class MethodExecuteInfo implements java.io.Serializable {
		/**
		 *
		 */
		private static final long serialVersionUID = 1L;
		long currentTime;
		long memory;

		public MethodExecuteInfo(long currentTime, long memory) {
			this.currentTime = currentTime;
			this.memory = memory;
		}
	}

	/**
	 * 在方法开始前纪录
	 *
	 * @param jp
	 */
	public void logInfo(JoinPoint jp) {
		String className = jp.getThis().toString();
		String methodName = jp.getSignature().getName(); // 获得方法名
		if (LOGGER.isInfoEnabled()) {
			LOGGER.info("====位于：" + className + " 调用" + methodName + "方法-开始！");
		}
		MethodExecuteInfo methodExecuteInfo = new MethodExecuteInfo(System
				.currentTimeMillis(), Runtime.getRuntime().freeMemory());
		ThreadLocalClient.get().envParamMap.put(className + methodName,
				methodExecuteInfo);
		/*
		 * Object[] args = jp.getArgs(); //获得参数列表 if(args.length <=0){
		 * LOGGER.info("====" +methodName+"方法没有参数"); } else{ for(int i=0;
		 * i<args.length; i++){ LOGGER.info("====参数  " +(i+1)+"："+args[i]); } }
		 */
		// LOGGER.info("=====================================" );
	}

	/**
	 * 在方法结束后纪录
	 *
	 * @param jp
	 */
	public void logInfoAfter(JoinPoint jp) {
		String className = jp.getThis().toString();
		String methodName = jp.getSignature().getName(); // 获得方法名
		Runtime myRun = Runtime.getRuntime();

		MethodExecuteInfo methodExecuteInfo = (MethodExecuteInfo) ThreadLocalClient
				.get().envParamMap.get(className + methodName);
		if (methodExecuteInfo != null) {
			long executeTime = System.currentTimeMillis()
					- methodExecuteInfo.currentTime;
			if (executeTime < 1000) {
				if (LOGGER.isInfoEnabled()) {
					LOGGER.info("====" + methodName + "方法-结束！执行时间为:"
							+ executeTime + "毫秒");
				}
			} else {
				LOGGER.warn("====" + methodName + "方法-结束！执行时间为:" + executeTime
						+ "毫秒");
			}
			long memory = methodExecuteInfo.memory - myRun.freeMemory();
			if (memory < 0) {
				if (LOGGER.isInfoEnabled()) {
					LOGGER.info("====" + methodName + "方法-结束！回收内存为:" + memory
							+ "(Byte)");
				}
			} else if (memory < 1024) {
				if (LOGGER.isInfoEnabled()) {
					LOGGER.info("====" + methodName + "方法-结束！内存增加:" + memory
							+ "(Byte)");
				}
			} else {
				LOGGER.warn("====" + methodName + "方法-结束！内存增加:" + memory / kb
						+ "(KB)");
			}
			ThreadLocalClient.get().envParamMap.remove(className + methodName);
		}
		if (LOGGER.isInfoEnabled()) {
			LOGGER.info("已用内存" + myRun.totalMemory() + "最大内存"
					+ myRun.maxMemory() + "可用内存" + myRun.freeMemory());
		}
		if (myRun.maxMemory() - myRun.totalMemory() < 10485760) {
			LOGGER.warn("警告：可用内存不足10M");
		}
	}
}
