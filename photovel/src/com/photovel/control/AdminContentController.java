package com.photovel.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.photovel.dao.CommentDAO;
import com.photovel.dao.ContentDAO;
import com.photovel.dao.ContentDetailDAO;
import com.photovel.dao.UserDAO;
import com.photovel.vo.Content;
import com.photovel.vo.ContentDetail;
import com.photovel.vo.User;

@RestController
@RequestMapping("/admin/board/content")
public class AdminContentController {
	@Autowired
	private ContentDAO contentDao;
	@Autowired
	private ContentDetailDAO contentDetailDao;
	@Autowired
	private UserDAO userDao;
	@Autowired
	private CommentDAO commentDao;
	
	@GetMapping
	public void contentList(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Content> contentList = contentDao.selectAllAdmin();	
			String forwardURL = "/admin/board/content.jsp";
			request.setAttribute("contentList", contentList);
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/{content_id}")
    public Content selectById(@PathVariable int content_id){
		Content content = contentDao.selectById(content_id);
		content.setDetails(contentDetailDao.selectById(content_id));
		content.setComments(commentDao.selectById(content_id));
		return content;
    }
	
	/*@GetMapping("/{user_id:.+}")
	public Content selectByAdminUserId(@PathVariable String user_id){
		List<User> userList = userDao.selectByIds(user_id);
		//HashMap<String, Object> list = new HashMap<>();
		//list.put("from_date", from_date);
		//list.put("to_date", to_date);
		
		try {
			if( searchCategory.equals("아이디") ){
				userList = dao.selectByIds(searchItem);
				if(userList != null){
					System.out.println("아이디: "+ userList);
					forwardURL = "/admin/content/content.jsp";
					request.setAttribute("contentList", contentList);
					request.setAttribute("searchCategory", searchCategory);
					request.setAttribute("searchItem", searchItem);
					RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
					msg = "1";
					dispatcher.forward(request, response);
				}
			}
		}
		= ((Object) userList).getUserId();	
		//List<User> userList = dao.selectByState(user_state_flag);
		//List<User> userList = dao.selectByState(user_state_flag);
		//content.setContent_id(contentDao.seletBy);
		//content.setDetails(contentDetailDao.selectById(user_id));
		//content.setComments(commentDao.selectById(user_id));
		return content;
	}*/
	
/*	@GetMapping
    public List<Content> selectAllOrderByDate(){
		List<Content> contents = contentDao.selectAll();
		return contents;
    }
*/
/*	@PostMapping(consumes = "multipart/form-data")
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void insert(@RequestParam("content") String json,
			@RequestParam(value="uploadFile", required=false) MultipartFile[] uploadFile,
			 HttpServletRequest request){
		Content content;
		try {
			content = JSON.parseObject(URLDecoder.decode(json,"UTF-8"), Content.class);
			contentDao.insert(content);
			int content_id = contentDao.selectCurId();
			List<ContentDetail> details = content.getDetails();
			for(int i = 0; i < details.size(); i++){
				ContentDetail detail = details.get(i);
				insertDetail(content_id, detail, i);
				uploadPicture(uploadFile[i], detail, request);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
	}*/
	
/*	@PostMapping("/{content_id}")
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public String update(@PathVariable int content_id, @RequestParam("content") String json, 
			@RequestParam(value="uploadFile", required=false) MultipartFile[] uploadFile,
			 HttpServletRequest request){
		Content content;
		try {
			content = JSON.parseObject(URLDecoder.decode(json,"UTF-8"), Content.class);
			content.setContent_id(content_id);
			contentDao.update(content);
			
			List<ContentDetail> details = content.getDetails();		
			for(int i = 0; i < details.size(); i++){
				ContentDetail detail = details.get(i);
				detail.setContent_id(content_id);
				detail.getPhoto().setContent_id(content_id);
				
				//전에있던 detail인지 새로 추가된 detail인지 확인
				if("".equals(detail.getContent_detail_id())){
					insertDetail(content_id, detail, i);
				}else{
					contentDetailDao.update(detail);
				}
				uploadPicture(uploadFile[i], detail, request);
			}
			return "1";
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "-1";
		}		
	}*/
	
/*	@DeleteMapping("/{content_id}")
	public String delete(@PathVariable int content_id){
		contentDao.updateDeleteStatus(content_id);
		return "1";
	}*/
	
/*	public void insertDetail(int content_id, ContentDetail detail, int i){
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
		contentDetailDao.insert(detail);
	}*/
/*	public void uploadPicture(MultipartFile uploadFile, ContentDetail detail, HttpServletRequest request){
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
	}*/
}