package com.photovel.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class GoodDAO {
	@Autowired
	private SqlSession session;
	
	public int select(HashMap map) {
		return session.selectOne("GoodMapper.selectGood", map);
	}
	
	public void insert(HashMap map) {
		session.insert("GoodMapper.insertGood", map);
	}
	
	public void delete(HashMap map){
		session.delete("GoodMapper.deleteGood", map);
	}
}
