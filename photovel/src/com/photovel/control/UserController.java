package com.photovel.control;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alibaba.fastjson.JSON;
import com.photovel.dao.UserDAO;
import com.photovel.vo.User;

@RestController
@SessionAttributes("loginInfo")
@RequestMapping("/common/login/email")
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	//입력
	@GetMapping(consumes="application/json; charset=UTF-8")
	public String login(@RequestBody User user,HttpSession sesson){
		String msg = "0";
		System.out.println(user);
		sesson.removeAttribute("loginInfo");
		try {
			User checkUser = userDAO.selectById(user.getUser_id());
			if(checkUser !=null && checkUser.getUser_password().equals(user.getUser_password())){
				msg="1";
				sesson.setAttribute("loginInfo",checkUser);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msg;
	}
/*	
	//삭제
	@DeleteMapping
	//조회
	@GetMapping
	//수정
	@PutMapping
	*/
}
