package com.photovel.vo;

public class ContentDetail {
    private int contentId;
	private int contentDetailId;
	private String detailContent;
	private Photo photo;
	
	public int getContentId() {
		return contentId;
	}
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	public int getContentDetailId() {
		return contentDetailId;
	}
	public void setContentDetailId(int contentDetailId) {
		this.contentDetailId = contentDetailId;
	}
	public String getDetailContent() {
		return detailContent;
	}
	public void setDetailContent(String detailContent) {
		this.detailContent = detailContent;
	}
	public Photo getPhoto() {
		return photo;
	}
	public void setPhoto(Photo photo) {
		this.photo = photo;
	}
	
	@Override
	public String toString() {
		return "ContentDetail [contentId=" + contentId + ", contentDetailId=" + contentDetailId + ", detailContent="
				+ detailContent + ", photo=" + photo + "]";
	}
}