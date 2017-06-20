package com.photovel.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import com.photovel.dao.UserDAO;
import com.photovel.vo.Admin;
import com.photovel.vo.User;

@RestController
@RequestMapping("/admin/member/user")
public class AdminUserController {

	@Autowired
	UserDAO dao;
	
	@GetMapping
	public void userList(HttpServletRequest request, HttpServletResponse response) {
		String msg = "-1";
		System.out.println("user in 체크");
		try {
			List<User> userList = dao.selectAll();	
			String forwardURL = "/admin/member/user.jsp";
			request.setAttribute("userList", userList);
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			msg = "1";
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/add")
	public String userAdd(User user) {
		System.out.println("USERADD 체크" + user);
		String msg = "-1";
		try {
			if (dao.selectById(user.getUser_id()) == null) {
				System.out.println("유저 상태" + user);
				dao.insertAdminUser(user);
				msg = "1";
				return msg;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}

	@GetMapping("/state")
	public void showState(String user_state_flag, HttpServletRequest request, HttpServletResponse response) {
		String msg = "-1";
		System.out.println("user state in");
		try {
			List<User> userList = dao.selectByState(user_state_flag);
			System.out.println(userList);
			String forwardURL = "/admin/member/user.jsp";
			request.setAttribute("userList", userList);
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			msg = "1";
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@PutMapping("/update")
	public String update(User user, Model model) {
		String msg = "-1";
		System.out.println("user update in");
		try {
			System.out.println("유저 상태" + user);
			dao.update(user);
			msg = "1";
			return msg;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}

	@PutMapping("/normal/{chkList}")
	public String normal(@RequestParam("chkList") String[] chkList, Model model) {
		String msg = "-1";
		try {
			for( int i = 0 ; i < chkList.length; i++ ){	
				String user_id = chkList[i];
				System.out.println(user_id);
				dao.normal(user_id);
				System.out.println(user_id + "normal: 성공");
			};
			msg = "1";
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}

	@PutMapping("/black/{chkList}")
	public String black(@RequestParam("chkList") String[] chkList, Model model) {
		String msg = "-1";
		try {
			for( int i = 0 ; i < chkList.length; i++ ){	
				String user_id = chkList[i];
				System.out.println(user_id);
				dao.black(user_id);
				System.out.println(user_id + "black: 성공");
				};
			msg = "1";
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}

	@PutMapping("/leave/{chkList}")
	public String leave(@RequestParam("chkList") String[] chkList, Model model) {
		String msg = "-1";
		try {
			for( int i = 0 ; i < chkList.length; i++ ){	
				String user_id = chkList[i];
				System.out.println(user_id);
				dao.leave(user_id);
				System.out.println(user_id + "leave: 성공");
				};
			msg = "1";
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	
	@GetMapping("/searchDate")
	 public void searchDate(Date to_date, Date from_date, HttpServletRequest request, HttpServletResponse response) {
 		System.out.println("데이트 검색 들어오나 ");
 		String msg = "-1";
 		try {
 			List<User> userList = dao.selectByDate(from_date, to_date);
 			System.out.println(userList + "셀렉트바이데이트 실횅");
 			String forwardURL = "/admin/member/user.jsp";
 			request.setAttribute("userList", userList);
 			request.setAttribute("to_date", to_date);
 			request.setAttribute("from_date", from_date);
 			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
 			msg = "1";
 			dispatcher.forward(request, response);
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
	}
	@GetMapping("/searchItem")
	public void searchItem(String searchCategory, String searchItem, HttpServletRequest request, HttpServletResponse response){
		System.out.println("서치아이템이 되나???");
		System.out.println(searchCategory + " : 카테고리 오나 들어오나 ");
		System.out.println(searchItem + " : 아이템들어오나 ");
		String msg = "-1";
		String forwardURL = "/admin/member/user.jsp";
		List<User> userList = new ArrayList();
		try {
			if( searchCategory.equals("아이디") ){
				userList = dao.selectByIds(searchItem);
				if(userList != null){
					System.out.println("아이디: "+ userList);
					forwardURL = "/admin/member/user.jsp";
					request.setAttribute("userList", userList);
		 			request.setAttribute("searchCategory", searchCategory);
		 			request.setAttribute("searchItem", searchItem);
		 			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
		 			msg = "1";
		 			dispatcher.forward(request, response);
				}
			} else if(searchCategory.equals("닉네임")){
				userList = dao.selectByName(searchItem);
				if(userList != null){
					System.out.println("닉네임: "+ userList);
					forwardURL = "/admin/member/user.jsp";
					request.setAttribute("userList", userList);
		 			request.setAttribute("searchCategory", searchCategory);
		 			request.setAttribute("searchItem", searchItem);
		 			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
		 			msg = "1";
		 			dispatcher.forward(request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
}


