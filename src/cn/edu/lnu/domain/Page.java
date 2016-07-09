package cn.edu.lnu.domain;

import java.io.Serializable;
import java.util.List;

public class Page implements Serializable {
	private List list;
	private int currentPage;
	private int totalNember;
	private int totalPage;
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalNember() {
		return totalNember;
	}
	public void setTotalNember(int totalNember) {
		this.totalNember = totalNember;
	}
}
