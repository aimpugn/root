package com.photovel.vo;

import java.util.Date;

public class Advertisement {

    private Integer adId;

    private String adImage;

    private String adContent;

    private String adLink;

    private Date adFrdate;

    private Date adTodate;

    private Integer adPrice;

    private Integer adClickCount;

    public Integer getAdId() {
        return adId;
    }

    public void setAdId(Integer adId) {
        this.adId = adId;
    }

    public String getAdImage() {
        return adImage;
    }

    public void setAdImage(String adImage) {
        this.adImage = adImage;
    }

    public String getAdContent() {
        return adContent;
    }

    public void setAdContent(String adContent) {
        this.adContent = adContent;
    }

    public String getAdLink() {
        return adLink;
    }

    public void setAdLink(String adLink) {
        this.adLink = adLink;
    }

    public Date getAdFrdate() {
        return adFrdate;
    }

    public void setAdFrdate(Date adFrdate) {
        this.adFrdate = adFrdate;
    }

    public Date getAdTodate() {
        return adTodate;
    }

    public void setAdTodate(Date adTodate) {
        this.adTodate = adTodate;
    }

    public Integer getAdPrice() {
        return adPrice;
    }

    public void setAdPrice(Integer adPrice) {
        this.adPrice = adPrice;
    }

    public Integer getAdClickCount() {
        return adClickCount;
    }

    public void setAdClickCount(Integer adClickCount) {
        this.adClickCount = adClickCount;
    }

    // Advertisement 모델 복사
    public void CopyData(Advertisement param)
    {
        this.adId = param.getAdId();
        this.adImage = param.getAdImage();
        this.adContent = param.getAdContent();
        this.adLink = param.getAdLink();
        this.adFrdate = param.getAdFrdate();
        this.adTodate = param.getAdTodate();
        this.adPrice = param.getAdPrice();
        this.adClickCount = param.getAdClickCount();
    }

	@Override
	public String toString() {
		return "Advertisement [adId=" + adId + ", adImage=" + adImage + ", adContent=" + adContent + ", adLink="
				+ adLink + ", adFrdate=" + adFrdate + ", adTodate=" + adTodate + ", adPrice=" + adPrice
				+ ", adClickCount=" + adClickCount + "]";
	}
    
}