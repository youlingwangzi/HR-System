package cn.edu.lnu.domain;

import java.io.Serializable;

public class Department implements Serializable {
	private String departName;

	public String getDepartName() {
		return departName;
	}

	public void setDepartName(String departName) {
		this.departName = departName;
	}
	
}
