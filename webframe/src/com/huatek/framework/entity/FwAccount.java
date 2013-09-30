package com.huatek.framework.entity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.huatek.authority.entity.EfwUserDataAuthority;
import com.huatek.authority.factory.FieldAuthority;
import com.huatek.base.entity.BaseEntity;
import com.huatek.base.entity.ProcessBarBean;

public class FwAccount extends BaseEntity implements java.io.Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -2297445333018450643L;

	/** persistent field */
	private String acctName;

	/** persistent field */
	private String acctPwd;
	/** persistent field */
	private String userName;
	/** persistent field */
	private Integer gender;
	/** persistent field */
	private String fullName;

	private FwGroup fwGroup;

	private String position;

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	/** persistent field */
	private String email;
	/** persistent field */
	private String phone;
	/** persistent field */
	private String photo;
	/** persistent field */
	private String randomKey;

	private java.util.Date birthday;

	public java.util.Date getBirthday() {
		return birthday;
	}

	public void setBirthday(java.util.Date birthday) {
		this.birthday = birthday;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	/** nullable persistent field */
	private String describe;

	public FwAccount() {

	}

	/** persistent field */
	private Set<FwAccountDuty> fwAccountDuties;

	public String getAcctName() {
		return this.acctName;
	}

	public void setAcctName(String acctName) {
		this.acctName = acctName;
	}

	public String getAcctPwd() {
		return this.acctPwd;
	}

	public void setAcctPwd(String acctPwd) {
		this.acctPwd = acctPwd;
	}

	public String getDescribe() {
		return this.describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public Set<FwAccountDuty> getFwAccountDuties() {
		return this.fwAccountDuties;
	}

	public void setFwAccountDuties(Set<FwAccountDuty> fwAccountDuties) {
		this.fwAccountDuties = fwAccountDuties;
	}

	/** Tempt save permit table **/
	/**
	 * 存放用户当前系统的操作权限信息.
	 * key=CommonUtil.getURL(url, menuId, method)方法名称
	 * value=FwSrcAction 操作实体
	 */
	HashMap<String, FwSrcAction> permitActionMap;
	/***
	 * 用户菜单权限列表.
	 * key=fwSrcAction.getFwSource().getId().toString()
	 * value=List<FwSrcAction>
	 */
	HashMap<String, List<FwSrcAction>> menusActionMap;


	/***
	 * 可使用的菜单列表.
	 */
	public List<FwSource> permitSourceList;

	public List<FwSource> getPermitSource() {
		return permitSourceList;
	}

	public void setPermitSource(List<FwSource> permitSource) {
		this.permitSourceList = permitSource;
	}
	/***
	 * 显示菜单列表，已经排序.
	 */
	private List<FwSource> userMenuTree;
	/***
	 * 用户菜单Map.
	 * key=menuId
	 * value = FwSource;
	 */
	private Map<String, FwSource> userMenuMap;


	public List<FwSource> getUserMenuTree() {
		return userMenuTree;
	}

	public void setUserMenuTree(List<FwSource> userMenuTree) {
		this.userMenuTree = userMenuTree;
	}

	public String getRandomKey() {
		return randomKey;
	}

	public void setRandomKey(String randomKey) {
		this.randomKey = randomKey;
	}

	public HashMap<String, FwSrcAction> getPermitActionMap() {
		return permitActionMap;
	}

	public void setPermitActionMap(HashMap<String, FwSrcAction> permitActionMap) {
		this.permitActionMap = permitActionMap;
	}

	public List<FwSource> getPermitSourceList() {
		return permitSourceList;
	}

	public void setPermitSourceList(List<FwSource> permitSourceList) {
		this.permitSourceList = permitSourceList;
	}

	public HashMap<String, List<FwSrcAction>> getMenusActionMap() {
		return menusActionMap;
	}

	public void setMenusActionMap(HashMap<String, List<FwSrcAction>> menusActionMap) {
		this.menusActionMap = menusActionMap;
	}

	public Map<String, FwSource> getUserMenuMap() {
		return userMenuMap;
	}

	public void setUserMenuMap(Map<String, FwSource> userMenuMap) {
		this.userMenuMap = userMenuMap;
	}

	/**
	 * 处理进度条.
	 */
	private ProcessBarBean processBarBean;

	/**
	 * 是否开始处理.
	 */
	private boolean isBeginProcess;
	/**
	 *用户权限数据.
	 */
	private Set<EfwUserDataAuthority> efwUserDataAuthoritySet;
	/**
	 * 用户数据权限Map.
	 * **/
	Map<String, Map<String,Map<String,FieldAuthority>>> baseUserAuthorityData;

	/**
	 * 输入的新密码.
	 */
	private String newPwd;
	/**
	 * 输入的确认密码.
	 */
	private String comfirmPwd;
	public ProcessBarBean getProcessBarBean() {
		return processBarBean;
	}
	public void setProcessBarBean(ProcessBarBean processBarBean) {
		this.processBarBean = processBarBean;
	}
	public boolean isBeginProcess() {
		return isBeginProcess;
	}
	public void setBeginProcess(boolean isBeginProcess) {
		this.isBeginProcess = isBeginProcess;
	}
	public Set<EfwUserDataAuthority> getEfwUserDataAuthoritySet() {
		return efwUserDataAuthoritySet;
	}
	public void setEfwUserDataAuthoritySet(
			Set<EfwUserDataAuthority> efwUserDataAuthoritySet) {
		this.efwUserDataAuthoritySet = efwUserDataAuthoritySet;
	}
	public Map<String, Map<String, Map<String, FieldAuthority>>> getBaseUserAuthorityData() {
		return baseUserAuthorityData;
	}
	public void setBaseUserAuthorityData(
			Map<String, Map<String, Map<String, FieldAuthority>>> baseUserAuthorityData) {
		this.baseUserAuthorityData = baseUserAuthorityData;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public String getComfirmPwd() {
		return comfirmPwd;
	}
	public void setComfirmPwd(String comfirmPwd) {
		this.comfirmPwd = comfirmPwd;
	}

	public FwGroup getFwGroup() {
		return fwGroup;
	}

	public void setFwGroup(FwGroup fwGroup) {
		this.fwGroup = fwGroup;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}




}
