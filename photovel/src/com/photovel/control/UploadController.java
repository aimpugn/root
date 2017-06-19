package com.photovel.control;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


@RestController
@RequestMapping("/upload")
public class UploadController {
	@PostMapping(consumes = { "multipart/form-data" })
	public boolean insert(@RequestParam("content" ) String content,
			@RequestParam(value="img", required=false)MultipartFile[] img){
		System.out.println(content);
		for(int i=0; i<img.length; i++){
			System.out.println(img[i].getOriginalFilename());
		}
		return false;
	}
}
