package com.photovel.vo;

public class Good {

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

    // Good 모델 복사
    public void CopyData(Good param)
    {
        this.contentId = param.getContentId();
        this.userId = param.getUserId();
    }

	@Override
	public String toString() {
		return "Good [contentId=" + contentId + ", userId=" + userId + "]";
	}
    
}