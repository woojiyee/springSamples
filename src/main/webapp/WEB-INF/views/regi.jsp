<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>
<body>

<h2>회원가입</h2>

<div >

<form action="regiAf.do" method="post">
<!-- 위에 한 줄과 같은 기능, 한줄을 나눠서 작성 가능
<form action="member" method="post">
<input type="hidden" name="param" value="regiAf">
 -->
<table border="1">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" id="id" size="20">
		<input type="button" id="id_chk_btn" value="id확인"><br> <!-- 아이디 중복확인 한다고 페이지 이동이 되면 안 됨 -> 비동기(ajax) -->
		<p id="idcheck" style="font-size: 8px"></p>		
	</td>
</tr>
<tr>
	<th>패스워드</th>
	<td>
		<input type="text" name="pwd" id="pwd" size="20">
	</td>
</tr>
<tr>
	<th>이름</th>
	<td>
		<input type="text" name="name" size="20">
	</td>
</tr>
<tr>
	<th>이메일</th>
	<td>
		<input type="text" name="email" size="20">
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="회원가입">
	</td>
</tr>
</table>

</form>
</div>


<script type="text/javascript">
$(document).ready(function(){
	
	$("#id_chk_btn").click(function(){ // id 중복확인이 클릭되면
		
		// id의 규칙: 대소문자 + 특수문자 포함
		
		// id 글자의 갯수(+빈칸 검사는 여기서 해야함)
		
		// id가 사용할 수있는지 없는지 -ajax
		$.ajax({
			url:"idcheck.do",
			type:"post",
			data:{ "id":$("#id").val() },
			success:function( answer ){
				alert("success");
				alert(answer.str);
				
				if(answer == "YES"){
					$("#idcheck").css("color", "#0000ff");
					$("#idcheck").text("사용할 수 있는 아이디입니다");
				}else{
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").text("사용중인 아이디입니다");
					$("#id").val("");
				}
				 
			},
			error:function(){
				alert('regi 통신 error');
			}
		});
	});
	
});
</script>


</body>
</html>