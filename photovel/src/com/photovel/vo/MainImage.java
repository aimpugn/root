package com.photovel.vo;

public class MainImage {
	private String imageFileName;
	private String imageUrlLink;
	private String imageSubject;
	private String imageContent;
	
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getImageUrlLink() {
		return imageUrlLink;
	}
	public void setImageUrlLink(String imageUrlLink) {
		this.imageUrlLink = imageUrlLink;
	}
	public String getImageSubject() {
		return imageSubject;
	}
	public void setImageSubject(String imageSubject) {
		this.imageSubject = imageSubject;
	}
	public String getImageContent() {
		return imageContent;
	}
	public void setImageContent(String imageContent) {
		this.imageContent = imageContent;
	}
	
	@Override
	public String toString() {
		return "MainImage [imageFileName=" + imageFileName + ", imageUrlLink=" + imageUrlLink + ", imageSubject="
				+ imageSubject + ", imageContent=" + imageContent + "]";
	}
}