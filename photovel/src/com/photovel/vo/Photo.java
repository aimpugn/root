package com.photovel.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Photo {
	private int contentDetailId;
	private String photoFileName;
	private int photoTopFlag;
	private Date photoDate;
	private double photoLatitude;
	private double photoLongitude;
	
	public int getContentDetailId() {
		return contentDetailId;
	}
	public void setContentDetailId(int contentDetailId) {
		this.contentDetailId = contentDetailId;
	}
	public String getPhotoFileName() {
		return photoFileName;
	}
	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}
	public int getPhotoTopFlag() {
		return photoTopFlag;
	}
	public void setPhotoTopFlag(int photoTopFlag) {
		this.photoTopFlag = photoTopFlag;
	}
	@JsonSerialize(using = com.photovel.common.DateJsonSerializer.class)
	public Date getPhotoDate() {
		return photoDate;
	}
	public void setPhotoDate(Date photoDate) {
		this.photoDate = photoDate;
	}
	public double getPhotoLatitude() {
		return photoLatitude;
	}
	public void setPhotoLatitude(double photoLatitude) {
		this.photoLatitude = photoLatitude;
	}
	public double getPhotoLongitude() {
		return photoLongitude;
	}
	public void setPhotoLongitude(double photoLongitude) {
		this.photoLongitude = photoLongitude;
	}
	
	@Override
	public String toString() {
		return "Photo [contentDetailId=" + contentDetailId + ", photoFileName=" + photoFileName + ", photoTopFlag="
				+ photoTopFlag + ", photoDate=" + photoDate + ", photoLatitude=" + photoLatitude + ", photoLongitude="
				+ photoLongitude + "]";
	}
}