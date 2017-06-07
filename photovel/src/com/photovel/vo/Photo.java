package com.photovel.vo;

public class Photo {

    private Integer contentDetailId;

    private String photoFileName;

    private Integer photoTopFlag;

    private String photoDate;

    private Double photoLatitude;

    private Double photoLongitude;

    public Integer getContentDetailId() {
        return contentDetailId;
    }

    public void setContentDetailId(Integer contentDetailId) {
        this.contentDetailId = contentDetailId;
    }

    public String getPhotoFileName() {
        return photoFileName;
    }

    public void setPhotoFileName(String photoFileName) {
        this.photoFileName = photoFileName;
    }

    public Integer getPhotoTopFlag() {
        return photoTopFlag;
    }

    public void setPhotoTopFlag(Integer photoTopFlag) {
        this.photoTopFlag = photoTopFlag;
    }

    public String getPhotoDate() {
        return photoDate;
    }

    public void setPhotoDate(String photoDate) {
        this.photoDate = photoDate;
    }

    public Double getPhotoLatitude() {
        return photoLatitude;
    }

    public void setPhotoLatitude(Double photoLatitude) {
        this.photoLatitude = photoLatitude;
    }

    public Double getPhotoLongitude() {
        return photoLongitude;
    }

    public void setPhotoLongitude(Double photoLongitude) {
        this.photoLongitude = photoLongitude;
    }

    // Photo 모델 복사
    public void CopyData(Photo param)
    {
        this.contentDetailId = param.getContentDetailId();
        this.photoFileName = param.getPhotoFileName();
        this.photoTopFlag = param.getPhotoTopFlag();
        this.photoDate = param.getPhotoDate();
        this.photoLatitude = param.getPhotoLatitude();
        this.photoLongitude = param.getPhotoLongitude();
    }

	@Override
	public String toString() {
		return "Photo [contentDetailId=" + contentDetailId + ", photoFileName=" + photoFileName + ", photoTopFlag="
				+ photoTopFlag + ", photoDate=" + photoDate + ", photoLatitude=" + photoLatitude + ", photoLongitude="
				+ photoLongitude + "]";
	}
    
}