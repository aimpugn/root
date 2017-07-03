package com.photovel.control;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.photovel.dao.AdminStaticDAO;
import com.photovel.dao.AdminUserDAO;
import com.photovel.vo.AdminContent;
import com.photovel.vo.AdminUser;

@RestController
@RequestMapping("/admin/static")
public class AdminStaticController {
	@Autowired
	private AdminStaticDAO AdminStaticDao;
	
	@Autowired
	private AdminUserDAO AdminUserDao;
	
	@GetMapping("/dashboard")
	public void countAllPhone1ByDate(HttpServletRequest request, HttpServletResponse response){
	
		List<AdminContent> countAllList;
		List<AdminUser> genderList;
		try{
			countAllList = AdminStaticDao.countAllPhone1ByDate();
			genderList = AdminUserDao.selectByGender();	
			for(int i = 0 ; i < genderList.size() ; i++ ){
				String gender = genderList.get(i).getUser_gender();
				System.out.println(genderList.get(i).getUser_gender_count() + gender);
			}
			String forwardURL = "/admin/static/dashboard.jsp";//"/admin/static/dashboard.jsp";
			request.setAttribute("countAllList", countAllList);
			request.setAttribute("genderList", genderList);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			dispatcher.forward(request, response);
		
			} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*@GetMapping("/dashboard/gender")
	public void selectByPhone1(HttpServletRequest request, HttpServletResponse response){
		try {
			List<AdminContent> genderList = AdminStaticDao.selectByGender();	
			for(int i = 0 ; i < genderList.size() ; i++ ){
				String gender = genderList.get(i).getUser().getUser_gender();
				System.out.println(gender);
			}
			String forwardURL = "/admin/static/dashboard.jsp";
			request.setAttribute("genderList", genderList);
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	
}