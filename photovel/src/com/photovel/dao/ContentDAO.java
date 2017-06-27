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
	public Content selectByContentId(int content_id){
		return session.selectOne("ContentMapper.selectByContentId", content_id); 
	}
	public List<Content> selectByUserId(String user_id){
		return session.selectList("ContentMapper.selectByUserId", user_id); 
	}
	public List<Content> selectMyStory(String user_id){
		return session.selectList("ContentMapper.selectMyStory", user_id); 
	}
	public List<Content> selectAllOrderByDate(){
		return session.selectList("ContentMapper.selectAllOrderByDate"); 
	}
	public List<Content> selectAllOrderByGood(){
		return session.selectList("ContentMapper.selectAllOrderByGood"); 
	}
	public int selectCurId(){
		return session.selectOne("ContentMapper.selectOne");
	}
	public void updateDeleteStatusByWarning(int content_id){
		session.update("ContentMapper.updateDeleteStatusByWarning", content_id);
	}
	public void updateWarningStatus(int content_id){
		session.update("ContentMapper.updateWarningStatus", content_id);
	}
/*	public Content selectByAdminUserId(String user_id){
		return session.selectOne("ContentMapper.selectByAdminUserId", user_id); 
	}*/
	public List<Content> selectAllAdmin(){
		return session.selectList("ContentMapper.selectAllAdmin"); 
	}
}
