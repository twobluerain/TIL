<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>비밀번호 찾기</title>
  <meta charset="utf-8">
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body>
<script type="text/javascript">
$(function(){
   $("#passwdfind").click(function(){
      let id = $('#id').val();
      let mname = $('#mname').val();

      let url = "http://localhost:8000/member/findPw?id=" + id + "&mname=" + mname;
      console.log(url);
      
        fetch(url)
      .then(response => response.json())
      .then((data) => alert(data.passwd)); 
   });
});
</script>

<div class="container">

<h1 class="col-sm-offset-2 col-sm-10">패스워드 찾기</h1>
  <form class="form-horizontal" 
        action="/member/findPw"
        method="post">


    
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">아이디</label>
      <div class="col-sm-4">
        <input type="text" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round" id="id" 
        placeholder="아이디를 입력하세요" name="required="required" 
       >
      </div>
      
          <div class="form-group">
      <label class="control-label col-sm-2" for="mname">이름</label>
      <div class="col-sm-4">
        <input type="text" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round" id="mname" 
        placeholder="이름을 입력하세요" name="required="required" 
       >
      </div>
     
    

    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="button" class="btn btn-default" id = "passwdfind">패스워드 찾기</button>
      </div>
    </div>
  </form>

</div>
</body>
</html>