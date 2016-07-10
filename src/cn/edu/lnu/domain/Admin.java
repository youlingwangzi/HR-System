package cn.edu.lnu.domain;

public class Admin {
	private int adminId;
	private String adminNameString;
	private String password;
	private int adminAuthority;
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getAdminNameString() {
		return adminNameString;
	}
	public void setAdminNameString(String adminNameString) {
		this.adminNameString = adminNameString;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getAdminAuthority() {
		return adminAuthority;
	}
	public void setAdminAuthority(int adminAuthority) {
		this.adminAuthority = adminAuthority;
	}

}
