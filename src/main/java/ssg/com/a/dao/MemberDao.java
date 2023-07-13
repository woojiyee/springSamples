package ssg.com.a.dao;

import ssg.com.a.dto.LoginDto;
import ssg.com.a.dto.MemberDto;

public interface MemberDao {

	public int idcheck(String id);
	
	public int regiAf(MemberDto dto);
	
	public MemberDto loginAf(LoginDto logdto);
}
