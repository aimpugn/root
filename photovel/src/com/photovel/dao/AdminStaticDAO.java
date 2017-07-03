package com.photovel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.photovel.vo.AdminContent;

@Repository
public class AdminStaticDAO {
	@Autowired
	private SqlSession session;
	
	public List<AdminContent> countAllPhone1ByDate(){
		return session.selectList("AdminStaticMapper.countAllPhone1ByDate"); 
	}
	public List<AdminContent> for2monthsList(){
		return session.selectList("AdminStaticMapper.for2monthsList");
	}
}
