package com.photovel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.photovel.vo.MainImage;

@Repository
public class MainImageDAO {
	@Autowired
	private SqlSession session;
	
	public List<MainImage> selectAll() {
		return session.selectList("MainImageMapper.selectAll");
	}

}
