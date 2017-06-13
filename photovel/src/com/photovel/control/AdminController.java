package com.photovel.control;


import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.photovel.vo.Admin;
import com.photovel.dao.AdminDAO;



@Controller
public class AdminController {
	
	@Autowired
	AdminDAO dao;
	
	@GetMapping(value="/admin")
	public String goLogin(Model model){
	      boolean admin=true;
	      model.addAttribute("admin", admin);
	      String forwardURL="/admin/common/login.jsp";
	      return forwardURL;
	}
	
	@GetMapping(value="/admin/adminLogin")
	public String login(String adminId, String adminPassword, HttpSession session, Model model) {
		System.out.println("들어오나"+adminId+ adminPassword);
		String msg = "-1";
		
		try{
			Admin ad = dao.selectById(adminId);
			//String status = ad.getadminStatusFlag();
			//String pw = ad.getAdminPassword();
			String status = "N";
			String pw = "1234";
			//System.out.println(status);
			System.out.println("트라이 되나"+adminId+ adminPassword);
			if( adminPassword.equals(pw) ){		
				if ( !"L".equals( status ) && !"S".equals( status ) ) {
				Admin adm = dao.login(adminId, adminPassword);
				System.out.println("트라이 안의 아이디 패스워드 "+ adminId + adminPassword);
	        	session.setAttribute("loginInfo", adm);// 로그인 정보를 지움. 현재 로그인 실패해도 이전의 로그인 성공 작업이 남는 것을 방지 
	        	session.setMaxInactiveInterval(10000);
	        	msg = "1";
	        	System.out.println("로그인 성공");
				} else if( "L".equals( status ) ){
					msg = "leave";
					System.out.println("리브 상태값"+msg);
				} else{
					msg = "stop";
					System.out.println("정지 상태값"+msg);
				}
			} 
		}catch (Exception e) {
			System.out.println(adminId+ adminPassword);
			e.printStackTrace();
		}
		model.addAttribute("msg", msg);
		String forwardURL = "/admin/common/result.jsp"; 
		return forwardURL;
	}

	@GetMapping(value="/admin/common/logout")
	public String logout(Model model, HttpSession session, HttpServletRequest request) {
		
		model.addAttribute("msg", request.getContextPath());  
		session.removeAttribute("loginInfo");
		String forwardURL = "/admin";
		return forwardURL;
	}
	
	@PostMapping(value="/admin/adminAdd")
	public String adminAdd(String adminId, String adminPassword, String adminNickName, String adminStatus, Model model) throws ServletException, IOException{
		String msg="-1";
		try {
			Admin ad = dao.selectById(adminId) ;
			if (ad != null ){
				Admin adm = new Admin(adminId, adminPassword, adminNickName, adminStatus);
				dao.regist(new Admin(adminId, adminPassword, adminNickName, adminStatus));
				System.out.println(adm);
				msg="1";
				}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("msg", msg);
		String forwardURL = "/admin/common/result.jsp"; 
		return forwardURL;
	}
	
	
	/*@RequestMapping(value="/membermanagelist.do")
	public String membermanagelist(HttpSession session, Model model){
		List<Customer> memlist = new ArrayList<>();
		try {	         
	         memlist=cDao.selectAll();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
			
			model.addAttribute("memlist", memlist);	      		        
			String forwardURL = "admin/membermanagelist.jsp"; 
			return forwardURL;
	}*/
	
	
	/*@RequestMapping(value="/memberstatussearch.do")
	public String memberstatussearch(@RequestParam("statusD") boolean statusD, @RequestParam("statusB") boolean statusB, 
			@RequestParam("statusNormal") boolean statusNormal,  @RequestParam("statusAll") boolean statusAll,
			HttpSession session, Model model){
	public String memberstatussearch(@RequestParam("status") List<String> statuses, HttpSession session, Model model){
		List<Customer> memlist = new ArrayList<>();
		String forwardURL = "admin/membermanagelist.jsp"; 
		try {
			if(statuses.contains("normal")){
	         //if(statusNormal == true && statusD == false && statusB == false && statusAll == false){
	        	 memlist=cDao.selectByStatus(null);
	        	 model.addAttribute("memlist", memlist);	      		        
	        	 return forwardURL;
			}else if(statuses.contains("d")){
	        // }else if(statusNormal == false && statusD == true && statusB == false && statusAll == false){
	        	 memlist=cDao.selectByStatus("d");	        	 
	        	 model.addAttribute("memlist", memlist);	      		        
	        	// model.addAttribute("status", 'd');
	        	 return forwardURL;
			}else if(statuses.contains("b")){
	        // }else if(statusNormal == false && statusD == false && statusB == true && statusAll == false){
	        	 memlist=cDao.selectByStatus("b");
	        	// model.addAttribute("status", 'b');
	        	 model.addAttribute("memlist", memlist);	      		        
	        	 return forwardURL;
	         }else{
	        	 memlist=cDao.selectAll();
	        	 model.addAttribute("memlist", memlist);	      		        
	        	 return forwardURL;
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
      		        
		return forwardURL;
	}*/
	
	/*@RequestMapping(value="/membersearch.do")
	public String membersearch(@RequestParam(required=false, defaultValue="schId")String searchItem, 
			  @RequestParam(required=false, defaultValue="")String searchValue, HttpSession session, Model model){
		System.out.println("확인");
		List<Customer> memlist = new ArrayList<>();
		try {
	         if(searchValue.equals("")){
	        	 memlist=cDao.selectAll();
	         }else if("schD".equals(searchItem) || "schB".equals(searchItem) || "schNormal".equals(searchItem)){
	        	 memlist=daoC.selectByStatus(searchValue);	        	 
	         }else if("schName".equals(searchItem)){
		         memlist=cDao.selectByName(searchValue);
	         }else if("schId".equals(searchItem)){
	            Customer c = cDao.selectById(searchValue);
	            if(c!=null){
	               memlist.add(c);
	            }
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
			
			model.addAttribute("memlist", memlist);	      		        
			String forwardURL = "admin/membermanagelist.jsp"; 
			return forwardURL;
	}*/
	
	/*@RequestMapping(value="/memberadd.do", method=RequestMethod.POST)
	public String memberadd(String id, String password, String name, Date joindate, Model model) throws ServletException, IOException{
		String msg="-1";
		try {
			cDao.insert(new Customer(id, password, name, joindate));
			msg="1";
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("msg", msg);
		String forwardURL = "/result.jsp"; 
		return forwardURL;
	}*/
	/*
	@RequestMapping(value="/memberupdate.do", method=RequestMethod.POST)
	public String memberupdate(@RequestParam(required=false, defaultValue="") String status,  String id, String password, String name, Date joindate, Model model) throws ServletException, IOException{
		String msg="-1";
		System.out.println("update 확인");
		System.out.println(id+password+name+joindate+"status"+status);
		String forwardURL = "/result.jsp"; 
		try {
			Customer memlist = new Customer(id, password, name, status, joindate);
			cDao.adminUpdate(memlist);
			System.out.println(memlist);
			System.out.println("성공");
			msg="1";
			model.addAttribute("msg", msg);
			model.addAttribute(memlist);
			forwardURL = "/membermanagelist.do";;
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("msg", msg);
		return forwardURL;
	}*/
	
	/*@RequestMapping(value="/memberdata.do")
	public String memberupdate(String id, String password, String name, 
			@RequestParam(required=false,defaultValue="")String status, Date joindate,
			HttpSession session, Model model){
		List<OrderInfo> info_list;
		String msg ="-1";
		String forwardURL = "/result.jsp";
		try {
			if(id != null && password != null && name != null){
			 주문정보 
			info_list = oDao.selectById(id);
			model.addAttribute("info_list",info_list);
			 회원정보 
			Customer cs = new Customer(id, password, name, status, joindate);
			model.addAttribute("cs", cs);
			msg = "1";
			forwardURL = "admin/memberupdate.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("msg", msg);
		return forwardURL;
	}*/
	
	/*@RequestMapping(value="/memberremove.do")
	public String memberremove(String[] chkList, HttpSession session, Model model){
		String msg ="-1";
		String forwardURL = "/result.jsp";
		try {
			for( int i = 0 ; i < chkList.length; i++ ){	
				String id = chkList[i];
				cService.remove(id);
			};
			msg="1";
			forwardURL = "/membermanagelist.do";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("msg", msg);
		return forwardURL;
	}*/
	
	

	/*@RequestMapping(value="/signup.do", method=RequestMethod.POST)
	public String signup(String id, String pw, String memName, Model model) {
		String msg="-1";
		try {
			//1. 
			service.regist(new Admin(id, pw, memName));
			msg="1";
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("msg", msg);
		String forwardURL = "/result.jsp"; 
		return forwardURL;
		
	}*/
	

	/*@RequestMapping(value="/admindetail.do")
	public String admindetail(HttpSession session, Model model){

		Admin ad = (Admin)session.getAttribute("loginInfo");
		model.addAttribute("id", ad.getId());
		model.addAttribute("password", ad.getPassword());
		model.addAttribute("name", ad.getName());
	

		String forwardURL = "/admindetailresult.jsp"; 
		return forwardURL;
	}*/
	
	/*@RequestMapping(value="/admindetailmodify.do", method=RequestMethod.POST)
	public String admindetailmodify(String id, String name, String password, String passwordchk, HttpSession session, Model model){
		String msg ="-1";
		String forwardURL = "/result.jsp";
		try {
			if(password.equals(passwordchk)){
				Admin ad = new Admin(id, password, name);
				service.modify(ad);
				forwardURL = "/admindetail.do";
				msg="1";
				session.removeAttribute("loginInfo");
				session.setAttribute("loginInfo", ad);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("msg", msg);
		return forwardURL;
	}*/
		
	
	/*@RequestMapping(value="/adminleave.do")
	public String memberlevae(String[] chkList, HttpSession session, Model model){
		String msg ="-1";
		String forwardURL = "/result.jsp";
		try {
			for( int i = 0 ; i < chkList.length; i++ ){	
				String id = chkList[i];
				cService.leave(id);
			};
			msg="1";
			forwardURL = "/membermanagelist.do";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("msg", msg);
		return forwardURL;
	}*/
	
	
}
