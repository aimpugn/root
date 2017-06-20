package com.photovel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.photovel.vo.Content;

@Repository
public class ContentDAO {
	@Autowired
	private SqlSession session;
	
	public void insert(Content content) {
		session.insert("ContentMapper.insertContent", content);
	}
	public void update(Content content) {
		session.update("ContentMapper.updateContent", content);
	}
	public void updateDeleteStatus(int content_id){
		session.update("ContentMapper.updateDeleteStatus", content_id);
	}
	public Content selectById(int content_id){
		return session.selectOne("ContentMapper.selectById", content_id); 
	}
	public List<Content> selectAll(){
		return session.selectList("ContentMapper.selectAll"); 
	}
	public int selectCurId(){
		return session.selectOne("ContentMapper.selectOne");
	}
}
