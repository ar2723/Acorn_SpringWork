package com.gura.spring02.guest.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring02.guest.dto.GuestDto;

// component scan
// spring이 인식하는 적절한 annotation이 붙어있으면, 알아서 감지해서 이 클래스를 bean으로 만들어서 직접 관리해준다.
// 이렇게 같은 bean들끼리만 서로 핵심 의존 객체를 주입해주고 받을 수 있다.
@Repository
public class GuestDaoImpl implements GuestDao{
	
	//mybatis 기반으로 DB 연동을 하기 위한 핵심 의존 객체를 Dependency Injection 받는다.
	@Autowired
	private SqlSession session;

	@Override
	public void insert(GuestDto dto) {
		/*
		 * 	Mapper's namespace => guest
		 * 	sql's id => insert
		 * 	parameterType => GuestDto
		 */
		session.insert("guest.insert", dto);
	}

	@Override
	public void update(GuestDto dto) {
		session.update("guest.update", dto);
	}

	@Override
	public void delete(GuestDto dto) {
		session.delete("guest.delete", dto);
	}

	@Override
	public GuestDto getData(int num) {
		/*
		 *	Mapper's namespace => guest
		 *	sql's id => getData
		 *	parameterType => int
		 *	resultType => GuestDto
		 */
		return session.selectOne("guest.getData", num);
	}

	@Override
	public List<GuestDto> getList() {
		/*
		 *	Mapper's namespace => guest
		 *	sql's id => getList
		 *	parameterType => X
		 *	resultType => GuestDto
		 */
		return session.selectList("guest.getList");
	}

}
