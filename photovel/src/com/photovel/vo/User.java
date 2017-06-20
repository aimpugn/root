package com.photovel.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class User {
	@JsonProperty("user_id")
	private String user_id;
	private String user_password;
	private String user_nick_name;
	private String user_gender;
	private int user_phone1;
	private String user_phone2;
	private String user_profile_photo;
	private Date user_sign_date;
	private String user_state_flag;
	private Date user_last_connection;
	private String user_sns_status;
	private String user_sns_token;
	private String user_push_token;
	private int user_friend_count;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_nick_name() {
		return user_nick_name;
	}
	public void setUser_nick_name(String user_nick_name) {
		this.user_nick_name = user_nick_name;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public int getUser_phone1() {
		return user_phone1;
	}
	public void setUser_phone1(int user_phone1) {
		this.user_phone1 = user_phone1;
	}
	public String getUser_phone2() {
		return user_phone2;
	}
	public void setUser_phone2(String user_phone2) {
		this.user_phone2 = user_phone2;
	}
	public String getUser_profile_photo() {
		return user_profile_photo;
	}
	public void setUser_profile_photo(String user_profile_photo) {
		this.user_profile_photo = user_profile_photo;
	}
	@JsonSerialize(using = com.photovel.common.DateJsonSerializer.class)
	public Date getUser_sign_date() {
		return user_sign_date;
	}
	public void setUser_sign_date(Date user_sign_date) {
		this.user_sign_date = user_sign_date;
	}
	public String getUser_state_flag() {
		return user_state_flag;
	}
	public void setUser_state_flag(String user_state_flag) {
		this.user_state_flag = user_state_flag;
	}
	@JsonSerialize(using = com.photovel.common.DateJsonSerializer.class)
	public Date getUser_last_connection() {
		return user_last_connection;
	}
	public void setUser_last_connection(Date user_last_connection) {
		this.user_last_connection = user_last_connection;
	}
	public String getUser_sns_status() {
		return user_sns_status;
	}
	public void setUser_sns_status(String user_sns_status) {
		this.user_sns_status = user_sns_status;
	}
	public String getUser_sns_token() {
		return user_sns_token;
	}
	public void setUser_sns_token(String user_sns_token) {
		this.user_sns_token = user_sns_token;
	}
	public String getUser_push_token() {
		return user_push_token;
	}
	public void setUser_push_token(String user_push_token) {
		this.user_push_token = user_push_token;
	}
	public int getUser_friend_count() {
		return user_friend_count;
	}
	public void setUser_friend_count(int user_friend_count) {
		this.user_friend_count = user_friend_count;
	}
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_password=" + user_password + ", user_nick_name=" + user_nick_name
				+ ", user_gender=" + user_gender + ", user_phone1=" + user_phone1 + ", user_phone2=" + user_phone2
				+ ", user_profile_photo=" + user_profile_photo + ", user_sign_date=" + user_sign_date
				+ ", user_state_flag=" + user_state_flag + ", user_last_connection=" + user_last_connection
				+ ", user_sns_status=" + user_sns_status + ", user_sns_token=" + user_sns_token + ", user_push_token="
				+ user_push_token + ", user_friend_count=" + user_friend_count + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + user_friend_count;
		result = prime * result + ((user_gender == null) ? 0 : user_gender.hashCode());
		result = prime * result + ((user_id == null) ? 0 : user_id.hashCode());
		result = prime * result + ((user_last_connection == null) ? 0 : user_last_connection.hashCode());
		result = prime * result + ((user_nick_name == null) ? 0 : user_nick_name.hashCode());
		result = prime * result + ((user_password == null) ? 0 : user_password.hashCode());
		result = prime * result + user_phone1;
		result = prime * result + ((user_phone2 == null) ? 0 : user_phone2.hashCode());
		result = prime * result + ((user_profile_photo == null) ? 0 : user_profile_photo.hashCode());
		result = prime * result + ((user_push_token == null) ? 0 : user_push_token.hashCode());
		result = prime * result + ((user_sign_date == null) ? 0 : user_sign_date.hashCode());
		result = prime * result + ((user_sns_status == null) ? 0 : user_sns_status.hashCode());
		result = prime * result + ((user_sns_token == null) ? 0 : user_sns_token.hashCode());
		result = prime * result + ((user_state_flag == null) ? 0 : user_state_flag.hashCode());
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
		User other = (User) obj;
		if (user_friend_count != other.user_friend_count)
			return false;
		if (user_gender == null) {
			if (other.user_gender != null)
				return false;
		} else if (!user_gender.equals(other.user_gender))
			return false;
		if (user_id == null) {
			if (other.user_id != null)
				return false;
		} else if (!user_id.equals(other.user_id))
			return false;
		if (user_last_connection == null) {
			if (other.user_last_connection != null)
				return false;
		} else if (!user_last_connection.equals(other.user_last_connection))
			return false;
		if (user_nick_name == null) {
			if (other.user_nick_name != null)
				return false;
		} else if (!user_nick_name.equals(other.user_nick_name))
			return false;
		if (user_password == null) {
			if (other.user_password != null)
				return false;
		} else if (!user_password.equals(other.user_password))
			return false;
		if (user_phone1 != other.user_phone1)
			return false;
		if (user_phone2 == null) {
			if (other.user_phone2 != null)
				return false;
		} else if (!user_phone2.equals(other.user_phone2))
			return false;
		if (user_profile_photo == null) {
			if (other.user_profile_photo != null)
				return false;
		} else if (!user_profile_photo.equals(other.user_profile_photo))
			return false;
		if (user_push_token == null) {
			if (other.user_push_token != null)
				return false;
		} else if (!user_push_token.equals(other.user_push_token))
			return false;
		if (user_sign_date == null) {
			if (other.user_sign_date != null)
				return false;
		} else if (!user_sign_date.equals(other.user_sign_date))
			return false;
		if (user_sns_status == null) {
			if (other.user_sns_status != null)
				return false;
		} else if (!user_sns_status.equals(other.user_sns_status))
			return false;
		if (user_sns_token == null) {
			if (other.user_sns_token != null)
				return false;
		} else if (!user_sns_token.equals(other.user_sns_token))
			return false;
		if (user_state_flag == null) {
			if (other.user_state_flag != null)
				return false;
		} else if (!user_state_flag.equals(other.user_state_flag))
			return false;
		return true;
	}
	
	
}