<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차트 그래프</title>
</head>
<style>
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

#title {width: 1000px; margin: 0 auto; text-align: center; margin-top: 80px;}
#title img {width: 100px; height: 100px; }
#title h1 {text-shadow: 2px 2px 2px #ff93a2; width: 1000px; text-align: center;}


#all {
	width: 1000px;
	margin: 0 auto;
	margin-bottom: 100px;
}

#chart {
	margin: 0 auto;
	margin-top: 100px;
}

#btn {
	padding: 10px 20px;
  font-size: 18px;
  background-color: #ffe3ee;
  color: black;
  border: none;
  cursor: pointer;
  border-radius: 10px;
  font-family: "GowunBatang-Regular";
  font-weight: bold;
  margin-right: 10px;
  display:inline-block;
  width: 150px;
  height: 50px;
}

#btns {
  text-align: center;
  margin-top: 50px;
}
#btn:hover {
	background-color: #ff93ae;
	color: white;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
</script>

<body>
<%@ include file="html/header2.jspf" %>
<link rel="stylesheet" href="css/header2.css">
<div id="all">
<div id="title">
	<img src="resources/img/alluser.png">
	<h1>총 매출</h1>
</div>
<div id="btns">
	<a href="getSexCnt.do" id="btn">회원수보기</a>
	<a href="getManTotPay.do" id="btn">전체매출보기</a>
	<a href="admin.jsp" id="btn">메인으로</a>
</div>

	<div style="width: 900px; height: 900px;" id="chart">
		<!--차트가 그려질 부분-->
		<canvas id="myChart"></canvas>
	</div>
	</div>
<%@ include file="html/footer.jspf" %>
<link rel="stylesheet" href="css/footer.css">
<script type="text/javascript">
   var context = document
   .getElementById('myChart')
   .getContext('2d');

var xAxisLabels = ['남성 총 매출', '여성 총 매출'];

var myChart = new Chart(context, {
   type: 'bar',
   data: {
      labels: xAxisLabels,
      datasets: [
         {
            label: '전체 회원',
            fill: false,
            data: ["${totList.get(0)}", "${totList.get(1)}"],
            backgroundColor: [
         	   'rgba(54, 162, 235, 0.2)',
         	   'rgba(255, 99, 132, 0.2)'
         	   ],
            borderColor: [
         	   'rgba(54, 162, 235, 1)',
         	   'rgba(255, 99, 132, 1)'
         	   ],
            borderWidth: 3
         }
      ]
   },
   options: {
      scales: {
         yAxes: [
            {
               ticks: {
                  beginAtZero: true
               }
            }
         ]
      }
   }
});



</script>
</body>
</html>