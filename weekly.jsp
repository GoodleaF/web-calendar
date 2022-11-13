<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주간별 스케쥴 관리</title>
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
	document.getElementById('clock').innerHTML = h+":"+m+":"+s;
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
		<li><a href="plan.jsp">일정 추가</a></li>
	</ul>
</nav>
<nav background-color:red>
<%
java.util.Calendar cal=java.util.Calendar.getInstance();
int thisyear=cal.get(java.util.Calendar.YEAR);							//현재 몇년도인지를 가져온다
int thismonth=cal.get(java.util.Calendar.MONTH)+1;						//현재 몇월인지 가져온다 0~11까지로 표현되므로 1을 더한다.
int thisday=cal.get(java.util.Calendar.DATE);							//현재 며칠인지 가져온다.
int dayOfTheWeek=cal.get(java.util.Calendar.DAY_OF_WEEK);				//현재 요일값을 가져온다 일요일은1 토요일은 7이다.
String selyear=request.getParameter("year");
String selmonth=request.getParameter("month");
int year, month;
if(selyear==null&&selmonth==null){
	year=thisyear;
	month=thismonth;
}
else{
	year=Integer.parseInt(selyear);
	month=Integer.parseInt(selmonth);
	if(month<0){
		month=11;
		year=year-1;
	}
	if(month>11){
		month=0;
		year=year+1;
	}
}

%>
</nav>
<center>
<table> 
	<tr>
		<td align=left width=190>
		<a href="weekly.jsp?year=<%out.print(year-1);%>&month=<%out.print(month);%>">＜</a>
		<%out.print(year); %>년
		<a href="weekly.jsp?year=<%out.print(year+1);%>&month=<%out.print(month);%>">＞</a>
		</td>
		<td align=center width=420>
		<a href="weekly.jsp?year=<%out.print(year);%>&month=<%out.print(month-1);%>">＜</a>
		<%out.print(month+1); %>월 <%out.print(thisday); %>일 - <%out.print(month+1); %>월 <%out.print(thisday+7); %>일
		<a href="weekly.jsp?year=<%out.print(year);%>&month=<%out.print(month+1);%>">＞</a>
		</td>
		<td align=right width=240>
		<%out.print("현재 "+thisyear+"년 "+thismonth+"월 "+thisday+"일 <div id='clock' style='display:inline'></div>"); %>	<!--현재 시간을 출력하는 부분-->
		</td>
</table>     

<table border="0" cellspacing="1" cellpadding="1">
<tr bgcolor=gray>
	<td width=110 align="center">구분</td>
	<td width=110 align="center">일</td>
	<td width=110 align="center">월 </td>
	<td width=110 align="center">화 </td>
	<td width=110 align="center">수 </td>
	<td width=110 align="center">목 </td>
	<td width=110 align="center">금 </td>
	<td width=110 align="center">토 </td>
<tr>
<%													//구분 쪽 시간을 30분간격으로 입력하기 위한 부분
String half;										//**:00인지 **:30인지를 판단하여 입력하기 위한 문자열
for(int i = 0; i < 48; i++){
	out.print("<tr bgcolor='#c9c9c9'>");
	for(int j = 0; j < 8; j++){
		if(i % 2 == 1)
			half = "30";
		else
			half = "00";
		
		if(j == 0){							//구분 쪽 테이블에는 시간을 출력한다.
			if(i/2 < 10)
				out.print("<td width=110 align='center'>0"+i/2+":"+half+"</td>");
			else
				out.print("<td width=110 align='center'>"+i/2+":"+half+"</td>");
		}									//아니면 아무것도 출력하지 않는다 이 부분에 할일이 입력되면 됨.
		else{
			out.print("<td></td>");
		}
	}
}
%>
</table>
</center>
</body>
</html>