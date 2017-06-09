package com.photovel.vo;

public class Permission {
	private User user;
	private int friendRecomFlag;
	private int friendSearchFlag;
	private int feedFlag;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getFriendRecomFlag() {
		return friendRecomFlag;
	}
	public void setFriendRecomFlag(int friendRecomFlag) {
		this.friendRecomFlag = friendRecomFlag;
	}
	public int getFriendSearchFlag() {
		return friendSearchFlag;
	}
	public void setFriendSearchFlag(int friendSearchFlag) {
		this.friendSearchFlag = friendSearchFlag;
	}
	public int getFeedFlag() {
		return feedFlag;
	}
	public void setFeedFlag(int feedFlag) {
		this.feedFlag = feedFlag;
	}
	
	@Override
	public String toString() {
		return "Permission [user=" + user + ", friendRecomFlag=" + friendRecomFlag + ", friendSearchFlag="
				+ friendSearchFlag + ", feedFlag=" + feedFlag + "]";
	}

	
}