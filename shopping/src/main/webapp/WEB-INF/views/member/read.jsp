<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <title>회원정보</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  function updateM(){
	  var url = "update";
// 	  url += "?id=${dto.id}";
	  
	  location.href = url;
  }
  
  function updatePw(){
	  var url = "updatePwForm";
	  url += "?id=${dto.id}";
	  
	  location.href = url;
  }
  
  function updateFile(){
	  var url = "updateFile";
	  //url += "?id=${dto.id}";
	  url += "?oldfile=${dto.fname}";
	  location.href = url;
  }
  function deleteM(){
	  var url = "delete";
	  url += "?id=${dto.id}";
	  url += "&oldfile=${dto.fname}";
	  location.href = url;
  }
  </script>
</head>
<body>
<div class="container">

<h2 class="col-sm-offset-2 col-sm-10">${dto.mname}의 회원정보</h2>
 <table class="table table-bordered">
 <tr>
 	<td colspan="2" style="text-align: center">
 		<img src="/member/storage/${dto.fname}" 
 		width="250px" height="250px" class="img-rounded" >
 	</td>
 </tr>
 <tr>
 	<th>아이디</th>
 	<td>${dto.id}</td>
 </tr>
 <tr>
 	<th>성명</th>
 	<td>${dto.mname}</td>
 </tr>
 <tr>
 	<th>전화번호</th>
 	<td>${dto.tel}</td>
 </tr>
 <tr>
 	<th>이메일</th>
 	<td>${dto.email}</td>
 </tr>
 <tr>
 	<th>우편번호</th>
 	<td>${dto.zipcode}</td>
 </tr>
 <tr>
 	<th>주소</th>
 	<td>${dto.address1} ${dto.address2}</td>
 </tr>
 <tr>
 	<th>직업</th>
 	<td>
 	직업코드:${dto.job}(${util:jobname(dto.job)})
     </td>
 </tr>
 <tr> 
 	<th>날짜</th>
 	<td>${dto.mdate}</td>
 </tr>
 
 </table>
 <div style="text-align: center">
 <button class="btn btn-default" onclick="updateM()">정보수정</button>
 <c:if test="${not empty sessionScope.id and sessionScope.grade != 'A'}">
 <button class="btn btn-default" onclick="updateFile()">사진수정</button>
 <button class="btn btn-default" onclick="updatePw()">패스워드변경</button>
 <button class="btn btn-default" 
 onclick="location.href='./download?dir=/member/storage&filename=${dto.fname}'">다운로드</button>  
 </c:if>
 <button class="btn btn-default" onclick="deleteM()">회원탈퇴</button>
 <c:if test="${not empty sessionScope.id and sessionScope.grade == 'A'}">
 <button class="btn btn-default" onclick="location.href='list'">회원목록</button>
 </c:if>
 </div>
 
 <br>
 
</div>
</body>
</html>