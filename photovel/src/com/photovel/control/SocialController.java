package com.photovel.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.photovel.dao.SocialDAO;
import com.photovel.vo.Content;

@RestController
public class SocialController {
	@Autowired
	private SocialDAO socialDao;
	
	@PostMapping("/content/photo/{content_id}/good/{user_id:.+}")
	public void goodInsert(@PathVariable int content_id, @PathVariable String user_id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("content_id", content_id);
		map.put("user_id", user_id);
		if(socialDao.goodSelect(map) == 0){
			socialDao.goodInsert(map);
		}else{
			socialDao.goodDelete(map);
		}
	}
	
	//shareCountUpdate
	@PostMapping("/content/photo/{content_id}/share")
	public void shareCountUpdate(@PathVariable int content_id){
		socialDao.shareUpdate(content_id);
	}
	
	@PostMapping("/content/photo/{content_id}/bookmark/{user_id:.+}")
	public void bookmarkInsert(@PathVariable int content_id, @PathVariable String user_id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("content_id", content_id);
		map.put("user_id", user_id);
		if(socialDao.bookmarkSelect(map) == 0){
			socialDao.bookmarkInsert(map);
		}else{
			socialDao.bookmarkDelete(map);
		}
	}
	
	@GetMapping("/bookmark/{user_id:.+}")
	public void selectBookmarkList (@PathVariable String user_id,
    		HttpServletRequest request, HttpServletResponse response){
		try {
			String forwardURL = "/bookmark/response";
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			List<Content> contents = socialDao.bookmarkSelectList(user_id);
			request.setAttribute("contents", contents);
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/bookmark/response")
	public List<Content> selectByUserIdResponse(HttpServletRequest request){
		List<Content> contents = (List<Content>) request.getAttribute("contents");
		return contents;
    }
}