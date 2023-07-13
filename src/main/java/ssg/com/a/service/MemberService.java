package ssg.com.a.service;

import ssg.com.a.dto.LoginDto;
import ssg.com.a.dto.MemberDto;

public interface MemberService {

	boolean idcheck(String id); // 어차피 impl 클래스의 메소드가 호출되서 여기선 public안 붙여도 되고 impl클래스의 메소드에만 public만 붙여주면 됨.
	boolean regiAf(MemberDto dto);
	MemberDto loginAf(LoginDto logdto);
}
