package com.huatek.framework.entity;

import com.huatek.base.entity.BaseEntity;

public class FwActionCnt extends BaseEntity implements java.io.Serializable {

	private static final long serialVersionUID = -6134589995072498636L;

	/** persistent field */
	private String actCnt;


	/** persistent field */
	private FwActionLog fwActionLog;

	private Long businessId;

	private Long businessModule;

	/** default constructor */
	public FwActionCnt() {
	}

	public FwActionCnt(String logContent){
		/*
		try {
            this.actCnt = Hibernate.createClob(new String(logContent.getBytes(Parameter.getInstance().getProp().getProperty("database.clob.column.charset", "utf-8"))));
        } catch (UnsupportedEncodingException e) {
           throw new BusinessRuntimeException("UnsupportedEncodingException",e);
        }*/
		this.actCnt = logContent;
	}

	public String getActCnt() {
		return this.actCnt;
	}

	public String getActContent() {
		/*try {
			return getActCnt().getSubString(1L, (int)getActCnt().length());
		} catch (SQLException e) {
			return "";
		}*/
		return this.actCnt;
	}

	public void setActCnt(String actCnt) {
		this.actCnt = actCnt;
	}

	public FwActionLog getFwActionLog() {
		return this.fwActionLog;
	}

	public void setFwActionLog(FwActionLog fwActionLog) {
		this.fwActionLog = fwActionLog;
	}


	public Long getBusinessId() {
		return businessId;
	}

	public void setBusinessId(Long businessId) {
		this.businessId = businessId;
	}

	public Long getBusinessModule() {
		return businessModule;
	}

	public void setBusinessModule(Long businessModule) {
		this.businessModule = businessModule;
	}

}
