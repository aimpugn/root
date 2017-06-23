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
@RequestMapping("/common/user")
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	/**
	 * User가 로그인을 할때 사용하는 메소드입니다.
	 * @param user android에서 받은 id,password 값으로 받아와 JsonObejct 형식으로 뿌렵니다.
	 * @param sesson 안드로이드에서 해당하는 session의 쿠키값을 저장하여 로그인상태를 유지하려고 사용합니다.
	 * @return
	 */
	@PostMapping(value="/email", consumes="application/json; charset=UTF-8")
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
	
	@PostMapping(value="/idCheck", consumes="application/json; charset=UTF-8")
	public String idCheck(@RequestBody User user){
		String msg ="0"; //비정상 코드를 의미
		System.out.println(user); //user가 오는지 확인
		
		User idCheckUser = userDAO.selectById(user.getUser_id());
		
		if(idCheckUser==null){
			msg="1";
		}else{
			System.out.println("이미 있는 유저입니다.");
		}	
		return msg;
	}
	
	@PostMapping(value="/join", consumes="application/json; charset=UTF-8")
	public String join(@RequestBody User user){
		String msg ="0"; //비정상 코드를 의미
		System.out.println(user); //user가 오는지 확인
		
		User idCheckUser = userDAO.selectById(user.getUser_id());
		if(idCheckUser==null){
			try {
				userDAO.insert(user);
				msg="1"; //성공의미
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println(msg);
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
