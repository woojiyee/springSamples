<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<style type="text/css">
.center{
	margin: auto;
	width: 30%;
	border: 3px solid #00ff00 ;
	border-radius: 30px;
	padding: 10px;
}
</style>

</head>
<body>

<h2 align="center"> Log In</h2>
<div class="center" class="input-group mb-3" >
	<form action = "loginAf.do" method="post"  > <!-- controller java 파일에서 파람으로 logAf를 감지하니까 여기 url도 logAf.jsp가 아니라 logAf가 파람인 상태로 이동시켜야함 -->
		<table align="center">
			<tr >
				<th width="100">ID</th>
				<td>
					<input type="text" id="id" name="id" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="100">PW</th>
				<td>
					<input type="password" id="pwd" name="pwd" class="form-control">
				</td>
			</tr>
			<tr >
				<td colspan='2'>
					<input type="checkbox" id="chk_save_id">id 저장 <br>
					<div align="center">
					<input type="submit" value="login" class="btn btn-primary">
					<a href="regi.do" >회원가입</a> <!-- MVC model1에선 뷰(login.jsp)에서 뷰href=regi.jsp로 -->
					</div>
			</tr>
		</table>
	
	</form>
</div>


<script type="text/javascript">
	let user_id = $.cookie("user_id");
	if(user_id != null){
		$("#id").val( user_id );
		$("#chk_save_id").prop("checked", true);
	}
	
	$("#chk_save_id").click(function(){
		
		if( $("#chk_save_id").is(":checked") == true ){	
			
			if( $("#id").val().trim() == "" ){	
				alert('id를 입력해 주십시오');
				$("#chk_save_id").prop("checked", false);
			}else{	
				// cookie 저장
				$.cookie("user_id", $("#id").val().trim(), { expires:7, path:'./' });
			}		
			
		}else{	// cookie에 저장하지 않음(삭제)
			
			$.removeCookie("user_id", { path:'./' });
		}
		
	});
</script>
</body>
</html>