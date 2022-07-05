<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>로그인 처리</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  	$(function(){
  		$("#btn").click(function(){
  			if($("#mname").val()==''){
  				alert("이름을 입력하세요");
  				$("#mname").focus();
  				return;
  				
  			}else if($("#email").val()==""){
  				alert("이메일을 입력하세요");
  				$("#email").focus();
  				return;
  			}
  			
  			//비동기 통신 요청 idfind() 호출
  			idfind($("#mname").val(),$("#email").val())
  				.then(text => $("#msg").text(text))
  				.catch(console.log);
	
  		});
  	});
  	
  	//비동기 통신을 처리하는 함수 선언
   function idfind(mname,email){
	  return fetch(`/member/idfindex?mname=\${mname}&email=\${email}`) 
	  			.then(response => response.text())
	  			.catch(console.log);
   }
  </script>
</head>
<body>
<div class="container">

<h1 class="col-sm-offset-2 col-sm-10">아이디 찾기</h1>
  <form class="form-horizontal">          
    <div class="form-group">
      <label class="control-label col-sm-2" for="mname">이름</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="mname" 
        placeholder="Enter mname" name="mname" required="required">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">이메일</label>
      <div class="col-sm-4">          
        <input type="email" class="form-control" id="email" 
        placeholder="Enter email" name="email" required="required">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="button" class="btn btn-default" id="btn">찾기</button>
        <button type="button" class="btn btn-default"
         onclick="location.href='agree'">회원가입</button>
         <button type="button" onclick="location.href='/member/pwfind'" class="btn btn-default">패스워드 찾기</button>
      </div>
    </div>
    <div class="form-group">        
     <div class="col-sm-offset-2 col-sm-8"> 
     <span id="msg"></span>
     </div>
     </div>
  </form>

</div>
</body>
</html>