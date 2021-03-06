package com.photovel.vo;

public class ContentDetail {
    private int content_id;
	private String content_detail_id;
	private String detail_content;
	private Photo photo;
	private String detail_delete_status;
	
	public String getDetail_delete_status() {
		return detail_delete_status;
	}
	public void setDetail_delete_status(String detail_delete_status) {
		this.detail_delete_status = detail_delete_status;
	}
	public int getContent_id() {
		return content_id;
	}
	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}
	public String getContent_detail_id() {
		return content_detail_id;
	}
	public void setContent_detail_id(String content_detail_id) {
		this.content_detail_id = content_detail_id;
	}
	public String getDetail_content() {
		return detail_content;
	}
	public void setDetail_content(String detail_content) {
		this.detail_content = detail_content;
	}
	public Photo getPhoto() {
		return photo;
	}
	public void setPhoto(Photo photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "ContentDetail [content_id=" + content_id + ", content_detail_id=" + content_detail_id
				+ ", detail_content=" + detail_content + ", photo=" + photo + ", detail_delete_status="
				+ detail_delete_status + "]";
	}
	
}