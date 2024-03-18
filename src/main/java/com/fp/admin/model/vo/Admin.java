package com.fp.admin.model.vo;

public class Admin {
	
	private int adminNo;
	private String adminId;
	private String adminPwd;
	private String adminName;
	private String adminPhone;
	private String status;
	
	public Admin() {}

	public Admin(int adminNo, String adminId, String adminPwd, String adminName, String adminPhone, String status) {
		super();
		this.adminNo = adminNo;
		this.adminId = adminId;
		this.adminPwd = adminPwd;
		this.adminName = adminName;
		this.adminPhone = adminPhone;
		this.status = status;
	}
	
	

	public Admin(String adminId, String adminPwd, String adminName, String adminPhone) {
		super();
		this.adminId = adminId;
		this.adminPwd = adminPwd;
		this.adminName = adminName;
		this.adminPhone = adminPhone;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPwd() {
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPhone() {
		return adminPhone;
	}

	public void setAdminPhone(String adminPhone) {
		this.adminPhone = adminPhone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Admin [adminNo=" + adminNo + ", adminId=" + adminId + ", adminPwd=" + adminPwd + ", adminName="
				+ adminName + ", adminPhone=" + adminPhone + ", status=" + status + "]";
	}
	
	

}
