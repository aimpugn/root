package com.photovel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.photovel.vo.Comment;

@Repository
public class CommentDAO {
	@Autowired
	private SqlSession session;
	
	public void insert(Comment comment) {
		session.insert("CommentMapper.insertComment", comment);
	}
	
	public List<Comment> selectByContentId(int content_id){
		return session.selectList("CommentMapper.selectByContentId", content_id); 
	}
	
	public void deleteComment(String comment_id){
		session.delete("CommentMapper.deleteComment",comment_id);
	}
}
