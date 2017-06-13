package com.photovel.vo;

import java.util.Date;

public class Admin {

    private String adminId;

    private String adminPassword;

    private String adminNickName;

    private String adminStatusFlag;
    
    private Date adminSignDate;

	public Admin() {
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public String getAdminNickName() {
		return adminNickName;
	}

	public void setAdminNickName(String adminNickName) {
		this.adminNickName = adminNickName;
	}

	public String getAdminStatusFlag() {
		return adminStatusFlag;
	}

	public void setAdminStatusFlag(String adminStatusFlag) {
		this.adminStatusFlag = adminStatusFlag;
	}

	public Date getAdminSignDate() {
		return adminSignDate;
	}

	public void setAdminSignDate(Date adminSignDate) {
		this.adminSignDate = adminSignDate;
	}

	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminPassword=" + adminPassword + ", adminNickName=" + adminNickName
				+ ", adminStatusFlag=" + adminStatusFlag + ", adminSignDate=" + adminSignDate + "]";
	}
	
}

   