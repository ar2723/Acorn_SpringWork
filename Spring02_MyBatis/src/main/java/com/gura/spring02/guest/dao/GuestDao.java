package com.gura.spring02.guest.dao;

import java.util.List;
import com.gura.spring02.guest.dto.GuestDto;

//인터페이스는 구현할 클래스의 모양을 강제하는 것이다.
public interface GuestDao {
	public void insert(GuestDto dto);
	public void update(GuestDto dto);
	public void delete(GuestDto dto);
	public GuestDto getData(int num);
	public List<GuestDto> getList();
}
