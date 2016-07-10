package cn.edu.lnu.domain;

import java.io.Serializable;
import java.sql.Date;

public class Staff implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8069110293603341470L;
	private String staffId;
	private String staffName;
	private String staffEmail;
	private String StaffPhone;
	private Date entryTime;
	private float staffPay;
	private String deptNo;
	private String jobId;
	
	private String deptName;
	private String jobName;
	
	public String getStaffId() {
		return staffId;
	}
	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getStaffEmail() {
		return staffEmail;
	}
	public void setStaffEmail(String staffEmail) {
		this.staffEmail = staffEmail;
	}
	public String getStaffPhone() {
		return StaffPhone;
	}
	public void setStaffPhone(String staffPhone) {
		StaffPhone = staffPhone;
	}
	public Date getEntryTime() {
		return entryTime;
	}
	public void setEntryTime(Date entryTime) {
		this.entryTime = entryTime;
	}
	public float getStaffPay() {
		return staffPay;
	}
	public void setStaffPay(float staffPay) {
		this.staffPay = staffPay;
	}
	public String getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}
	public String getJobId() {
		return jobId;
	}
	public void setJobId(String jobId) {
		this.jobId = jobId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
}
