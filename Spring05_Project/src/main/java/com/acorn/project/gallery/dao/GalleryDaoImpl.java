package com.acorn.project.gallery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.project.gallery.dto.GalleryDto;

@Repository
public class GalleryDaoImpl implements GalleryDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(GalleryDto dto) {
		session.insert("gallery.insert", dto);
	}
	@Override
	public GalleryDto getData(int num) {
		return session.selectOne("gallery.getData", num);
	}
	@Override
	public List<GalleryDto> getList(GalleryDto dto) {
		return session.selectList("gallery.getList", dto);
	}
	@Override
	public int getCount() {
		return session.selectOne("gallery.getCount");
	}
	
}
