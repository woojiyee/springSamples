package ssg.com.a.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssg.com.a.dto.LoginDto;
import ssg.com.a.dto.MemberDto;
import ssg.com.a.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired // service와 연결?
	MemberService service;
	
	@RequestMapping(value="login.do")
	public String login() {
		System.out.println("MemberController login   " + new Date());
		
		return "login";
	}
	
	@GetMapping("regi.do")
	public String regi() {
		System.out.println("MemberController regi   " + new Date());
		
		return "regi";
	}
	
	@ResponseBody
	@PostMapping("idcheck.do")
	public String idcheck(String id) {
		System.out.println("MemberController idcheck   " + new Date());
		
		boolean isS = service.idcheck(id); // true == 이미 아이디가 존재
		
		String msg = isS==true? "NO":"YES";
		return msg;
	}
	
	@PostMapping("regiAf.do")
	public String regiAf(MemberDto dto,Model model) {
		System.out.println("MemberController regiAf   " + new Date());
		
		boolean isS = service.regiAf(dto); // 회원가입 성공시 true
		
		String result=""; 
		String nextpage = "";
		if(isS == true) { // 회원가입 성공
			result="YES"; 
			nextpage = "login.do";
			 
		} else {  
			result="NO";
			nextpage = "regi.do";
		}
		
		 model.addAttribute("target","회원 가입");
		 model.addAttribute("result",result);
		 model.addAttribute("nextpage",nextpage);
		 
		 return "alert";
	}
	
	@PostMapping("loginAf.do") // 강사님은 login.do로 하심
	public String loginAf(LoginDto logdto, Model model, HttpServletRequest request) { // 따로 logDto를 만들지 않고 걍 MemberDto를 쓰면 아이디랑 비번이 들어가고 그 외엔 알아서 null값이 들어가서 MemberDto로 데이터 넘겨도 될 듯
		System.out.println("MemberController loginAf   " + new Date());
		
		MemberDto dto = service.loginAf(logdto);
		
		//로그인, 비밀번호 매칭 실패 -> 로그인 실패 
		String result="NO"; 
		String nextpage = "login.do";
		if(dto != null) {  // 로그인 성공
			
			// 스프링 프레임을 사용할 때 컨테이너에서 서버 세션 접근하기 <- 컨트롤러 메소드 매개변수에 HttpServletRequest request를 쓰면 어디서든 리퀘스트 접근 가능
			request.getSession().setAttribute("login", dto);
			// 매개변수에 HttpSession session 써서 세션을 접근할 수 있지만 바로 접근 보단 리퀘스트를 거쳐서? 세션 접근을 많이 함
			
			result="YES"; 
			nextpage = "bbslist.do";
		}
		 model.addAttribute("target","로그인");
		 model.addAttribute("result",result);
		 model.addAttribute("nextpage",nextpage);
		 
		 return "alert";
		 
	}
}
