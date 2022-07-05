<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>

 
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
   <script type="text/javascript">
     function read(orderno){
       var url = "read";
       url += "?orderno="+orderno; 
       url += "&col=${col}";
       url += "&word=${word}";
       url += "&nowPage=${nowPage}";
       location.href=url;
 
     }
     
     function producer(orderno,value){
    	 return fetch("/order/update",{
    		 method:'post',
    		 body: JSON.stringify({orderno:orderno,ostate:value}),
             headers: {'Content-Type': "application/json; charset=utf-8"}   		 
    	 })
         .then(response => response.text())
         .catch(console.log); 
     }
     function update(orderno, i){
    	 let l = document.getElementById("choice-"+i).selectedIndex;    	
    	 let value = document.getElementById("choice-"+i).options[l].value;
    	 producer(orderno, value)
    	 .then(text => alert(text))
    	 .catch(console.log)
       }
  
  </script>
 
</head>
<body>
<div class="container">
 
  <h2>주문 목록</h2>
  <form class="form-inline" action="./list">
    <div class="form-group">
      <select class="form-control" name="col">
        <option value="mname"
        <c:if test= "${col=='mname'}"> selected </c:if>
        >주문자</option>
        <option value="pname"
        <c:if test= "${col=='pname'}"> selected </c:if>
        >상품명</option>
        <option value="id"
        <c:if test= "${col=='id'}"> selected </c:if>
        >아이디</option>
        <option value="total"
        <c:if test= "${col=='total'}"> selected </c:if>
        >전체출력</option>       
     </select>
    </div>
    <div class="form-group">
      <input type="text" class="form-control" placeholder="Enter 검색어" 
      name="word" value="${word}">
    </div>
    <button type="submit" class="btn btn-default" >검색</button>
<!--     <button type="button" class="btn btn-default" onclick="location.href='../admin/create'">등록</button> -->
  </form>
  
  <table class="table table-striped">
   <thead>
    <tr>
    <th>번호</th>
    <th>주문자</th>
    <th>상품명</th>
    <th>총합계</th>
    <th>주문날짜</th>
    <th>요청메세지</th>
    <th>주문상태</th>
    <th>수정/삭제/</th>
    </tr>
   </thead>
   <tbody>
 
<c:choose>   
<c:when test="${empty list}" >
   <tr><td colspan="7">주문된 상품이 없습니다.</td>
</c:when>
<c:otherwise>
  
   <c:forEach var="dto" items="${list}" varStatus="v">  
   <tr>
    <td>${dto.orderno}</td>
    <td>${dto.mname}(${dto.id})</td>
    <td> 
    <c:forEach var="odto" items="${dto.list}">
    <a href="javascript:read('${odto.odno}')">${odto.pname}(size:${odto.size}/수량:${odto.quantity })</a>
    <c:if test="${util:newImg(dto.odate) }">
         <img src="/images/new.gif"> 
    </c:if> 
    <br>
    </c:forEach>
    </td>
    <td>${dto.total}</td>
    <td>${dto.odate}</td>
    <td>${dto.reqtext}</td>
    <td>
 	<select id="choice-${v.index}" name="ostate">
	    <option value="배송 준비중" <c:if test= "${dto.ostate=='배송 준비중'}"> selected </c:if>>배송 준비중
	    <option value="배송 중" <c:if test= "${dto.ostate=='배송 중'}"> selected </c:if>>배송 중
	    <option value="배송 완료" <c:if test= "${dto.ostate=='배송 완료'}"> selected </c:if>>배송 완료
	</select>
    </td>
    <td> <a href="javascript:update('${dto.orderno }','${v.index}')">
          <span class="glyphicon glyphicon-edit"></span>
        </a>
        /
        <a href="#">
          <span class="glyphicon glyphicon-trash"></span>
        </a>     
    </td>
   </tr>
   </c:forEach>
   </c:otherwise>
   </c:choose>
 
   </tbody>
  
  </table>
  <div>
      ${paging}
  </div>
</div>
</body> 
</html> 
