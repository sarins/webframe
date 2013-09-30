package com.huatek.base.entity;

/**
 * Simple JavaBean domain object adds a name property to <code>BaseEntity</code>.
 * Used as a base class for objects needing these properties.
 *
 * @author Ken Krebs
 * @author Juergen Hoeller
 */
public class NamedEntity extends BaseEntity implements java.io.Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -9220696973739260991L;
	private String name;


	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

}
