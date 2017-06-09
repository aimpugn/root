package com.photovel.vo;

public class Good {
	private int contentId;
	private User user;
	
	public int getContentId() {
		return contentId;
	}
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public String toString() {
		return "Good [contentId=" + contentId + ", user=" + user + "]";
	}
}