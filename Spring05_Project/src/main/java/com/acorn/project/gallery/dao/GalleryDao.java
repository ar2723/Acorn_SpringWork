package com.acorn.project.gallery.dao;

import java.util.List;
import com.acorn.project.gallery.dto.GalleryDto;

public interface GalleryDao {
	//갤러리에 사진 저장하기
	public void insert(GalleryDto dto);
	//pk num 에 해당하는 DB 에서 gallery 게시글 하나의 data 가져오기
	public GalleryDto getData(int num);
	//gallery 리스트 가져오기
	public List<GalleryDto> getList(GalleryDto dto);
	//모든 ROW의 개수
	public int getCount();
}
