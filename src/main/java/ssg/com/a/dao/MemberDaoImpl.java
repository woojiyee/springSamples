package ssg.com.a.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.a.dto.LoginDto;
import ssg.com.a.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired // mybatis와 연결?
	SqlSession session; 
	// SqlSessionTemplate session; //위의 세션과 같음
	
	String ns = "Member."; // 공통적으로 쓰이는 문자열 걍 선언해서 쓰기도 함

	@Override
	public int idcheck(String id) {
		
		// int count = session.selectOne("Member.idcheck",id);
		int count = session.selectOne(ns + "idcheck",id);
		return count;
	}

	@Override
	public int regiAf(MemberDto dto) {
		
		int count = session.insert(ns + "regi",dto);
		
		return count;
	}

	@Override
	public MemberDto loginAf(LoginDto logdto) {
		MemberDto dto = session.selectOne(ns + "login",logdto); // xml 파일로 데이터 여러개 보내고 싶어도 selectOne에 보내는 데이터를 여러 인자로 넣을 수 없음.. 데이터 인자는 1개여야함.
		return dto;
	}
	
	
}
