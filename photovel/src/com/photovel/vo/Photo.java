package com.photovel.vo;

import java.util.Date;

public class Photo {
	private int content_id;
	private String content_detail_id;
	private String photo_file_name;
	private int photo_top_flag;
	private Date photo_date;
	private double photo_latitude;
	private double photo_longitude;

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
	public String getPhoto_file_name() {
		return photo_file_name;
	}
	public void setPhoto_file_name(String photo_file_name) {
		this.photo_file_name = photo_file_name;
	}
	public int getPhoto_top_flag() {
		return photo_top_flag;
	}
	public void setPhoto_top_flag(int photo_top_flag) {
		this.photo_top_flag = photo_top_flag;
	}
	public Date getPhoto_date() {
		return photo_date;
	}
	public void setPhoto_date(Date photo_date) {
		this.photo_date = photo_date;
	}
	public double getPhoto_latitude() {
		return photo_latitude;
	}
	public void setPhoto_latitude(double photo_latitude) {
		this.photo_latitude = photo_latitude;
	}
	public double getPhoto_longitude() {
		return photo_longitude;
	}
	public void setPhoto_longitude(double photo_longitude) {
		this.photo_longitude = photo_longitude;
	}
	@Override
	public String toString() {
		return "Photo [content_id=" + content_id + ", content_detail_id=" + content_detail_id + ", photo_file_name="
				+ photo_file_name + ", photo_top_flag=" + photo_top_flag + ", photo_date=" + photo_date
				+ ", photo_latitude=" + photo_latitude + ", photo_longitude=" + photo_longitude + "]";
	}
}