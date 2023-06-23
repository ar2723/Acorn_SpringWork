package com.gura.spring03.file.dto;

import org.springframework.web.multipart.MultipartFile;

public class FileDto {
	//필드
	private String title;
	//<input type = "file" name="myFile"/> 에서
	//전송되는 파일의 파라미터 명과 dto의 필드명을 일치시켜야 한다.
	private MultipartFile myFile;
	
	//디폴트 생성자
	public FileDto() {}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public MultipartFile getMyFile() {
		return myFile;
	}

	public void setMyFile(MultipartFile myFile) {
		this.myFile = myFile;
	}
}
