package com.photovel.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.photovel.dao.PhotoDAO;
import com.photovel.vo.Photo;

@RestController
//@RequestMapping("/content/photo")
public class PhotoController {
	@Autowired
	private PhotoDAO dao;
	
	@GetMapping("/{content_id}")
    public List<Photo> selectById(@PathVariable int content_id){
		List<Photo> photos = null;
		try {
			photos = dao.selectByContentId(content_id);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(Photo photo: photos){
			System.out.println(photo.toString());
		}
		return photos;
    }
	@GetMapping
    public List<Photo> selectAll(){
		List<Photo> photos = null;
		try {
			photos = dao.selectAll();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(Photo photo: photos){
			System.out.println(photo.toString());
		}
		return photos;
    }
	@PostMapping
    public Photo insert(@RequestBody Photo photo) {
		dao.insert(photo);
		return photo;
    }
}