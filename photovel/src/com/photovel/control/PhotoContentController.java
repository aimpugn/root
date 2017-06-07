package com.photovel.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.photovel.dao.ContentDAO;
import com.photovel.dao.ContentDetailDAO;
import com.photovel.dao.PhotoDAO;
import com.photovel.vo.Content;
import com.photovel.vo.Photo;

@RestController
@RequestMapping("/content/photo")
public class PhotoContentController {
	@Autowired
	private ContentDAO contentDao;
	@Autowired
	private ContentDetailDAO contentDetailDao;
	@Autowired
	private PhotoDAO photoDao;
	
	@GetMapping("/{content_id}")
    public Content selectById(@PathVariable int content_id){
		Content content = contentDao.selectById(content_id);
		return content;
    }
	@GetMapping
    public List<Content> selectAll(){
		List<Content> contents = contentDao.selectAll();
		return contents;
    }
	
	
}