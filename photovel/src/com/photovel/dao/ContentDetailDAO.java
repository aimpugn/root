package com.photovel.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.photovel.vo.ContentDetail;

@Repository
public class ContentDetailDAO {
	@Autowired
	private SqlSession session;

	public void insert(ContentDetail contentDetail) {
		session.insert("ContentDetailMapper.insertContentDetail", contentDetail);
	}
}
