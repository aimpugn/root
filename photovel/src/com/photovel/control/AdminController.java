package com.photovel.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.photovel.dao.AdminDAO;
import com.photovel.vo.Admin;

@RestController
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminDAO dao;

	@GetMapping
	public void goLogin(HttpServletRequest request, HttpServletResponse response) {
		String forwardURL = "/admin/common/login.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
		try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	@GetMapping("/{admin_id}")
	public String login(String admin_id, String admin_password, HttpSession session) {
		String msg = "-1";
		try {
			Admin admin = dao.selectById(admin_id);
			if (admin_password.equals( admin.getAdmin_password() ) ) {
				if ("N".equals( admin.getAdmin_state_flag() ) ) {
					session.setAttribute("loginInfo", admin);
					session.setMaxInactiveInterval(10000);
					msg = "1";
					return msg;
				} else if ("L".equals( admin.getAdmin_state_flag() ) ) {
					msg = "leave";
					return msg;
				} else if ("S".equals( admin.getAdmin_state_flag() ) ) {
					msg = "stop";
					return msg;
				} 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}

	@GetMapping("/common/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session.removeAttribute("loginInfo");
		String forwardURL = "/admin";
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
		try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	@GetMapping("/member/admin")
	public void adminList(HttpServletRequest request, HttpServletResponse response) {
		String msg = "-1";
		try {
			List<Admin> adminList = dao.selectAll();	
			String forwardURL = "/admin/member/admin.jsp";
			request.setAttribute("adminList", adminList);
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			msg = "1";
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/adminAdd")
	public String adminAdd(Admin admin) {
		String msg = "-1";
		try {
			if (dao.selectById(admin.getAdmin_id()) == null) {
				dao.insert(admin);
				msg = "1";
				return msg;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	
	@GetMapping("/adminState")
	public void showState(String admin_state_flag, HttpServletRequest request, HttpServletResponse response) {
		String msg = "-1";
		try {
			List<Admin> adminList = dao.selectByState(admin_state_flag);
			System.out.println(adminList);
			String forwardURL = "/admin/member/admin.jsp";
			request.setAttribute("adminList", adminList);
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			msg = "1";
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@PutMapping("/adminNormal")
	public String normal(@RequestParam("chkList") String[] chkList, Model model) {
		String msg = "-1";
		try {
			for( int i = 0 ; i < chkList.length; i++ ){	
				String admin_id = chkList[i];
				System.out.println(admin_id);
				dao.normal(admin_id);
				System.out.println(admin_id + "normal: 성공");
			};
			msg = "1";
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	@PutMapping("/adminStop")
	public String stop(@RequestParam("chkList") String[] chkList, Model model) {
		String msg = "-1";
		try {
			for( int i = 0 ; i < chkList.length; i++ ){	
				String admin_id = chkList[i];
				System.out.println(admin_id);
				dao.stop(admin_id);
				};
			msg = "1";
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	@PutMapping("/adminLeave")
	public String leave(@RequestParam("chkList") String[] chkList, Model model) {
		String msg = "-1";
		try {
			for( int i = 0 ; i < chkList.length; i++ ){	
				String admin_id = chkList[i];
				System.out.println(admin_id);
				dao.leave(admin_id);
				System.out.println(admin_id + "leave: 성공");
				};
			msg = "1";
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}


/*	샘
 * @GetMapping("/adminSearchDate")
	//public String searchDate(Date to_date, Date from_date, HttpServletRequest request, HttpServletResponse response) {
	//public  @ResponseBody List<Admin> searchDate(Date to_date, Date from_date, HttpServletRequest request, HttpServletResponse response) {
	public void searchDate(Date to_date, Date from_date, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("데이트 검색 들어오나 ");
		HashMap<String, Object>map = new HashMap<>();
		List<Admin> adminList=null;
		String msg = "-1";
		try {
			adminList = dao.selectByDate(from_date, to_date);
			if(adminList != null){
				request.setAttribute("adminLsit", adminList);
				request.setAttribute("from_date", from_date);
				request.setAttribute("to_date", to_date);
				System.out.println(adminList);
				msg = "1";
				//return msg;
				//map.put("result", adminList);
				request.setAttribute("adminList", adminList);
				RequestDispatcher rd =
						request.getRequestDispatcher("/admin/adminResult.jsp");
						
				rd.forward(request, response);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/
	
	@GetMapping("/adminSearchDate")
	 public void searchDate(Date to_date, Date from_date, HttpServletRequest request, HttpServletResponse response) {
 		System.out.println("데이트 검색 들어오나 ");
 		String msg = "-1";
 		try {
 			List<Admin> adminList = dao.selectByDate(from_date, to_date);
 			System.out.println(adminList + "셀렉트바이데이트 실횅");
 			String forwardURL = "/admin/member/admin.jsp";
 			request.setAttribute("adminList", adminList);
 			request.setAttribute("to_date", to_date);
 			request.setAttribute("from_date", from_date);
 			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
 			msg = "1";
 			dispatcher.forward(request, response);
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
	}
	@GetMapping("/adminSearchItem")
	public void searchItem(String searchCategory, String searchItem, HttpServletRequest request, HttpServletResponse response){
		System.out.println("서치아이템이 되나???");
		System.out.println(searchCategory + " : 카테고리 오나 들어오나 ");
		System.out.println(searchItem + " : 아이템들어오나 ");
		String msg = "-1";
		String forwardURL = "/admin/member/admin.jsp";
		List<Admin> adminList = new ArrayList();
		try {
			
			if( searchCategory.equals("아이디") ){
				adminList = dao.selectByIds(searchItem);
				if(adminList != null){
					System.out.println("아이디: "+ adminList);
					forwardURL = "/admin/member/admin.jsp";
					request.setAttribute("adminList", adminList);
		 			request.setAttribute("searchCategory", searchCategory);
		 			request.setAttribute("searchItem", searchItem);
		 			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
		 			msg = "1";
		 			dispatcher.forward(request, response);
				}
				
			} else if(searchCategory.equals("닉네임")){
				adminList = dao.selectByName(searchItem);
				if(adminList != null){
					System.out.println("닉네임: "+ adminList);
					forwardURL = "/admin/member/admin.jsp";
					request.setAttribute("adminList", adminList);
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
