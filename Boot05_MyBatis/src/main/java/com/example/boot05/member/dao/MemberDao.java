package com.example.boot05.member.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.boot05.member.dto.MemberDto;

@Repository
public class MemberDao {
	@Autowired SqlSession session;
	
	public List<MemberDto> getList() {
		return session.selectList("member.getList");
	}
	
	public void insert(MemberDto dto) {
		session.insert("member.insert", dto);
	}
	
	public void delete(int num) {
		session.insert("member.delete", num);
	}
	
	public void getData(int num, HttpServletRequest request) {
		MemberDto dto = session.selectOne("member.getData", num);
		request.setAttribute("dto", dto);
	}
	
	public void update(MemberDto dto) {
		session.update("member.update", dto);
	}
}
