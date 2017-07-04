package com.photovel.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.photovel.dao.AdminContentDAO;
import com.photovel.dao.AdminUserDAO;
import com.photovel.dao.CommentDAO;
import com.photovel.dao.AdminContentDetailDAO;

import com.photovel.dao.UserDAO;
import com.photovel.vo.Admin;
import com.photovel.vo.AdminContent;
import com.photovel.vo.AdminUser;
import com.photovel.vo.Content;
import com.photovel.vo.Paging;
import com.photovel.vo.AdminContentDetail;
import com.photovel.vo.Photo;
import com.photovel.vo.User;

@RestController
@RequestMapping("/admin/board/content")
public class AdminContentController {
	@Autowired
	private AdminContentDAO AdminContentDao;
	@Autowired
	private AdminContentDetailDAO AdmincontentDetailDao;
	@Autowired
	private AdminUserDAO userDao;
	//@Autowired
	//private CommentDAO commentDao;
	@GetMapping
	public void contentList(HttpServletRequest request, HttpServletResponse response) {
		
		int totalCount = 0 ;//토탈카운트를 세는 메서드가 필요함
		
		try {
			Paging paging = new Paging();
			paging.setPageNo(1);
			paging.setPageSize(10);
			List<AdminContent> contentList = AdminContentDao.selectAllAdmin();	
			totalCount = contentList.size();
			paging.setTotalCount(totalCount);
			String forwardURL = "/admin/board/content.jsp";
			request.setAttribute("paging", paging);
			request.setAttribute("contentList", contentList);
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 라디오 버튼 선택시 선택된 게시글만 조회함
	 * @param content_delete_status
	 * @param request
	 * @param response
	 */
	@GetMapping("/state")
	public void showState(String content_delete_status, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("content state in" + content_delete_status);
		try {
			if ("A".equals(content_delete_status)){
				//A : 전체 게시글
				List<AdminContent> contentList = AdminContentDao.selectAllAdmin();	
				String forwardURL = "/admin/board/content.jsp";
				request.setAttribute("contentList", contentList);
				RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
				dispatcher.forward(request, response);
			}
			// T: 사용자 삭제, F: 게시, M: 어드민 삭제
			List<AdminContent> contentList  = AdminContentDao.selectByDeleteStatus(content_delete_status);
			System.out.println(contentList);
			String forwardURL = "/admin/board/content.jsp";
			request.setAttribute("contentList", contentList);
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 체크 박스 선택 및 버튼 클릭시 선택된 게세글의 삭제가 게시 상태(F)로 변경됨
	 * @param chkList
	 * @param model
	 * @return
	 */

	
	@PutMapping("/normal/{chkList}")
	public String normalStatus(@RequestParam("chkList") String[] chkList, Model model) {
		String msg = "-1";
		System.out.println(chkList);
		try {
			for( int i = 0 ; i < chkList.length; i++ ){	
				int content_id = Integer.parseInt(chkList[i]);
				System.out.println(content_id);
				AdminContentDao.updateDeleteStatusNormal(content_id);
				System.out.println(content_id + "normal: 성공");
			};
			msg = "1";
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	/**
	 * 체크 박스 선택 및 버튼 클릭시 선택된 게세글의 상태가 사용자 삭제(T) 상태로 변경됨
	 * @param chkList
	 * @param model
	 * @return
	 */
	@PutMapping("/delete/{chkList}")
	public String deleteStatus(@RequestParam("chkList") String[] chkList, Model model) {
		String msg = "-1";
		try {
			for( int i = 0 ; i < chkList.length; i++ ){	
				int content_id = Integer.parseInt(chkList[i]);
				System.out.println(content_id);
				AdminContentDao.updateDeleteStatusDelete(content_id);
				System.out.println(content_id + "사용자 삭제: 성공");
				};
			msg = "1";
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	/**
	 * 체크 박스 선택 및 버튼 클릭시 선택된 게시글의 상태가 어드민 삭제 (M)상태로 변경됨
	 * @param chkList
	 * @param model
	 * @return
	 */
	@PutMapping("/MangerDelete/{chkList}")
	public String deleteManagerStatus(@RequestParam("chkList") String[] chkList, Model model) {
		String msg = "-1";
		try {
			for( int i = 0 ; i < chkList.length; i++ ){	
				int content_id = Integer.parseInt(chkList[i]);
				System.out.println(content_id);
				AdminContentDao.updateDeleteStatusManager(content_id);
				System.out.println(content_id + "어드민 딜리트: 성공");
				};
			msg = "1";
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	
	/*@GetMapping("/{content_id}")
    public Content selectById(@PathVariable int content_id){
		Content content = AdminContentDao.selectByContentId(content_id);
		content.setDetails(contentDetailDao.selectById(content_id));
		content.setComments(commentDao.selectByContentId(content_id));
		return content;
    }
*/
	@PostMapping(value="/add", consumes = "multipart/form-data")
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void insert(
			@RequestParam(value="user_id")String user_id, 
			@RequestParam(value="content_subject")String content_subject,
			@RequestParam(value="content1")String content1,
			@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile,
			HttpServletRequest request, HttpServletResponse response ){
		System.out.println("어드민 콘텐츠 추가" + content_subject + content1);
		//Content content;
		int content_id;
		// photo_file_name 만들기

		try {
			String user_idUTF = URLDecoder.decode(user_id,"UTF-8");
			String content_subjectUTF  = URLDecoder.decode(content_subject,"UTF-8");
			String contentUTF = URLDecoder.decode(content1,"UTF-8");
			
			System.out.println(user_idUTF+", "+content_subjectUTF+", " +contentUTF);
			AdminContent content = new AdminContent();
			User user = new User();
			user.setUser_id(user_idUTF);
			content.setUser(user);
			content.setContent_subject(content_subjectUTF);
			content.setContent(contentUTF);
			AdminContentDao.insert(content);
			content_id = AdminContentDao.selectCurId();
			AdminContentDetail detail = new AdminContentDetail();
			Photo photo = new Photo();
			StringBuilder detail_id = new StringBuilder();
			
			//웹에서 사진의 날짜를 추출하는 기능이 필요함
			//현재는 들어오는 날짜를 이용해서 photo_file_name 생성
			detail_id.append(content_id).append("_")
			.append(new SimpleDateFormat("yyyy-MM-dd-hh24-mm-ss").format(new Date()))
			.append("_0");
			photo.setPhoto_file_name(detail_id.toString()+".jpg");
			photo.setContent_detail_id(detail_id.toString());
			photo.setContent_id(content_id);
			photo.setPhoto_date(new Date());
			photo.setPhoto_latitude(0);
			photo.setPhoto_longitude(0);
			photo.setPhoto_top_flag(1);
			detail.setPhoto(photo);
			detail.setContent_id(content_id);
			detail.setContent_detail_id(detail_id.toString());
			AdmincontentDetailDao.insert(detail);
			uploadPicture(uploadFile, detail, request);
			
			/*여러장 할 때는이것을 이용해야합니당!
			 * 
			List<ContentDetail> details = content.getDetails();
			for(int i = 0; i < details.size(); i++){
				ContentDetail detail = details.get(i);
				insertDetail(content_id, detail, i);
				uploadPicture(uploadFile, detail, request);
			}*/
			
			// 인서트 완료 후 content.jsp 화면으로 다시 보내기 
			List<AdminContent> contentList = AdminContentDao.selectAllAdmin();	
			String forwardURL = "/admin/board/content.jsp";
			request.setAttribute("contentList", contentList);
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			dispatcher.forward(request, response);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		};
		
	}	
	public void insertDetail(int content_id, AdminContentDetail detail, int i){
		String photo_date = new SimpleDateFormat("yyyy-MM-dd-hh24-mm-ss").format(detail.getPhoto().getPhoto_date());
		StringBuilder content_detail_id = new StringBuilder();
		content_detail_id.append(content_id).append("_").append(photo_date).append("_"+i);
		detail.setContent_detail_id(content_detail_id.toString());
		StringBuilder photo_file_name = new StringBuilder();
		photo_file_name.append(detail.getContent_detail_id()).append(".jpg");
		
		//content_detail에 content_id, content_detail_id 저장
		detail.setContent_id(content_id);
		detail.setContent_detail_id(content_detail_id.toString());
		
		//photo에 content_id, content_detail_id, photo_file_name 저장
		detail.getPhoto().setContent_id(content_id);
		detail.getPhoto().setContent_detail_id(content_detail_id.toString());
		detail.getPhoto().setPhoto_file_name(photo_file_name.toString());
		AdmincontentDetailDao.insert(detail);
	}
	public void uploadPicture(MultipartFile uploadFile, AdminContentDetail detail, HttpServletRequest request){
		OutputStream out = null;
		PrintWriter printWriter = null;
		try {
			// 파일의 바이트 정보 얻기
			byte[] bytes = uploadFile.getBytes();
			String path = request.getSession().getServletContext().getRealPath("");
			String uploadPath = path + "/upload/"+detail.getContent_id()+"/"+detail.getPhoto().getPhoto_file_name();
			
			File file = new File(uploadPath);
			// 상위 폴더 존재 여부 확인
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
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
	/* 0629 */
	/*@GetMapping("/{user_phone1}")
	public void selectByPhone1(int user_Phone1, HttpServletRequest request, HttpServletResponse response){
		try {
			List<AdminContent> contentList = AdminContentDao.selectByPhone1(user_phone1);	
			String forwardURL = "/admin/board/content.jsp";
			request.setAttribute("contentList", contentList);
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	


}