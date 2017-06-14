package com.photovel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.photovel.vo.ContentDetail;

@Repository
public class ContentDetailDAO {
	@Autowired
	private SqlSession session;
	
	public void insert(ContentDetail detail) {
		session.insert("ContentDetailMapper.insertDetail", detail);
		detail.getPhoto().setContent_detail_id(detail.getContent_detail_id());
		/*int content_id = session.selectOne("ContentDetailMapper.selectOne");
		StringBuilder builder = new StringBuilder();
		builder.append(content_id).append("_").append(detail.getContent_detail_id()).append(".jpg");
		String photo_file_name = builder.toString();
		System.out.println(photo_file_name);
		detail.getPhoto().setPhoto_file_name(photo_file_name);*/
		session.insert("PhotoMapper.insertPhoto", detail.getPhoto());
	}
	public List<ContentDetail> selectById(int content_id){
		return session.selectList("ContentDetailMapper.selectById", content_id); 
	}
	public List<ContentDetail> selectAll(){
		return session.selectList("ContentDetailMapper.selectAll"); 
	}

}
