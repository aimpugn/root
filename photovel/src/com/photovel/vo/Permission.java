package com.photovel.vo;

public class Permission {

    private String userId;

    private Integer friendRecomFlag;

    private Integer friendSearchFlag;

    private Integer feedFlag;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getFriendRecomFlag() {
        return friendRecomFlag;
    }

    public void setFriendRecomFlag(Integer friendRecomFlag) {
        this.friendRecomFlag = friendRecomFlag;
    }

    public Integer getFriendSearchFlag() {
        return friendSearchFlag;
    }

    public void setFriendSearchFlag(Integer friendSearchFlag) {
        this.friendSearchFlag = friendSearchFlag;
    }

    public Integer getFeedFlag() {
        return feedFlag;
    }

    public void setFeedFlag(Integer feedFlag) {
        this.feedFlag = feedFlag;
    }

    // Permission 모델 복사
    public void CopyData(Permission param)
    {
        this.userId = param.getUserId();
        this.friendRecomFlag = param.getFriendRecomFlag();
        this.friendSearchFlag = param.getFriendSearchFlag();
        this.feedFlag = param.getFeedFlag();
    }

	@Override
	public String toString() {
		return "Permission [userId=" + userId + ", friendRecomFlag=" + friendRecomFlag + ", friendSearchFlag="
				+ friendSearchFlag + ", feedFlag=" + feedFlag + "]";
	}
    
}