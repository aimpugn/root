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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.photovel.dao.CommentDAO;
import com.photovel.dao.ContentDAO;
import com.photovel.dao.ContentDetailDAO;
import com.photovel.vo.Content;
import com.photovel.vo.ContentDetail;

@RestController
@RequestMapping("/content/photo")
public class ContentController {
	@Autowired
	private ContentDAO contentDao;
	@Autowired
	private ContentDetailDAO contentDetailDao;
	@Autowired
	private CommentDAO commentDao;
	
	@GetMapping("/recommend/{user_id:.+}")
    public void selectAllOrderByGood(@PathVariable String user_id,
    		HttpServletRequest request, HttpServletResponse response){
		
		try {
			String forwardURL = "/content/photo/list/response";
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			List<Content> contents = contentDao.selectAllOrderByGood(user_id);
			request.setAttribute("contents", contents);
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
    }
	
	@GetMapping("/new/{user_id:.+}")
    public void selectAllOrderByDate(@PathVariable String user_id,
    		HttpServletRequest request, HttpServletResponse response){
		
		try {
			String forwardURL = "/content/photo/list/response";
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			List<Content> contents = contentDao.selectAllOrderByDate(user_id);
			request.setAttribute("contents", contents);
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
    }
	
	@GetMapping("/{content_id}/{user_id:.+}")
    public void selectByContentId(@PathVariable int content_id, @PathVariable String user_id,
    		HttpServletRequest request, HttpServletResponse response){
		
		try {
			String forwardURL = "/content/photo/one/response";
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("content_id", content_id);
			map.put("user_id", user_id);
			
			Content content = contentDao.selectByContentId(map);
			content.setDetails(contentDetailDao.selectById(content_id));
			content.setComments(commentDao.selectByContentId(content_id));
			
			request.setAttribute("content", content);
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
    }
	
	//다른사람 스토리
	@GetMapping("/user/{user_id1:.+}/{user_id2:.+}")
    public void selectByUserId(@PathVariable String user_id1, @PathVariable String user_id2, 
    		HttpServletRequest request, HttpServletResponse response){
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("user_id1", user_id1);
			map.put("user_id2", user_id2);
			String forwardURL = "/content/photo/list/response";
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			List<Content> contents = contentDao.selectByUserId(map);
			request.setAttribute("contents", contents);
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
    }
	
	//내스토리
	@GetMapping("/my/{user_id:.+}")
    public void selectMyStory(@PathVariable String user_id,
    		HttpServletRequest request, HttpServletResponse response){
		
		try {
			String forwardURL = "/content/photo/list/response";
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardURL);
			List<Content> contents = contentDao.selectMyStory(user_id);
			request.setAttribute("contents", contents);
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
    }
	
	@DeleteMapping("/{content_id}")
	public void delete(@PathVariable int content_id){
		contentDao.updateDeleteStatus(content_id);
	}
	
	@PostMapping("/{content_id}/warning")
	public void warning(@PathVariable int content_id){
		if(contentDao.selectContentWarningStatus(content_id) < 6){
			contentDao.updateWarningStatus(content_id);
		}else{
			contentDao.updateDeleteStatusByWarning(content_id);
		}
	}

	@GetMapping("/list/response")
	public List<Content> selectContentListResponse(HttpServletRequest request){
		List<Content> contents = (List<Content>) request.getAttribute("contents");
		return contents;
    }
	
	@GetMapping("/one/response")
	public Content selectContentResponse(HttpServletRequest request){
		Content content = (Content) request.getAttribute("content");
		return content;
    }
	
	@PostMapping(consumes = "multipart/form-data")
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public int insert(@RequestParam("content") String json,
			@RequestParam(value="uploadFile", required=false) MultipartFile[] uploadFile,
			 HttpServletRequest request, HttpSession session){
		Content content;
		int content_id;
		try {
			content = JSON.parseObject(URLDecoder.decode(json,"UTF-8"), Content.class);
			/*User user =(User) session.getAttribute("loginInfo");
			content.setUser(user);*/
			contentDao.insert(content);
			content_id = contentDao.selectCurId();
			List<ContentDetail> details = content.getDetails();
			for(int i = 0; i < details.size(); i++){
				ContentDetail detail = details.get(i);
				insertDetail(content_id, detail, i);
				uploadPicture(uploadFile[i], detail, request);
			}
			return content_id;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	@PostMapping("/{content_id}")
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int update(@PathVariable int content_id, @RequestParam("content") String json, 
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
			return content_id;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return content_id;
		}		
	}
	

	public void insertDetail(int content_id, ContentDetail detail, int i){
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
	}
	public void uploadPicture(MultipartFile uploadFile, ContentDetail detail, HttpServletRequest request){
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
}