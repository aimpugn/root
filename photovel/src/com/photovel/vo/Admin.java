package com.photovel.vo;

import java.util.Date;

public class Admin {

    private String admin_id;

    private String admin_password;

    private String admin_nickname;

    private String admin_state_flag;
    
    private Date admin_sign_date;

	public Admin() {
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_password() {
		return admin_password;
	}

	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}

	public String getAdmin_nickname() {
		return admin_nickname;
	}

	public void setAdmin_nickname(String admin_nickname) {
		this.admin_nickname = admin_nickname;
	}

	public String getAdmin_state_flag() {
		return admin_state_flag;
	}

	public void setAdmin_state_flag(String admin_state_flag) {
		this.admin_state_flag = admin_state_flag;
	}

	public Date getAdmin_sign_date() {
		return admin_sign_date;
	}

	public void setAdmin_sign_date(Date admin_sign_date) {
		this.admin_sign_date = admin_sign_date;
	}

	@Override
	public String toString() {
		return "admin_id" + admin_id + ", admin_password" + admin_password + ", admin_nickname"
				+ admin_nickname + ", admin_state_flag" + admin_state_flag + ", admin_sign_date" + admin_sign_date
				;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((admin_id == null) ? 0 : admin_id.hashCode());
		result = prime * result + ((admin_nickname == null) ? 0 : admin_nickname.hashCode());
		result = prime * result + ((admin_password == null) ? 0 : admin_password.hashCode());
		result = prime * result + ((admin_sign_date == null) ? 0 : admin_sign_date.hashCode());
		result = prime * result + ((admin_state_flag == null) ? 0 : admin_state_flag.hashCode());
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
		if (admin_id == null) {
			if (other.admin_id != null)
				return false;
		} else if (!admin_id.equals(other.admin_id))
			return false;
		if (admin_nickname == null) {
			if (other.admin_nickname != null)
				return false;
		} else if (!admin_nickname.equals(other.admin_nickname))
			return false;
		if (admin_password == null) {
			if (other.admin_password != null)
				return false;
		} else if (!admin_password.equals(other.admin_password))
			return false;
		if (admin_sign_date == null) {
			if (other.admin_sign_date != null)
				return false;
		} else if (!admin_sign_date.equals(other.admin_sign_date))
			return false;
		if (admin_state_flag == null) {
			if (other.admin_state_flag != null)
				return false;
		} else if (!admin_state_flag.equals(other.admin_state_flag))
			return false;
		return true;
	}

}

   