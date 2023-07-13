<%@page import="ssg.com.a.dto.MemberDto"%>
<%-- <%@page import="util.BbsUtil"%>
<%@page import="java.util.List"%> --%>
<%@page import="ssg.com.a.dao.BbsDao"%>
<%@page import="ssg.com.a.dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	List<BbsDto> list = (List)request.getAttribute("bbslist");
	int pageBbs = (Integer)request.getAttribute("pageBbs");
	int pageNumber = (Integer)request.getAttribute("pageNumber");
	String choice = (String)request.getAttribute("choice");
	String search = (String)request.getAttribute("search");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>

<h1>게시판</h1>

<p align="center"><%MemberDto mem = (MemberDto)session.getAttribute("login"); %>
   <%= mem.getId() %>님 납셨다.</p>
<br>

<a href="calendar?param=calendarlist">일정 관리</a>
<div align = "center">
	<table border="1" class="table table-hover">
		<col width="70"><col width="600"><col width="100"><col width="150">
		<thead>
			<tr>
				<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th>
			<tr>
		</thead>
		<tbody>
			<%
				if(list == null || list.size() == 0){
					%>
					<tr>
						<td colspan="4"> 작성된 글이 없습니다.</td>
					</tr>
					<%
				} else {
					for(int i=0; i < list.size(); i++){
						BbsDto bbs = list.get(i);
					
						%>
						<tr>
							<td> <%=i + 1 %></td>
							<%
								if(bbs.getDel() == 0){
									%>
									<td>
										<a href="bbs?param=bbsdetail&seq=<%=bbs.getSeq()%>">
											<!-- 게시글 리스트 페이지에 뜨지 않고 게시글 상세 페이지에서 원본글 아래 표현하는 글: 댓글
											원본글과 동일하게 게시글 리스트 페이지에 표현하는 글: 답글 -->
											<%= BbsUtil.arrow(bbs.getDepth()) %>
											<%=BbsUtil.titleDot(bbs.getTitle()) %>
										</a>
									</td>
									<%
								} else {
									%>
									<td>
										<%= BbsUtil.arrow(bbs.getDepth()) %>
										<font color="#ff0000">이 글은 삭제된 글입니다.</font>
									<%
								}
								%>
							<td><%=bbs.getReadcount() %></td>
							<td>
								<%=bbs.getId() %>
							</td>
						</tr>
						<%
					}
				}
			%>
		</tbody>		
	</table>
	
	<%
		for(int i = 0 ; i < pageBbs ; i++){
			if(pageNumber == i){ // 현재 페이지
				%>
				<span style="font-size: 15pt; color:blue; font-weight: bold;">
					<%=i+1 %>
				</span>
				<% 
			} else { // 그 밖의 페이지
				%>
				<a href="#none" title="<%=i+1%>페이지" onclick="goPage(<%=i%>)"
					style="font-size: 15pt; color:black; font-weight: bold;">
					[<%=i+1 %>]
				</a>
				<%
			}
		}
	%>
	
	<br>
	<div>
		<select id="choice" name = "search" >
			<option value = "title" >제목</option>
			<option value = "content">내용</option>
			<option value = "writer">작성자</option>
		</select>
		
		<input type="text" id="search" name="search" value=<%=search%>>
		
		<button type="button" onclick="searchBtn()">검색</button>
	</div>
	<br><br>
	<a href="bbs?param=bbswrite">글 쓰기</a>
</div>

<script type="text/javascript">

	// java -> javascript
	let search = "<%=search%>"; // 문자열인 경우
	if(search != ""){
		let obj = document.getElementById("choice"); // html id중 choice -> obj는 choice라는 id를 가진 태그 == select태그
		obj.value = "<%=choice%>"; // 여기서 scriptlet 안의 초이스는 자바 안에서의 변수 choice 자바,자바스크립트의 변수는 별개임 공유?하지 않음
		obj.setAttribute("selected","selected");
		 <%-- html에서 select태그에 value넣으면 undefined 라고 말하는데 obj.value = "<%=choice%>";
		   이렇게 하면 밑에 있는 옵션의 밸류를 가져오는 느낌~? - 찾아보기 --%> 
	}
	
	function searchBtn() {
		let choice = document.getElementById("choice").value;
		// let choice = $("choice").val(); 제이쿼리
		let search = document.getElementById("search").value;
		/* 
		if(choice.trim() == ""){
			alert("카테고리를 선택해 주세요.");
			return;
		}
		
		if(search.trim() == ""){
			alert("검색어를 입력해 주세요.");
			return;
		}
		 */
		location.href = "bbs?param=bbslist&choice="+choice+"&search="+search;
	}
	
	function goPage(pageNum){
		let choice = $("#choice").val();
		console.log(choice);
		let search = $("#search").val();
		console.log(search);
		location.href = "bbs?param=bbslist&choice="+choice+"&search="+search + "&pageNumber="+pageNum;
	}
</script>

</body>
</html>