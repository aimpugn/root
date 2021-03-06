package com.photovel.vo;

import java.util.Date;
import java.util.List;

public class AdminContent {
	private int content_id;
	private String content_subject;
	private String content;
	private Date content_written_date;
	private String content_written_month;
	private String content_private_flag;
	private String content_delete_status;
	private int content_warning_status;
	
	private int content_share_count;
	private int good_count;
	private int comment_count;
	private int content_detail_count;
	private String photo_file_name;
	private double photo_latitude;
	private double photo_longitude;
	
	private Date fr_photo_date;
	private Date to_photo_date;
	
	private User user;
	private int content_count;
	private int gender_count;
	private Advertisement ad;
	private List<Comment> comments;
	private List<AdminContentDetail> details;
	
	public String getContent_written_month() {
		return content_written_month;
	}
	public void setContent_written_month(String content_written_month) {
		this.content_written_month = content_written_month;
	}
	public int getContent_count() {
		return content_count;
	}
	public void setContent_count(int content_count) {
		this.content_count = content_count;
	}
	public int getGender_count() {
		return gender_count;
	}
	public void setGender_count(int gender_count) {
		this.gender_count = gender_count;
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
	public Date getFr_photo_date() {
		return fr_photo_date;
	}
	public void setFr_photo_date(Date fr_photo_date) {
		this.fr_photo_date = fr_photo_date;
	}
	public Date getTo_photo_date() {
		return to_photo_date;
	}
	public void setTo_photo_date(Date to_photo_date) {
		this.to_photo_date = to_photo_date;
	}
	public String getPhoto_file_name() {
		return photo_file_name;
	}
	public void setPhoto_file_name(String photo_file_name) {
		this.photo_file_name = photo_file_name;
	}
	public Advertisement getAd() {
		return ad;
	}
	public void setAd(Advertisement ad) {
		this.ad = ad;
	}
	public int getContent_id() {
		return content_id;
	}
	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}
	public String getContent_subject() {
		return content_subject;
	}
	public void setContent_subject(String content_subject) {
		this.content_subject = content_subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Date getContent_written_date() {
		return content_written_date;
	}
	public void setContent_written_date(Date content_written_date) {
		this.content_written_date = content_written_date;
	}
	public String getContent_private_flag() {
		return content_private_flag;
	}
	public void setContent_private_flag(String content_private_flag) {
		this.content_private_flag = content_private_flag;
	}
	public String getContent_delete_status() {
		return content_delete_status;
	}
	public void setContent_delete_status(String content_delete_status) {
		this.content_delete_status = content_delete_status;
	}
	public int getContent_warning_status() {
		return content_warning_status;
	}
	public void setContent_warning_status(int content_warning_status) {
		this.content_warning_status = content_warning_status;
	}
	public int getContent_share_count() {
		return content_share_count;
	}
	public void setContent_share_count(int content_share_count) {
		this.content_share_count = content_share_count;
	}
	public int getGood_count() {
		return good_count;
	}
	public void setGood_count(int good_count) {
		this.good_count = good_count;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public int getContent_detail_count() {
		return content_detail_count;
	}
	public void setContent_detail_count(int content_detail_count) {
		this.content_detail_count = content_detail_count;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public List<AdminContentDetail> getDetails() {
		return details;
	}
	public void setDetails(List<AdminContentDetail> details) {
		this.details = details;
	}
	
	@Override
	public String toString() {
		return "AdminContent [content_id=" + content_id + ", content_subject=" + content_subject + ", content="
				+ content + ", content_written_date=" + content_written_date + ", content_written_month =" + content_written_month + ", content_private_flag="
				+ content_private_flag + ", content_delete_status=" + content_delete_status
				+ ", content_warning_status=" + content_warning_status + ", content_share_count=" + content_share_count
				+ ", good_count=" + good_count + ", comment_count=" + comment_count + ", content_detail_count="
				+ content_detail_count + ", photo_file_name=" + photo_file_name + ", photo_latitude=" + photo_latitude
				+ ", photo_longitude=" + photo_longitude + ", fr_photo_date=" + fr_photo_date + ", to_photo_date="
				+ to_photo_date + ", user=" + user + ", content_count=" + content_count + ", gender_count=" + gender_count+ ", ad=" + ad + ", comments="
				+ comments + ", details=" + details + "]";
	}

	
}