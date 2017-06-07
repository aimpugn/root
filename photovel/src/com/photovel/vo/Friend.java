package com.photovel.vo;

public class Friend {

    private String friendOne;

    private String friendTwo;

    private Integer friendStatus;

    public String getFriendOne() {
        return friendOne;
    }

    public void setFriendOne(String friendOne) {
        this.friendOne = friendOne;
    }

    public String getFriendTwo() {
        return friendTwo;
    }

    public void setFriendTwo(String friendTwo) {
        this.friendTwo = friendTwo;
    }

    public Integer getFriendStatus() {
        return friendStatus;
    }

    public void setFriendStatus(Integer friendStatus) {
        this.friendStatus = friendStatus;
    }

    // Friend 모델 복사
    public void CopyData(Friend param)
    {
        this.friendOne = param.getFriendOne();
        this.friendTwo = param.getFriendTwo();
        this.friendStatus = param.getFriendStatus();
    }

	@Override
	public String toString() {
		return "Friend [friendOne=" + friendOne + ", friendTwo=" + friendTwo + ", friendStatus=" + friendStatus + "]";
	}
    
}