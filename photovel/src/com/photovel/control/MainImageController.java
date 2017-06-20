package com.photovel.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.photovel.dao.MainImageDAO;
import com.photovel.vo.MainImage;

@RestController
@RequestMapping("/main")
public class MainImageController {
	@Autowired
	private MainImageDAO imgDAO;
	
	@GetMapping
    public List<MainImage> selectAll(){
		return imgDAO.selectAll();
    }

}
