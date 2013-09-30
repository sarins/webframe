package com.huatek.framework.security;

import java.util.Iterator;

import com.huatek.framework.entity.FwAccountDuty;

public class GlobalFilterManagement {
	/***
	 * 如果是超级管理员，显示所有用户组数据。
	 * 如果不是超级管理员，隐藏掉超级管理员数据。
	 * 系统角色和系统用户组ID不能变更。系统用户组为1和2，系统角色为1.
	 * @param aliaName SQL别名.
	 * @return 返回用户组的过滤条件.
	 */
	public static String getSystemGroupFilter(String aliaName){
		if(ThreadLocalClient.get()!=null &&
				ThreadLocalClient.get().getOperator()!=null){

			Iterator<FwAccountDuty> fwDutyIterator =  ThreadLocalClient.get().getOperator().getFwAccountDuties().iterator();
			while(fwDutyIterator.hasNext()){
				if(fwDutyIterator.next().getFwDuty().getId()==1){
					return " 1=1";
				}
			}
		}
		return " "+aliaName+".fwGroup.id>=2";
	}

	public static String getGroupFilter(String aliaName){
        if(ThreadLocalClient.get()!=null &&
                ThreadLocalClient.get().getOperator()!=null){

            Iterator<FwAccountDuty> fwDutyIterator =  ThreadLocalClient.get().getOperator().getFwAccountDuties().iterator();
            while(fwDutyIterator.hasNext()){
                if(fwDutyIterator.next().getFwDuty().getId()==1){
                    return " 1=1";
                }
            }
        }
        return " "+aliaName+".id>=2";
    }
}
