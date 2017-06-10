package com.photovel.vo;

public class Admin {

    private String adminId;

    private String adminPassword;

    private String adminNickName;

    private String adminStatusFlag;

	public String getAdminUserId() {
		return adminId;
	}

	public void setAdminUserId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminUserPassword() {
		return adminPassword;
	}

	public void setAdminUserPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public String getAdminUserNickName() {
		return adminNickName;
	}

	public void setAdminUserNickName(String adminUserNickName) {
		this.adminNickName = adminUserNickName;
	}

	public String getadminUserStatusFlag() {
		return adminStatusFlag;
	}

	public void setadminUserStatusFlag(String adminStatusFlag) {
		this.adminStatusFlag = adminStatusFlag;
	}

	@Override
	public String toString() {
		return "adminId=" + adminId + ", adminPassword=" + adminPassword
				+ ", adminNickName=" + adminNickName + ", adminStatusFlag=" + adminStatusFlag;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((adminId == null) ? 0 : adminId.hashCode());
		result = prime * result + ((adminNickName == null) ? 0 : adminNickName.hashCode());
		result = prime * result + ((adminPassword == null) ? 0 : adminPassword.hashCode());
		result = prime * result + ((adminStatusFlag == null) ? 0 : adminStatusFlag.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Admin other = (Admin) obj;
		if (adminId == null) {
			if (other.adminId != null)
				return false;
		} else if (!adminId.equals(other.adminId))
			return false;
		if (adminNickName == null) {
			if (other.adminNickName != null)
				return false;
		} else if (!adminNickName.equals(other.adminNickName))
			return false;
		if (adminPassword == null) {
			if (other.adminPassword != null)
				return false;
		} else if (!adminPassword.equals(other.adminPassword))
			return false;
		if (adminStatusFlag == null) {
			if (other.adminStatusFlag != null)
				return false;
		} else if (!adminStatusFlag.equals(other.adminStatusFlag))
			return false;
		return true;
	}

    
}

   