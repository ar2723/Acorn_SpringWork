package com.acorn.project.cafe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.project.cafe.dto.CafeDto;
import com.acorn.project.cafe.dto.ClassCafeDto;

@Repository
public class ClassCafeDaoImpl implements ClassCafeDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ClassCafeDto> getList(ClassCafeDto dto) {
		return session.selectList("classCafe.getList", dto);
	}

	@Override
	public int getCount(ClassCafeDto dto) {
		return session.selectOne("classCafe.getCount", dto);
	}

	@Override
	public void insert(ClassCafeDto dto) {
		session.insert("classCafe.insert", dto);
		
	}

	@Override
	public ClassCafeDto getData(int num) {
		return session.selectOne("classCafe.getData", num);
	}

	@Override
	public ClassCafeDto getData(ClassCafeDto dto) {
		return session.selectOne("classCafe.getData2", dto);
	}

	@Override
	public void addViewCount(int num) {
		session.update("classCafe.addViewCount", num);
		
	}
	
	@Override
	public void addLikeCount(int num) {
		session.update("classCafe.addLikeCount", num);
		
	}

	@Override
	public void delete(int num) {
		session.delete("classCafe.delete", num);
		
	}

	@Override
	public void update(ClassCafeDto dto) {
		session.update("classCafe.update", dto);
		
	}

}
