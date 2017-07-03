<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.photovel.vo.AdminContent" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% 
List<AdminContent> monthsList = (List)request.getAttribute("for2monthsList");
System.out.println(monthsList);
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);    //현재 년 구하기
int month = cal.get(Calendar.MONTH) + 1;  //현재 달 구하기
int prevMonth = cal.get(Calendar.MONTH);  //현재 달 구하기
int day = cal.get(Calendar.DATE);  //현재 일 구하기
int thisMonthCount = 0;
int prevMonthCount = 0;
DateFormat str_date = new SimpleDateFormat("MM");
for(AdminContent temp : monthsList){
	if( month == Integer.parseInt(temp.getContent_written_month()) ){
		thisMonthCount = temp.getContent_count();
	} else if ( prevMonth == Integer.parseInt(temp.getContent_written_month()) ) {
		prevMonthCount = temp.getContent_count();
	}
} 
%>
					<div class="col-xs-6 col-sm-3">
						<canvas id="contentCount" class="piechart chart-responsive" style="width: 200px; height: 200px;"></canvas>
						<%-- 콘텐츠 등록 현황 --%>
						<script>
							var ctx = document.getElementById("contentCount").getContext('2d');
							var contentCount = new Chart(ctx, {
							  type: 'pie',
							  data: {
							    labels: ["전월", "당월"],
							    datasets: [{
							      backgroundColor: [
							        "#2ecc71",
							        "#3498db",
							        //"#95a5a6",
							       // "#9b59b6",
							       // "#f1c40f",
							       // "#e74c3c",
							       // "#34495e"
							      ],
							      data: [<%= prevMonthCount %>, <%= thisMonthCount%>]
							    }]
							  }
							});	
						</script>
						<h4>콘텐츠 등록현황</h4>
					</div>