package com.photovel.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void insert(@PathVariable int content_id, Comment comment){
		System.out.println(comment);
		commentDao.insert(comment);
	}
	
	@PostMapping("/{content_id}/{comment_id}")
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void update(@PathVariable int content_id, @PathVariable String comment_id){

	}
	
	/*@DeleteMapping("/{comment_id}")
	public String delete(@PathVariable String comment_id){
		commentDao.deleteComment(comment_id);
		return "1";
	}*/
}