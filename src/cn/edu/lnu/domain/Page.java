package cn.edu.lnu.domain;

import java.io.Serializable;
import java.util.List;

public class Page implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7015152395580180154L;
	@SuppressWarnings("rawtypes")
	private List list;
	private int currentPage;
	private int totalNumber;
	private int totalPage;
	
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	@SuppressWarnings("rawtypes")
	public List getList() {
		return list;
	}
	@SuppressWarnings("rawtypes")
	public void setList(List list) {
		this.list = list;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalNumber() {
		return totalNumber;
	}
	public void setTotalNumber(int totalNember) {
		this.totalNumber = totalNember;
	}
}
