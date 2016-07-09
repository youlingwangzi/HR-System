package cn.edu.lnu.domain;

import java.io.Serializable;

public class Department implements Serializable {
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
