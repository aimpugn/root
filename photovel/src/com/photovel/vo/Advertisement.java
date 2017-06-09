package com.photovel.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Advertisement {
	private int adId;
	private String adImage;
	private String adContent;
	private String adLink;
	private Date adFrdate;
	private Date adTodate;
	private int adPrice;
	private int adClickCount;
	
	public int getAdId() {
		return adId;
	}
	public void setAdId(int adId) {
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
	@JsonSerialize(using = com.photovel.common.DateJsonSerializer.class)
	public Date getAdFrdate() {
		return adFrdate;
	}
	public void setAdFrdate(Date adFrdate) {
		this.adFrdate = adFrdate;
	}
	@JsonSerialize(using = com.photovel.common.DateJsonSerializer.class)
	public Date getAdTodate() {
		return adTodate;
	}
	public void setAdTodate(Date adTodate) {
		this.adTodate = adTodate;
	}
	public int getAdPrice() {
		return adPrice;
	}
	public void setAdPrice(int adPrice) {
		this.adPrice = adPrice;
	}
	public int getAdClickCount() {
		return adClickCount;
	}
	public void setAdClickCount(int adClickCount) {
		this.adClickCount = adClickCount;
	}
	
	@Override
	public String toString() {
		return "Advertisement [adId=" + adId + ", adImage=" + adImage + ", adContent=" + adContent + ", adLink="
				+ adLink + ", adFrdate=" + adFrdate + ", adTodate=" + adTodate + ", adPrice=" + adPrice
				+ ", adClickCount=" + adClickCount + "]";
	}
}