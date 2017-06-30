package com.photovel.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.photovel.vo.Permission;
import com.photovel.vo.User;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession session;
	
	public User selectById(String user_id){
		return session.selectOne("UserMapper.selectById", user_id);
	}
	
	public Permission selectPermission(String user_id){
		return session.selectOne("PermissionMapper.selectPermission", user_id);
	}

	public void insert(User user){
		session.insert("UserMapper.insertUser", user);//id 값 , parameter로 보낼 값
		session.insert("PermissionMapper.insertPermission", user.getUser_id());
	}
	
	public void updateInfo(User user){
		session.update("UserMapper.updateInfo", user);
	}
	
	public void updatePermission(Permission permission){
		session.update("PermissionMapper.updatePermission", permission);
	}

	public void updateUserState(String user_id) {
		session.update("UserMapper.updateUserState", user_id);
	}
}
