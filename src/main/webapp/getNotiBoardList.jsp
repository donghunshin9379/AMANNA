<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관련</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/header2.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<style>
/* admin.css */
@font-face {
  font-family: "GowunBatang-Regular";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}	
body {
  font-family: "GowunBatang-Regular";
}

#notitable {
  width: 1000px;
  /* border-collapse: collapse; */
  margin: 0 auto;
  text-align: center;
  font-weight: bold;
  border: 10px solid #ffe3ee;
  
  
}




 th {background-color: #ffe3ee; color: #FFAAAF;}
 
 
#tot {
 font-size: 18px;
 text-align: left;
 width: 1000px;
 margin: 0 auto;
  margin-top: 50px;
}

.pagination {
  margin-top: 20px;
  margin-bottom: 50px;
  width: 1000px;
  margin: o auto;
}

.pagination a {
  display: inline-block; 
  width: 30px;
  height: 30px;
  text-decoration: none;
  color: #333;
  background-color: #ffe3ee;
  /* border: 1px solid #ddd; */
  text-align: center;
  margin-left: 10px;
  
}

.pagination a:hover {
  background-color: #ff93a2;
}

.admin-button {
  float: right;
  
}

.admin-button button {
  padding: 10px 20px;
  font-size: 16px;
  background-color: #ffe3ee;
  color: black;
  border: none;
  cursor: pointer;
  font-family: "GowunBatang-Regular";
  font-weight: 500;
  border: 1px solid #ffe3ee;
  border-radius: 10px 10px 10px 10px;
}

.admin-button button:hover {
  background-color: #ff93a2;
  color: #fff;
  font-weight: bold;
}
   
   
#ta_a {color:black;}

#tr:nth-child(even){
	background-color: #ffe3ee;
}

#tr {height: 50px;}

#tr > td {border-bottom: 3px solid #ffe3ee;}

#title {width: 1000px; margin: 0 auto; text-align: center; margin-top: 80px;}
#title img {width: 100px; height: 100px; }
#title h1 {text-shadow: 2px 2px 2px #ff93a2; width: 1000px; text-align: center;}

#all {
	width: 1000px;
	height: 1000px;
	margin: 0 auto;
}


</style>
</head>
<script type="text/javascript">
$(function () {
    $(".mainnav1 >li").mouseover(function () {
      $(this).children(".site_nav").stop().slideDown(300);

      $(".mainnav1 > li").mouseleave(function () {
        $(this).children(".site_nav").stop().slideUp(300);
      });
    }); //메뉴
    
  }); //전체
</script>
<%@ include file="html/header2.jspf" %>
<body>
<div id="all">
<div id="title">
	<img src="resources/img/notice.png">
	<h1>공지사항</h1>
</div>
<table id="notitable">
<thead>
    <tr>
        <th>No</th>
        <th>제목</th>
        <th>작성일</th>
    </tr>
</thead>
<tbody>
<h4 id="tot">전체 공지글 수: ${total.total }개 </h4>
    <c:forEach var="nlist" items="${nlist }">
        <tr id="tr">
            <td>${nlist.notino }</td>    
            <td><a href="getNotiBoard.do?notino=${nlist.notino }" id="ta_a">${nlist.title }</a></td>    
            <td><fmt:formatDate value="${nlist.notiDate}" pattern="yyyy-MM-dd" /></td>
        </tr>
    </c:forEach>
</tbody>
</table>
<div style="text-align: center;">
    <div class="pagination" style="display: inline-block;">
        <c:forEach var="i" begin="1" end="${totalPage}">
            <a href="getNotiBoardList.do?viewPage=${i}">${i}</a>
        </c:forEach>
    <div class="admin-button" style="display: inline-block;">
        <button onclick="location.href='insertNotiBoard.jsp'">공지 작성하기</button>
    </div>
    </div>
    
</div>
</div>
<footer>
	<%@ include file="html/footer.jspf" %>
</footer>

</body>
</html>
