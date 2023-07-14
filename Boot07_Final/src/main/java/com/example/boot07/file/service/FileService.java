package com.example.boot07.file.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.example.boot07.file.dto.FileDto;

public interface FileService {
	//파일 목록 얻어오기
	public void getList(HttpServletRequest request);
	//업로드 된 파일 저장하기
	public void saveFile(FileDto dto, Model model, HttpServletRequest request);
	//파일 하나의 정보 얻어오기
	public FileDto getFileData(int num);
	//파일 삭제하기
	public void deleteFile(int num, HttpServletRequest request);
}
