package com.photovel.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.photovel.dao.CommentDAO;
import com.photovel.dao.ContentDAO;
import com.photovel.dao.ContentDetailDAO;
import com.photovel.vo.Comment;
import com.photovel.vo.Content;
import com.photovel.vo.ContentDetail;
import com.photovel.vo.Photo;

@RestController
@RequestMapping("/content/photo")
public class ContentController {
	@Autowired
	private ContentDAO contentDao;
	@Autowired
	private ContentDetailDAO contentDetailDao;
	@Autowired
	private CommentDAO commentDao;
	
	@GetMapping("/{content_id}")
    public Content selectById(@PathVariable int content_id){
		Content content = contentDao.selectById(content_id);
		content.setDetails(contentDetailDao.selectById(content_id));
		content.setComments(commentDao.selectById(content_id));
		return content;
    }
	
	@GetMapping
    public List<Content> selectAllOrderByDate(){
		List<Content> contents = contentDao.selectAll();
		for(Content content:contents){
			System.out.println(content);
		}
		return contents;
    }
	
	@PostMapping
	public void insert(@PathVariable Content content){
		contentDao.insert(content);
		List<ContentDetail> details = content.getDetails();
		for(ContentDetail detail: details){
			contentDetailDao.insert(detail);
		}
	}
	
	@PutMapping
	public void update(@PathVariable Content content){
		contentDao.update(content);
		List<ContentDetail> details = content.getDetails();
		for(ContentDetail detail: details){
			contentDetailDao.insert(detail);
		}
	}
}