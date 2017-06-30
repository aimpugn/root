package com.photovel.dao;

import java.util.HashMap;
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
	public void updateDeleteStatusByWarning(int content_id){
		session.update("ContentMapper.updateDeleteStatusByWarning", content_id);
	}
	public void updateWarningStatus(int content_id){
		session.update("ContentMapper.updateWarningStatus", content_id);
	}
	public int selectCurId(){
		return session.selectOne("ContentMapper.selectCurId");
	}
	public List<Content> selectAllOrderByGood(String user_id){
		return session.selectList("ContentMapper.selectAllOrderByGood", user_id); 
	}
	public List<Content> selectAllOrderByDate(String user_id){
		return session.selectList("ContentMapper.selectAllOrderByDate", user_id); 
	}
	public Content selectByContentId(HashMap map){
		return session.selectOne("ContentMapper.selectByContentId", map); 
	}
	public int selectContentWarningStatus(int content_id) {
		return session.selectOne("ContentMapper.selectContentWarningStatus", content_id);
	}
	public List<Content> selectByUserId(HashMap map){
		return session.selectList("ContentMapper.selectByUserId", map); 
	}
	public List<Content> selectMyStory(String user_id){
		return session.selectList("ContentMapper.selectMyStory", user_id); 
	}
	
}
