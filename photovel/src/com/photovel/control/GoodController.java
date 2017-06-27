package com.photovel.control;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.photovel.dao.GoodDAO;

@RestController
@RequestMapping("/content/photo")
public class GoodController {
	@Autowired
	private GoodDAO goodDao;
	
	@PostMapping("/{content_id}/good/{user_id:.+}")
	public void insert(@PathVariable int content_id, @PathVariable String user_id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("content_id", content_id);
		map.put("user_id", user_id);
		if(goodDao.select(map) == 0){
			goodDao.insert(map);
		}else{
			goodDao.delete(map);
		}
	}
}