package com.photovel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.photovel.vo.Photo;

@Repository
public class PhotoDAO {
	@Autowired
	private SqlSession session;

	public void insert(Photo p) {
		
	}

	public List<Photo> selectAll() throws Exception {
		return session.selectList("PhotoMapper.selectAll");
	}
	
	public List<Photo> selectByContentId(int contentId) throws Exception {
		return session.selectList("PhotoMapper.selectByContentId", contentId);
	}

}