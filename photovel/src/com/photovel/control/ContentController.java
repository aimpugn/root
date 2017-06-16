package com.photovel.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	
	@GetMapping("/{content_id}")
    public Content selectById(@PathVariable int content_id){
		Content content = contentDao.selectById(content_id);
		content.setDetails(contentDetailDao.selectById(content_id));
		content.setComments(commentDao.selectById(content_id));
		return content;
    }
	
	@GetMapping
    public List<Content> selectAllOrderByDate(){
		List<Content> contents = contentDao.selectAll();
		return contents;
    }

	@PostMapping(produces = "application/json", consumes = "multipart/form-data")
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void insert(@RequestParam("uploadFile") MultipartFile[] uploadFile,
						@RequestParam("content")
			String obj, HttpServletRequest request){
		Content content = JSON.parseObject(obj, Content.class);
		System.out.println(content);
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		contentDao.insert(content);
		List<ContentDetail> details = content.getDetails();
		for(int i = 0; i < details.size(); i++){
			//detail값 얻어오기
			ContentDetail detail = details.get(i);
			
			int content_id = contentDao.selectCurId();
			StringBuilder photo_file_name = new StringBuilder();
			photo_file_name.append(content_id).append("_").append(detail.getContent_detail_id()).append(".jpg");
			
			//photo에 detail_id, photo_file_name 저장
			detail.getPhoto().setContent_detail_id(detail.getContent_detail_id());
			detail.getPhoto().setPhoto_file_name(photo_file_name.toString());
			contentDetailDao.insert(detail);
			try {
				// 파일의 바이트 정보 얻기
				byte[] bytes = uploadFile[i].getBytes();
				String path = request.getSession().getServletContext().getRealPath("");
				String uploadPath = path + "/upload/"+content_id+"/"+detail.getPhoto().getPhoto_file_name();
				
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
	
	@PutMapping
	public String update(@PathVariable Content content){
		contentDao.update(content);
		List<ContentDetail> details = content.getDetails();
		for(ContentDetail detail: details){
			contentDetailDao.insert(detail);
		}
		return "1";
	}
	
	@DeleteMapping("/{content_id}")
	public String delete(@PathVariable int content_id){
		contentDao.updateDeleteStatus(content_id);
		return "1";
	}
}