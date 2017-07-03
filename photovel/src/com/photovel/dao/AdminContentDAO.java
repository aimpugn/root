package com.photovel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.photovel.vo.AdminContent;
import com.photovel.vo.Content;

@Repository
public class AdminContentDAO {
	@Autowired
	private SqlSession session;
	
	public void insert(AdminContent content) {
		session.insert("AdminContentMapper.insertContent", content);
	}
	public void update(AdminContent content) {
		session.update("AdminContentMapper.updateContent", content);
	}

	public List<AdminContent> selectByDeleteStatus(String content_delete_status){
		return session.selectList("AdminContentMapper.selectByDeleteStatus", content_delete_status); 
	}	
	/**************/
	public void updateDeleteStatusNormal(int content_id){
		session.update("AdminContentMapper.updateDeleteStatusNormal", content_id);
	}
	public void updateDeleteStatusDelete(int content_id){
		session.update("AdminContentMapper.updateDeleteStatusDelete", content_id);
	}
	public void updateDeleteStatusManager(int content_id){
		session.update("AdminContentMapper.updateDeleteStatusManager", content_id);
	}
	public List<AdminContent> selectByPhone1(int user_phone1){
		return session.selectList("AdminContentMapper.selectByPhone1", user_phone1); 
	}
	/********************/
	public Content selectByContentId(int content_id){
		return session.selectOne("AdminContentMapper.selectByContentId", content_id); 
	}
	
	public List<AdminContent> selectByUserId(String user_id){
		return session.selectList("AdminContentMapper.selectByUserId", user_id); 
	}
	public List<AdminContent> selectAllOrderByDate(){
		return session.selectList("AdminContentMapper.selectAllOrderByDate"); 
	}
	public List<AdminContent> selectAllOrderByGood(){
		return session.selectList("AdminContentMapper.selectAllOrderByGood"); 
	}
	public int selectCurId(){
		return session.selectOne("AdminContentMapper.selectOne");
	}
	public void updateDeleteStatusByWarning(int content_id){
		session.update("AdminContentMapper.updateDeleteStatusByWarning", content_id);
	}
	public void updateWarningStatus(int content_id){
		session.update("AdminContentMapper.updateWarningStatus", content_id);
	}
/*	public Content selectByAdminUserId(String user_id){
		return session.selectOne("AdminContentMapper.selectByAdminUserId", user_id); 
	}*/
	public List<AdminContent> selectAllAdmin(){
		return session.selectList("AdminContentMapper.selectAllAdmin"); 
	}

}
