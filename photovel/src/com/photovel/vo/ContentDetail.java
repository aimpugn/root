package com.photovel.vo;

public class ContentDetail {

    private Integer contentId;

    private Integer contentDetailId;

    private String detailContent;

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }

    public Integer getContentDetailId() {
        return contentDetailId;
    }

    public void setContentDetailId(Integer contentDetailId) {
        this.contentDetailId = contentDetailId;
    }

    public String getDetailContent() {
        return detailContent;
    }

    public void setDetailContent(String detailContent) {
        this.detailContent = detailContent;
    }

    // ContentDetail 모델 복사
    public void CopyData(ContentDetail param)
    {
        this.contentId = param.getContentId();
        this.contentDetailId = param.getContentDetailId();
        this.detailContent = param.getDetailContent();
    }

	@Override
	public String toString() {
		return "ContentDetail [contentId=" + contentId + ", contentDetailId=" + contentDetailId + ", detailContent="
				+ detailContent + "]";
	}
    
}