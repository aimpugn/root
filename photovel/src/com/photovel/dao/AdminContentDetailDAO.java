package com.photovel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.photovel.vo.AdminContentDetail;

@Repository
public class AdminContentDetailDAO {
	@Autowired
	private SqlSession session;
	
	public void insert(AdminContentDetail detail) {
		session.insert("ContentDetailMapper.insertDetail", detail);
		session.insert("PhotoMapper.insertPhoto", detail.getPhoto());
	}
	public List<AdminContentDetail> selectById(int content_id){
		return session.selectList("ContentDetailMapper.selectById", content_id); 
	}
	public List<AdminContentDetail> selectAll(){
		return session.selectList("ContentDetailMapper.selectAll"); 
	}
	public void update(AdminContentDetail detail) {
		session.update("ContentDetailMapper.updateContentDetail", detail);
		session.update("PhotoMapper.updatePhoto", detail.getPhoto());
	}

}
