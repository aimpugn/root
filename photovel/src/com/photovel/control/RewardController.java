package com.photovel.control;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.photovel.common.UtilFile;

@RestController
@RequestMapping("/upload")
public class RewardController {
	// 파일을 업로드하는 컨트롤러 클래스 메소드
	@PostMapping
	// 인자로 MulfiPartFile 객체, MultipartHttpServletRequest 객체, 업로드 하려는 도메인 클래스를 받는다
	public void reAddProCtrl(@RequestParam("uploadFile") MultipartFile uploadFile,
			MultipartHttpServletRequest request, Object obj) {
		System.out.println("RewardController reAddProCtrl uploadFile : " + uploadFile);
		System.out.println("RewardController reAddProCtrl obj : " + obj);
		// UtilFile 객체 생성
		UtilFile utilFile = new UtilFile();
		// 파일 업로드 결과값을 path로 받아온다(이미 fileUpload() 메소드에서 해당 경로에 업로드는 끝났음)
		String uploadPath = utilFile.fileUpload(request, uploadFile, obj);
		System.out.println("RewardController reAddProCtrl uploadPath : " + uploadPath);

	}
}
