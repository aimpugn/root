package com.photovel.vo;

public class Bookmark {

    private Integer contentId;

    private String userId;

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

    // Bookmark 모델 복사
    public void CopyData(Bookmark param)
    {
        this.contentId = param.getContentId();
        this.userId = param.getUserId();
    }

	@Override
	public String toString() {
		return "Bookmark [contentId=" + contentId + ", userId=" + userId + "]";
	}
    
}