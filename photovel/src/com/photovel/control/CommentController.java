package com.photovel.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.photovel.dao.CommentDAO;
import com.photovel.vo.Comment;

@RestController
@RequestMapping("/content/photo")
public class CommentController {
	@Autowired
	private CommentDAO commentDao;
	
	@GetMapping("/{content_id}/comment")
    public List<Comment> selectByContentId(@PathVariable int content_id){
		List<Comment> comments = commentDao.selectByContentId(content_id);
		return comments;
    }
	
	@PostMapping("/{content_id}/comment")
	public void insert(@PathVariable int content_id, @RequestBody Comment comment){
		int last_comment_id = commentDao.selectMaxComment(content_id);
		comment.setComment_id(content_id+"_"+(last_comment_id+1));
		commentDao.insert(comment);
	}
	
	@PostMapping("/{content_id}/{comment_id}")
	public void update(@RequestBody Comment comment){
		commentDao.update(comment);
	}
	
	@DeleteMapping("/{content_id}/{comment_id}")
	public void delete(@PathVariable String comment_id){
		commentDao.deleteComment(comment_id);
	}
}