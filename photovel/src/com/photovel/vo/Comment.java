package com.photovel.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Comment {
	private int contentId;
	private int commentId;
	private String commentContent;
	private Date commentDate;
	private User user;
	
	public int getContentId() {
		return contentId;
	}
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	@JsonSerialize(using = com.photovel.common.DateJsonSerializer.class)
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Comment [contentId=" + contentId + ", commentId=" + commentId + ", commentContent=" + commentContent
				+ ", commentDate=" + commentDate + ", user=" + user + "]";
	}
}