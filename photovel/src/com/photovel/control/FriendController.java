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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.photovel.dao.FriendDAO;
import com.photovel.vo.User;

@RestController
@RequestMapping("/friend")
public class FriendController {
	@Autowired
	private FriendDAO friendDao;
	
	//친구신청(user_id1:나, user_id2:상대방)
	@PostMapping("/new/{user_id1:.+}/{user_id2:.+}")
	public void insert(@PathVariable String user_id1, @PathVariable String user_id2,
			HttpServletRequest request, HttpServletResponse response){
		
		//result == 0 친구가 없는데 친구신청을 함 -> insert
		//result == 1 이미 친구신청을 함(1, 3)
		//result == 2 이미 친구임(2)
		//result == 3 상대방이 친구신청을 했음
		
		try {
			String forwardURL = "/friend/new/response";
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("user_id1", user_id1);
			map.put("user_id2", user_id2);
			int result = -1;
			if(friendDao.selectCurrStatus0(map) == 0){
				friendDao.insert(map);
				result = 0;
			}else{
				int mystatus = friendDao.selectCurrStatus1(map);
				
				if(mystatus == 1){
					result = 1;
				}else if(mystatus == 2){
					result = 2;
				}else if(friendDao.selectCurrStatus2(map) == 1){
					result = 3;
				}
			}
			request.setAttribute("friend", result);
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
	
	//친구신청목록
	@GetMapping("/new/{user_id1:.+}")
	public void selectNewList(@PathVariable String user_id1,
			HttpServletRequest request, HttpServletResponse response){
		
		try {
			List<User> user = (List<User>) friendDao.selectNewList(user_id1);
			String forwardURL = "/friend/response";
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			request.setAttribute("friend", user);
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
	
	//친구수락
	@PostMapping("/accept/{user_id1:.+}/{user_id2:.+}")
	public void accept(@PathVariable String user_id1, @PathVariable String user_id2){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id1", user_id1);
		map.put("user_id2", user_id2);
		friendDao.accept(map);
	}
	
	//친구목록
	@GetMapping("/{user_id:.+}")
	public void select(@PathVariable String user_id,
			HttpServletRequest request, HttpServletResponse response){
		
		try {
			List<User> user = (List<User>) friendDao.selectFriendList(user_id);
			String forwardURL = "/friend/response";
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			request.setAttribute("friend", user);
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
	
	//친구차단
	/*@PostMapping("/block/{user_id1:.+}/{user_id2:.+}")
	public void block(@PathVariable String user_id1, @PathVariable String user_id2){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id1", user_id1);
		map.put("user_id2", user_id2);
		friendDao.insertBlock(map);
	}*/
	
	//친구삭제
	@PostMapping("/delete/{user_id1:.+}/{user_id2:.+}")
	public void delete(@PathVariable String user_id1, @PathVariable String user_id2){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id1", user_id1);
		map.put("user_id2", user_id2);
		friendDao.delete(map);
	}

	@GetMapping("/response")
	public List<User> selectFriendResponse(HttpServletRequest request){
		List<User> list = (List<User>) request.getAttribute("friend");
		return list;
    }
	
	@PostMapping("/new/response")
	public int selectStatusResponse(HttpServletRequest request){
		return (int) request.getAttribute("friend");
    }
}