package com.huatek.framework.extend;

import java.util.Comparator;

@SuppressWarnings("unchecked")
public class GroupComparator implements Comparator,java.io.Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 1159785472386113679L;

	public int compare(Object group1, Object group2) {
	/*	FwGroup fwGroup_1 = (FwGroup)group1;
		FwGroup fwGroup_2 = (FwGroup)group2;
		int styleComp = fwGroup_1.getStyle().compareTo(fwGroup_2.getStyle());
		return styleComp;*/
		return 1;
	}

}
