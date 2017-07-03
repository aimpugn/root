<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.photovel.vo.AdminContent" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatDate var="content_written_date" value="${countList.content_written_date}" pattern="yyyy.MM.dd"/>
<fmt:formatDate var="content_written_month" value="${countList.content_written_date}" pattern="yyyy.MM"/>
<c:set var="genderList" value="${requestScope.genderList}"/>
<%--  head
------------------------------------------- --%>
<%@include file="/admin/include/head.jsp"%>
<%int[] arr = new int[11]; 
List<AdminContent> contentList = (List)request.getAttribute("countAllList"); 
Date dt =  null;

// Chart.js : 국가별 콘텐츠 수
int KoCount = 0;
int ChCount = 0;
int UsCount = 0;
int AuCount = 0;
for(AdminContent temp : contentList){
	if( temp.getUser().getUser_phone1() ==  82 ){ //한국
		KoCount = temp.getContent_count();
	}else if( temp.getUser().getUser_phone1() == 86 ){ //중국
		ChCount = temp.getContent_count();
	}else if( temp.getUser().getUser_phone1()  == 1  ){//미귝/캐나다
		UsCount = temp.getContent_count();
	}else if( temp.getUser().getUser_phone1()  == 61 ){//호주
		AuCount = temp.getContent_count();
	}
}

// Chart.js : 어제오늘 콘텐츠 등록 수
int yesterDayCount = 0;
int todayCount = 0; 


%>

<%--  head
------------------------------------------- --%>
<%@include file="/admin/include/head.jsp"%>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>

<script>
$(function(){
	$('.dropdown-menu.stat-date').on('click', 'li a', function(){
	    $('.statBtn:first-child').html($(this).html() + '<span class="caret"></span>');
	    $('.statBtn:first-child').val($(this).text() );
	});
	
	//당월 구하기, 마지막 날 구하기
	//var today = new Date();
	//var month = today.getMonth() + 1;
	//var year = today.getFullYear();
	//var lastDay = ( new Date( year, month, 0) ).getDate(); // 당월의 마지막 날 구하기 
});
</script>


</head>
<body>
<%--  header ------------------------------------------- --%>
<%@include file="/admin/include/header.jsp"%>

	<div class="container-fluid">
		<div class="row">

			<%--  navSidebar
			------------------------------------------- --%>
			<%@include file="/admin/include/navSidebar.jsp"%>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
				<%--  navSidebar
				------------------------------------------- --%>
				<%@include file="/admin/include/breadcrumb.jsp"%>

				<%--   대시보드 차트 --%>
				<div class="row placeholders">
					<%@include file="/admin/static/profit.jsp"%>
					<%@include file="/admin/static/for2months.jsp"%>
					<div class="col-xs-6 col-sm-3">
						<canvas id="chartNation" class="piechart chart-responsive" style="width: 200px; height: 200px;"></canvas>
						<%-- 사용현황 : 국가별 --%>
						<script>
							var ctx = $("#chartNation");
							var chartNation = new Chart(ctx, {
							    type: 'bar', //bar/doughnut
							    data: {
							        labels: ["대한민국", "중국", "미국", "호주"],
							        datasets: [{
							            label: '이달 콘텐츠 수',
							            data: [<%= KoCount%>, <%= ChCount%>, <%= UsCount%>, <%= AuCount%>],
							            backgroundColor: [
							                'rgba(255, 99, 132, 0.2)',
							                'rgba(54, 162, 235, 0.2)',
							                'rgba(255, 206, 86, 0.2)',
							                'rgba(75, 192, 192, 0.2)',
							                //'rgba(153, 102, 255, 0.2)',
							               // 'rgba(255, 159, 64, 0.2)'
							            ],
							            borderColor: [
							                'rgba(255,99,132,1)',
							                'rgba(54, 162, 235, 1)',
							                'rgba(255, 206, 86, 1)',
							                'rgba(75, 192, 192, 1)',
							                //'rgba(153, 102, 255, 1)',
							                //'rgba(255, 159, 64, 1)'
							            ],
							            borderWidth: 1
							        }]
							    },
							    options: {
							        scales: {
							            yAxes: [{
							                ticks: {
							                    beginAtZero:true
							                }
							            }]
							        }
							    }
							});
							</script>
						<h4>국가별 사용현황</h4>
					</div>
					<%@include file="/admin/static/gender.jsp"%>
					
				</div>
				<%-- 콘텐츠 등록 현황 --%>
				<div class="sub-header" style="position: relative; font-size: 2.5rem; font-weight: bold;">
					콘텐츠 등록 현황
					<%-- <small>${content_written_month}</small> --%>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered table-hover text-right">
						<thead>
							<tr>
								<th class="text-center">일자</th>
								<th class="text-center">대한민국</th>
								<th class="text-center">중국</th>
								<th class="text-center">일본</th>
								<th class="text-center">인도네시아</th>
								<th class="text-center">말레이시아</th>
								<th class="text-center">필리핀</th>
								<th class="text-center">미국/캐나다</th>
								<th class="text-center">호주</th>
								<th class="text-center">영국</th>
								<th class="text-center">프랑스</th>
								<th class="text-center">독일</th>
							</tr>
						</thead>
						
						<tbody>
<%
SimpleDateFormat sdf = new SimpleDateFormat("dd");

for(int index=0; index<contentList.size(); index++){
	
	AdminContent content = contentList.get(index); 
	if(index==0){
		out.print("<tr>");
	}else if(!content.getContent_written_date().equals(dt)){
		
		out.print("<td>"); 
		out.print(sdf.format(dt)); 
		out.print("</td>");

		for(int i=0; i<arr.length; i++){
			out.print("<td>"); 
			if(arr[i]!=0){
				out.print(arr[i]);
			}
			out.print("</td>");
		}
		out.print("</tr><tr>");
		arr = new int[11];
	}
	switch(content.getUser().getUser_phone1()){
	case 82: //한국
		arr[0]= content.getContent_count();
		break;
	case 86://중국
		arr[1]= content.getContent_count();
		break;
	case 81://일본
		arr[2]= content.getContent_count();
		break;
	case 62:// 인도네시아
		arr[3]= content.getContent_count();
		break;
	case 60: //말레이시아
		arr[4]= content.getContent_count();
		break;
	case 63://필리핀
		arr[5]= content.getContent_count();
		break;
	case 1: //미국, 캐나다
		arr[6]= content.getContent_count();
		break;
	case 61: //호주
		arr[7]= content.getContent_count();
		break;
	case 44: //영국
		arr[8]= content.getContent_count();
		break;	
	case 33: //프랑스
		arr[9]= content.getContent_count();
		break;
	case 49: // 독일
		arr[10]= content.getContent_count();
		break;
	}
	
	System.out.println();
	dt = content.getContent_written_date();
}%>
<%out.print("<td>"); 
out.print(sdf.format(dt)); 
out.print("</td>");
for(int i=0; i<arr.length; i++){
	out.print("<td>"); 
	if(arr[i]!=0){
		out.print(arr[i]);
	}else{
		out.print("&nbsp;&nbsp;");
	}
	out.print("</td>");
}
out.print("</tr>");
%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

<%--  footer
------------------------------------------- --%>
<%@include file="/admin/include/footer.jsp" %>

</body>
</html>