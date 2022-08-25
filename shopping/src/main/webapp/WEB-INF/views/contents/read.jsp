<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
  <title>homepage</title>
  <meta charset="utf-8">
    <link rel="stylesheet" href="/css/style.css">
  <script>
	function list(){
  		let url = '/contents/list';
  		location.href = url;
  	}
  	function update(){ //수정페이지 이동
  		let url = '/contents/update/${contentsno}';
  		location.href = url;
  	}
  	
  </script>
</head>
<body> 
<div class="container">
<h1>조회</h1>
<div class="panel panel-default">
	<div class="panel-heading">상품이미지</div>
	 <img class="img-rounded" src="/contents/storage/${dto.filename}" style="margin-left: auto; margin-right: auto; display: block;">
 	<div class="form-group">
	    <div class="col-sm-6">
      	</div>
	<div class="panel-heading">상품명</div>
	<div class="panel-body">${dto.pname}</div>
	
	<div class="panel-heading">가격</div>
	<div class="panel-body">${dto.price}</div>
		<div class="panel-heading">재고</div>
	<div class="panel-body">${dto.stock}</div>
	
	
	  <div class="form-group">
    <label class="control-label col-sm-2" for="detail">상세정보</label>
    <div class="col-sm-8">
    <br>
    <textarea rows="3" cols="3" id="detail" name="detail" class="form-control">${dto.detail}</textarea>
    </div>
  	</div>
  
	<div class="panel-heading"></div>
	<div class="panel-body"></div>

  </div>
         <a href="javascript:cart()">
         <img class='btn' src="/svg/cart4.svg"/></a>
         <a href="javascript:order()">
         <img class='btn' src="/svg/bag-heart-fill.svg"/></a>
         <a href="javascript:history.back()">
         <img class='btn' src="/svg/arrow-return-left.svg"/></a>
<div>
	<button onclick="update()">수정</button>
	<button onclick="list()">목록</button>
	<button onclick="">댓글</button>
</div>
</div>

</div>
 
</body> 
</html> 