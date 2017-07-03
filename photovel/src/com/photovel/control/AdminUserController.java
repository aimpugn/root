package com.photovel.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.photovel.dao.AdminUserDAO;
import com.photovel.vo.AdminUser;
import com.photovel.vo.User;

@RestController
@RequestMapping("/admin/member/user")
public class AdminUserController {

	@Autowired
	AdminUserDAO dao;
	
	@GetMapping
	public void userList(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<AdminUser> userList = dao.selectAll();	
			String forwardURL = "/admin/member/user.jsp";
			request.setAttribute("userList", userList);
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * remoteModalUserId 에 정보 전달
	 * @param user_id
	 * @param request
	 * @param response
	 */
	@GetMapping("/{user_id:.+}")
	public void userData(@PathVariable String user_id, HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("업데이트 정보 얻기");
		try {
			AdminUser userOne= dao.selectById(user_id);	
			String forwardURL = "/admin/member/modalUserUpdateBody.jsp";
			request.setAttribute("userOne", userOne);
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping(value="/add")//, consumes="multipart/form-data; charset=UTF-8",// produces = MediaType.APPLICATION_JSON_VALUE,
			//headers ="content-type=multipart/form-data") //"content-type=application/x-www-form-urlencoded")
	public String userAdd(@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile, 
			User user){
		System.out.println("회원추가 in");
		System.out.println("uploadFile:" +uploadFile);
		System.out.println(uploadFile.getSize());
		System.out.println(user);
		//return "1";
		return null;
	}		
	
	
//	@PostMapping(value="/add", consumes="application/json; charset=UTF-8", produces = MediaType.APPLICATION_JSON_VALUE,
//			headers ="content-type=multipart/form-data") //"content-type=application/x-www-form-urlencoded")
//	public String userAdd(@RequestParam("formdata") String json, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile,
//						 
//			HttpServletRequest request) {
//		System.out.println("회원추가 포스트 매핑 인" + MediaType.MULTIPART_FORM_DATA);
//		String msg = "-1";
//		User user;
//		try {
//			user = JSON.parseObject(URLDecoder.decode(json,"UTF-8"), User.class);
//			System.out.println("유저를 json 파싱하는가"+user);
//			if (dao.selectById(user.getUser_id()) == null) {
//				System.out.println("유저 상태" + user);
//				user.setUser_profile_photo(user.getUser_id()+".jpg");
//				System.out.println("pofile파일명을 생성하는가"+user);
//				dao.insertAdminUser(user);
//				System.out.println("user를 인서트 하는가"+user);
//				uploadPicture(uploadFile, user, request);
//				System.out.println("파일을 업로드 하는가"+user);
//				msg = "1";
//				return msg;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return msg;
//	}
	public void uploadPicture(MultipartFile uploadFile, User user, HttpServletRequest request){
		OutputStream out = null;
		PrintWriter printWriter = null;
		try {
			// 파일의 바이트 정보 얻기
			byte[] bytes = uploadFile.getBytes();
			String path = request.getSession().getServletContext().getRealPath("");
			String uploadPath = path + "/upload/profile/"+user.getUser_id()+".jpg";
			
			File file = new File(uploadPath);
			
			out = new FileOutputStream(file);
			out.write(bytes);
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
	@PutMapping("/update")
	public String update(@ModelAttribute AdminUser user, Model model) {
		String msg = "-1";
		System.out.println("user update in" + user);
		System.out.println((user.getUser_phone1())+1);
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
	@GetMapping("/state")
	public void showState(String user_state_flag, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("user state in");
		try {
			List<AdminUser> userList = dao.selectByState(user_state_flag);
			System.out.println(userList);
			String forwardURL = "/admin/member/user.jsp";
			request.setAttribute("userList", userList);
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
 			List<AdminUser> userList = dao.selectByDate(from_date, to_date);
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
		List<AdminUser> userList = new ArrayList();
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


