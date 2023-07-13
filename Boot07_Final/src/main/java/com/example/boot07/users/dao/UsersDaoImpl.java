package com.example.boot07.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.boot07.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao{
	
	@Autowired
	private SqlSession session;
	
	/*
	 * 매개변수로 전달되는 아이디가 DB에 이미 존재하는지 여부를 리턴하는 메소드
	 */
	@Override
	public boolean isExist(String inputId) {
		//전달된 아이디로 select해서
		UsersDto dto = session.selectOne("users.getData", inputId);
		//아이디 존재 여부를 알아내서(null이면 존재하지 않고, null이 아니면 존재한다.)
		boolean isExist = dto == null ? false : true;
		return isExist;
	}

	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto);
		
	}

	@Override
	public UsersDto getData(String id) {
		// 여기서 최종적으로 리턴되는 값은 users.getData() 메소드를 호출한 뒤에 반환되는 resultType 데이터이다.
		return session.selectOne("users.getData", id);
	}
	
	@Override
	public void updatePwd(UsersDto dto) {
		int rowCount = session.update("users.updatePwd", dto);
		if(rowCount == 0) {
			
		}
	}

	@Override
	public void update(UsersDto dto) {
		session.update("users.update", dto);
	}

	@Override
	public void delete(String id) {
		session.delete("users.delete", id);
	}
}
