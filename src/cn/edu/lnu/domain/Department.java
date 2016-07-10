package cn.edu.lnu.domain;

import java.io.Serializable;

public class Department implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7718820358413770177L;
	private String departNo;
	private String departName;
	private String departAdrress;
	public String getDepartNo() {
		return departNo;
	}
	public void setDepartNo(String departNo) {
		this.departNo = departNo;
	}
	public String getDepartName() {
		return departName;
	}
	public void setDepartName(String departName) {
		this.departName = departName;
	}
	public String getDepartAdrress() {
		return departAdrress;
	}
	public void setDepartAdrress(String departAdrress) {
		this.departAdrress = departAdrress;
	}

	
}
