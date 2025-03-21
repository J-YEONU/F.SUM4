package com.kh.sum.common.util;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MultipartFileUtil {
	public static String save(MultipartFile upfile, String location) {
		String renamedFileName = null;
		String originalFileName = upfile.getOriginalFilename();
		
		log.info("Upfile Name : {}", originalFileName);
		log.info("location : {}", location);
		
		File folder = new File(location);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		renamedFileName = 
				LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + 
				originalFileName.substring(originalFileName.lastIndexOf("."));
		
		try {
			upfile.transferTo(new File(location + "/" + renamedFileName));
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return renamedFileName;
	}

	public static void delete(String location) {
		log.info("location : {}", location);
		
		File file = new File(location);
		
		if(file.exists()) {
			file.delete();
		}
	}
}
