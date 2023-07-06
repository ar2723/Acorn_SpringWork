package com.acorn.project.cafe.dao;

import java.util.List;

import com.acorn.project.cafe.dto.CafeDto;
import com.acorn.project.cafe.dto.ClassCafeDto;

public interface ClassCafeDao {
	//글목록
	public List<ClassCafeDto> getList(ClassCafeDto dto);
	//글의 갯수
	public int getCount(ClassCafeDto dto);
	//글 추가
	public void insert(ClassCafeDto dto);
	//글 정보 얻어오기
	public ClassCafeDto getData(int num);
	//키워드를 활용한 글정보 얻어오기 (키워드에 부합하는 글 중에서 이전 글, 다음 글의 번호도 얻어올 수 있도록)
	public ClassCafeDto getData(ClassCafeDto dto);
	//조회수 증가시키기
	public void addViewCount(int num);
	//좋아요 수 증가시키기
	public void addLikeCount(int num);
	//글 삭제
	public void delete(int num);
	//글 수정
	public void update(ClassCafeDto dto);
}
