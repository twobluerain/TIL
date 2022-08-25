<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <style type="text/css">
   #red{
   	color : red;
   }
  </style>
</head>
<body> 
<div class="container">
<c:choose>
	<c:when test="${flag}">
	<div class='well well-lg'>
	답변이 있는 글이므로 삭제할 수 없습니다.
	<button class='btn' onclick='history.back()'>다시 시도</button>
	</c:when>
<c:otherwise>
<h1 class="col-sm-offset-2 col-sm-10">삭제</h1>
<form class="form-horizontal" 
      action="/bbs/delete"
      method="post"
      >
 
  <input type="hidden" name="bbsno" value="${bbsno}">
  <input type="hidden" name="oldfile" value="${oldfile}">
  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="passwd" id="passwd" class="form-control">
    </div>
  </div>
  
  <p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다.</p>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">삭제</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</form>
</c:otherwise>
</c:choose>
</div>
</body> 
</html> 