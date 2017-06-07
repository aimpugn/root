package com.photovel.vo;

import java.util.Date;

public class Comment {

    private Integer contentId;

    private Integer commentId;

    private String userId;

    private String commentContent;

    private Date commentDate;

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    // Comment 모델 복사
    public void CopyData(Comment param)
    {
        this.contentId = param.getContentId();
        this.commentId = param.getCommentId();
        this.userId = param.getUserId();
        this.commentContent = param.getCommentContent();
        this.commentDate = param.getCommentDate();
    }

	@Override
	public String toString() {
		return "Comment [contentId=" + contentId + ", commentId=" + commentId + ", userId=" + userId
				+ ", commentContent=" + commentContent + ", commentDate=" + commentDate + "]";
	}
    
}