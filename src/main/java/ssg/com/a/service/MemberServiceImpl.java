package ssg.com.a.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.a.dao.MemberDao;
import ssg.com.a.dto.LoginDto;
import ssg.com.a.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired // dao와 연결?
	MemberDao dao;

	@Override
	public boolean idcheck(String id) {
		
		return dao.idcheck(id)>0? true:false;
	}

	@Override
	public boolean regiAf(MemberDto dto) {
		return dao.regiAf(dto)>0;
	}

	@Override
	public MemberDto loginAf(LoginDto logdto) {
		return dao.loginAf(logdto);
	}
	
	
}
