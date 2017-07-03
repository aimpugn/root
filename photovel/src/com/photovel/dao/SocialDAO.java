package com.photovel.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.photovel.vo.Content;


@Repository
public class SocialDAO {
	@Autowired
	private SqlSession session;
	
	public int goodSelect(HashMap map) {
		return session.selectOne("SocialMapper.selectGood", map);
	}
	
	public void goodInsert(HashMap map) {
		session.insert("SocialMapper.insertGood", map);
	}
	
	public void goodDelete(HashMap map){
		session.delete("SocialMapper.deleteGood", map);
	}
	
	public int bookmarkSelect(HashMap map) {
		return session.selectOne("SocialMapper.selectBookmark", map);
	}
	
	public void bookmarkInsert(HashMap map) {
		session.insert("SocialMapper.insertBookmark", map);
	}
	
	public void bookmarkDelete(HashMap map){
		session.delete("SocialMapper.deleteBookmark", map);
	}

	public List<Content> bookmarkSelectList(String user_id) {
		return session.selectList("SocialMapper.bookmarkSelectList", user_id);
	}

	public void shareUpdate(int content_id) {
		session.insert("SocialMapper.updateShare", content_id);
	}
	
}
