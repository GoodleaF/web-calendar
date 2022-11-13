<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>  </title>
<link rel="stylesheet" type="text/css" href="navigation.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
function current_time(){
	var day = new Date();
	var h = day.getHours();
	var m = day.getMinutes();
	var s = day.getSeconds();
	m = setting(m);
	s = setting(s);
	document.getElementById('test').innerHTML = h+":"+m+":"+s;
	var t = setTimeout(function(){current_time()},1000);
}

function setting(i){
	if(i<10) {i = "0" + i};
	return i;
}
</script>
</head>
<body onload="current_time()">
<nav>
	<ul>
		<li><a href="monthly.jsp">월별 관리</a></li>
		<li><a href="weekly.jsp">주별 관리</a></li>
		<li><a href="daily.jsp">일별 관리</a></li>
	</ul>
</nav>
<div id="test"></div>
</body>
</html>