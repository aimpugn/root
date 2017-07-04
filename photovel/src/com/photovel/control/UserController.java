package com.photovel.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.photovel.dao.UserDAO;
import com.photovel.vo.Permission;
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
	@PostMapping(value = "/email", consumes = "application/json; charset=UTF-8")
	public User login(@RequestBody User user, HttpSession session) {
		String msg = "0";
		System.out.println(user);
		session.removeAttribute("loginInfo");
		try {
			User checkUser = userDAO.selectById(user.getUser_id());
			if (checkUser != null && checkUser.getUser_password().equals(user.getUser_password())) {
				// msg="1";
				session.setAttribute("loginInfo", checkUser);
				session.setMaxInactiveInterval(240 * 60 * 60);
				return checkUser;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//페이스북 로그인
	@GetMapping("/facebook/{user_sns_token}")
	public User loginFacebook(@PathVariable String user_sns_token, HttpSession session) {
		String msg = "0";
		session.removeAttribute("loginInfo");
		try {
			User checkUser = userDAO.selectBySnsToken(user_sns_token);
			if (checkUser != null ) {
				// msg="1";
				session.setAttribute("loginInfo", checkUser);
				session.setMaxInactiveInterval(240 * 60 * 60);
				return checkUser;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@PostMapping(value="/idCheck", consumes="application/json; charset=UTF-8")
	public String idCheck(@RequestBody User user){
		String msg ="0"; //비정상 코드를 의미
		
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
		//System.out.println(user);
		User idCheckUser = userDAO.selectById(user.getUser_id());
		if(idCheckUser==null){
			try {
				userDAO.insert(user);
				msg="1"; //성공의미
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//System.out.println(msg);
		return msg;
	}
	
	@GetMapping
	public String compareSession(HttpSession session){
		String resultValue="0";
		User isUser = (User)session.getAttribute("loginInfo");
		//System.out.println(isUser);
		if(isUser!=null){
			resultValue="1";
		}
		System.out.println(resultValue);
		return resultValue;
	}
	
	@GetMapping(value="/logout")
	public void logout(HttpSession session){
		//System.out.println(((User)session.getAttribute("loginInfo")).getUser_id() +"님이 로그아웃");
		session.removeAttribute("loginInfo");
	}
	
	//은지추가
	@GetMapping("/setting/{user_id:.+}")
	public void selectPermission(@PathVariable String user_id,
			HttpServletRequest request, HttpServletResponse response){
		
		try {
			String forwardURL = "/common/user/setting/response";
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			Permission permission = userDAO.selectPermission(user_id);
			request.setAttribute("permission", permission);
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/setting/response")
	public Permission selectPermissionResponse(HttpServletRequest request){
		Permission permission = (Permission) request.getAttribute("permission");
		return permission;
    }
	
	@DeleteMapping("/leave/{user_id:.+}")
	public void leave(@PathVariable String user_id){
		userDAO.updateUserState(user_id);
    }
	
	@PostMapping(value = "/setting", consumes = "multipart/form-data")
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void update(@RequestParam("user") String user1, @RequestParam("permission") String permission1,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, HttpServletRequest request,
			HttpSession session) {
		User user;
		Permission permission;
		OutputStream out = null;
		PrintWriter printWriter = null;
		try {
			user = JSON.parseObject(URLDecoder.decode(user1, "UTF-8"), User.class);
			permission = JSON.parseObject(URLDecoder.decode(permission1, "UTF-8"), Permission.class);
			
			user.setUser_profile_photo(user.getUser_id() + ".jpg");
			userDAO.updateInfo(user);
			userDAO.updatePermission(permission);

			// 파일의 바이트 정보 얻기
			byte[] bytes = uploadFile.getBytes();
			String path = request.getSession().getServletContext().getRealPath("");
			String uploadPath = path + "/upload/profile/" + user.getUser_id() + ".jpg";

			File file = new File(uploadPath);
			// 상위 폴더 존재 여부 확인
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			out = new FileOutputStream(file);
			out.write(bytes);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
	
	@PostMapping("/push/update")
	public String updatePushToken(@RequestBody User user, HttpSession session){
		System.out.println("받아온 값은 : " +user );
		User tmp = (User)session.getAttribute("loginInfo");
		System.out.println("현재 세션의 아이디는"+tmp.getUser_id());
		String msg = "1";
		tmp.setUser_push_token(user.getUser_push_token());
		System.out.println("최종 User는 "+ user);
		try{
			userDAO.updatePushToken(tmp);
			
		}catch (Exception e) {
			msg="0";
			System.out.println("토큰저장 실패");
			e.printStackTrace();
		}
		return msg;
	}
}
