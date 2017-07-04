package com.photovel.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.photovel.vo.Friend;
import com.photovel.vo.User;

@Repository
public class FriendDAO {
	@Autowired
	private SqlSession session;
	
	public int selectCurrStatus0(HashMap map){
		return session.selectOne("FriendMapper.selectCurrStatus0", map);
	}
	
	public int selectCurrStatus1(HashMap map){
		return session.selectOne("FriendMapper.selectCurrStatus1", map);
	}
	
	public int selectCurrStatus2(HashMap map){
		return session.selectOne("FriendMapper.selectCurrStatus2", map);
	}
	
	public void insert(HashMap map) {
		session.insert("FriendMapper.insert", map);
	}
	
	public List<User> selectNewList(String user_id) {
		return session.selectList("FriendMapper.selectNewList", user_id);
	}
	
	public void accept(HashMap map) {
		session.update("FriendMapper.updateAccept", map);
		session.insert("FriendMapper.insertAccept", map);
		session.update("FriendMapper.updateAddUserCount1", map);
		session.update("FriendMapper.updateAddUserCount2", map);
	}
	
	public List<User> selectFriendList(String user_id) {
		return session.selectList("FriendMapper.selectFriendList", user_id);
	}
	
	public void insertBlock(HashMap map){
		session.insert("FriendMapper.insertBlock", map);
	}

	public void delete(HashMap map){
		session.delete("FriendMapper.delete1", map);
		session.delete("FriendMapper.delete2", map);
		session.update("FriendMapper.updateMinusUserCount1", map);
		session.update("FriendMapper.updateMinusUserCount2", map);
	}

	public List<User> selectByIdOrName(HashMap map) {
		return session.selectList("FriendMapper.selectByIdOrName", map);
	}

	public List<User> selectByPhone2(HashMap map) {
		return session.selectList("FriendMapper.selectByPhone2", map);
	}
}
