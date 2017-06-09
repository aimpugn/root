package com.photovel.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class User {
	private String userId;
	private String userPassword;
	private String userNickName;
	private String userGender;
	private int userPhone1;
	private int userPhone2;
	private String userProfilePhoto;
	private Date userSignDate;
	private String userStateFlag;
	private Date userLastConnection;
	private String userSnsStatus;
	private String userSnsToken;
	private String userPushToken;
	private int userFriendCount;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public int getUserPhone1() {
		return userPhone1;
	}
	public void setUserPhone1(int userPhone1) {
		this.userPhone1 = userPhone1;
	}
	public int getUserPhone2() {
		return userPhone2;
	}
	public void setUserPhone2(int userPhone2) {
		this.userPhone2 = userPhone2;
	}
	public String getUserProfilePhoto() {
		return userProfilePhoto;
	}
	public void setUserProfilePhoto(String userProfilePhoto) {
		this.userProfilePhoto = userProfilePhoto;
	}
	@JsonSerialize(using = com.photovel.common.DateJsonSerializer.class)
	public Date getUserSignDate() {
		return userSignDate;
	}
	public void setUserSignDate(Date userSignDate) {
		this.userSignDate = userSignDate;
	}
	public String getUserStateFlag() {
		return userStateFlag;
	}
	public void setUserStateFlag(String userStateFlag) {
		this.userStateFlag = userStateFlag;
	}
	@JsonSerialize(using = com.photovel.common.DateJsonSerializer.class)
	public Date getUserLastConnection() {
		return userLastConnection;
	}
	public void setUserLastConnection(Date userLastConnection) {
		this.userLastConnection = userLastConnection;
	}
	public String getUserSnsStatus() {
		return userSnsStatus;
	}
	public void setUserSnsStatus(String userSnsStatus) {
		this.userSnsStatus = userSnsStatus;
	}
	public String getUserSnsToken() {
		return userSnsToken;
	}
	public void setUserSnsToken(String userSnsToken) {
		this.userSnsToken = userSnsToken;
	}
	public String getUserPushToken() {
		return userPushToken;
	}
	public void setUserPushToken(String userPushToken) {
		this.userPushToken = userPushToken;
	}
	public int getUserFriendCount() {
		return userFriendCount;
	}
	public void setUserFriendCount(int userFriendCount) {
		this.userFriendCount = userFriendCount;
	}
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPassword=" + userPassword + ", userNickName=" + userNickName
				+ ", userGender=" + userGender + ", userPhone1=" + userPhone1 + ", userPhone2=" + userPhone2
				+ ", userProfilePhoto=" + userProfilePhoto + ", userSignDate=" + userSignDate + ", userStateFlag="
				+ userStateFlag + ", userLastConnection=" + userLastConnection + ", userSnsStatus=" + userSnsStatus
				+ ", userSnsToken=" + userSnsToken + ", userPushToken=" + userPushToken + ", userFriendCount="
				+ userFriendCount + "]";
	}
}