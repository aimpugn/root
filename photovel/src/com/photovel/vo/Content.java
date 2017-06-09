package com.photovel.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Content {
	private int contentId;
	private String contentSubject;
	private String content;
	private Date contentWrittenDate;
	private String contentPrivateFlag;
	private String contentDeleteStatus;
	private int contentWarningStatus;
	private int contentShareCount;
	private int goodCount;
	private int commentCount;
	private int contentDetailCount;
	private User user;
	private Advertisement advertisement;
	private List<Comment> comments;
	private List<ContentDetail> details;
	public int getContentId() {
		return contentId;
	}
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	public String getContentSubject() {
		return contentSubject;
	}
	public void setContentSubject(String contentSubject) {
		this.contentSubject = contentSubject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@JsonSerialize(using = com.photovel.common.DateJsonSerializer.class)
	public Date getContentWrittenDate() {
		return contentWrittenDate;
	}
	public void setContentWrittenDate(Date contentWrittenDate) {
		this.contentWrittenDate = contentWrittenDate;
	}
	public String getContentPrivateFlag() {
		return contentPrivateFlag;
	}
	public void setContentPrivateFlag(String contentPrivateFlag) {
		this.contentPrivateFlag = contentPrivateFlag;
	}
	public String getContentDeleteStatus() {
		return contentDeleteStatus;
	}
	public void setContentDeleteStatus(String contentDeleteStatus) {
		this.contentDeleteStatus = contentDeleteStatus;
	}
	public int getContentWarningStatus() {
		return contentWarningStatus;
	}
	public void setContentWarningStatus(int contentWarningStatus) {
		this.contentWarningStatus = contentWarningStatus;
	}
	public int getContentShareCount() {
		return contentShareCount;
	}
	public void setContentShareCount(int contentShareCount) {
		this.contentShareCount = contentShareCount;
	}
	public int getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getContentDetailCount() {
		return contentDetailCount;
	}
	public void setContentDetailCount(int contentDetailCount) {
		this.contentDetailCount = contentDetailCount;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Advertisement getAdvertisement() {
		return advertisement;
	}
	public void setAdvertisement(Advertisement advertisement) {
		this.advertisement = advertisement;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public List<ContentDetail> getDetails() {
		return details;
	}
	public void setDetails(List<ContentDetail> details) {
		this.details = details;
	}
	@Override
	public String toString() {
		return "Content [contentId=" + contentId + ", contentSubject=" + contentSubject + ", content=" + content
				+ ", contentWrittenDate=" + contentWrittenDate + ", contentPrivateFlag=" + contentPrivateFlag
				+ ", contentDeleteStatus=" + contentDeleteStatus + ", contentWarningStatus=" + contentWarningStatus
				+ ", contentShareCount=" + contentShareCount + ", goodCount=" + goodCount + ", commentCount="
				+ commentCount + ", contentDetailCount=" + contentDetailCount + ", user=" + user + ", advertisement="
				+ advertisement + ", comments=" + comments + ", details=" + details + "]";
	}
}