package com.acorn.project.cafe.service;

import javax.servlet.http.HttpServletRequest;

import com.acorn.project.cafe.dto.CafeCommentDto;
import com.acorn.project.cafe.dto.CafeDto;
import com.acorn.project.cafe.dto.ClassCafeDto;

public interface ClassCafeService {
	public void getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void getDetailAddedLike(HttpServletRequest request);
	public void saveContent(ClassCafeDto dto);
	public void updateContent(ClassCafeDto dto);
	public void addLikeCount(HttpServletRequest request);
	public void deleteContent(int num, HttpServletRequest request);
	public void getData(HttpServletRequest request); //글 수정하기 위해 정보 불러오는 기능
	
	public void saveComment(HttpServletRequest request); //댓글 저장
	public void deleteComment(HttpServletRequest request); //댓글 삭제
	public void updateComment(CafeCommentDto dto); //댓글 수정
	public void moreCommentList(HttpServletRequest request); //댓글 더보기 기능
	
}
