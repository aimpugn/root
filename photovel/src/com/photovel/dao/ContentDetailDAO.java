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
		session.insert("PhotoMapper.insertPhoto", detail.getPhoto());
	}
	public List<ContentDetail> selectById(int contentId){
		return session.selectList("ContentDetailMapper.selectById", contentId); 
	}
	public List<ContentDetail> selectAll(){
		return session.selectList("ContentDetailMapper.selectAll"); 
	}

}
