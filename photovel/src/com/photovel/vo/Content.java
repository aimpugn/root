package com.photovel.vo;

import java.util.Date;

public class Content {

    private Integer contentId;

    private String userId;

    private String contentSubject;

    private String content;

    private Date contentWrittenDate;

    private String contentPrivateFlag;

    private String contentDeleteStatus;

    private Integer contentWarningStatus;

    private Integer adId;

    private Integer contentShareCount;

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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

    public Integer getContentWarningStatus() {
        return contentWarningStatus;
    }

    public void setContentWarningStatus(Integer contentWarningStatus) {
        this.contentWarningStatus = contentWarningStatus;
    }

    public Integer getAdId() {
        return adId;
    }

    public void setAdId(Integer adId) {
        this.adId = adId;
    }

    public Integer getContentShareCount() {
        return contentShareCount;
    }

    public void setContentShareCount(Integer contentShareCount) {
        this.contentShareCount = contentShareCount;
    }

    // Content 모델 복사
    public void CopyData(Content param)
    {
        this.contentId = param.getContentId();
        this.userId = param.getUserId();
        this.contentSubject = param.getContentSubject();
        this.content = param.getContent();
        this.contentWrittenDate = param.getContentWrittenDate();
        this.contentPrivateFlag = param.getContentPrivateFlag();
        this.contentDeleteStatus = param.getContentDeleteStatus();
        this.contentWarningStatus = param.getContentWarningStatus();
        this.adId = param.getAdId();
        this.contentShareCount = param.getContentShareCount();
    }

	@Override
	public String toString() {
		return "Content [contentId=" + contentId + ", userId=" + userId + ", contentSubject=" + contentSubject
				+ ", content=" + content + ", contentWrittenDate=" + contentWrittenDate + ", contentPrivateFlag="
				+ contentPrivateFlag + ", contentDeleteStatus=" + contentDeleteStatus + ", contentWarningStatus="
				+ contentWarningStatus + ", adId=" + adId + ", contentShareCount=" + contentShareCount + "]";
	}
    
}