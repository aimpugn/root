package com.photovel.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/upload")
public class FileUploadController {
	@PostMapping
	public void reAddProCtrl(@RequestParam(value="uploadFile") MultipartFile uploadFile, HttpServletRequest request) {
		OutputStream out = null;
		PrintWriter printWriter = null;
		try {
			// 파일명 얻기
			String fileName = uploadFile.getOriginalFilename();
			// 파일의 바이트 정보 얻기
			byte[] bytes = uploadFile.getBytes();
			// 파일의 저장 경로 얻기
			String path = request.getSession().getServletContext().getRealPath("");
			String uploadPath = path+"/upload/" + fileName;
			// 파일 객체 생성
			File file = new File(uploadPath);
			// 상위 폴더 존재 여부 확인
			if (!file.getParentFile().exists()) {
				// 상위 폴더가 존재 하지 않는 경우 상위 폴더 생성
				file.getParentFile().mkdirs();
			}

			// 파일 아웃풋 스트림 생성
			out = new FileOutputStream(file);
			// 파일 아웃풋 스트림에 파일의 바이트 쓰기
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
