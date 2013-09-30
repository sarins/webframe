package com.huatek.base.entity;

public class ProcessBarBean implements java.io.Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	String taskName;
	long totalNum;

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public long getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(long totalNum) {
		this.totalNum = totalNum;
	}

	public long getFinishedNum() {
		return finishedNum;
	}

	public void setFinishedNum(long finishedNum) {
		this.finishedNum = finishedNum;
	}

	long finishedNum;

	public ProcessBarBean() {

	}

	public ProcessBarBean(String taskName, long totalNum, long finishedNum) {
		this.taskName = taskName;
		this.totalNum = totalNum;
		this.finishedNum = finishedNum;
	}

}
