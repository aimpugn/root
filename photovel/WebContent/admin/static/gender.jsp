<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@page import="com.photovel.vo.AdminUser" %>
<%
// 남여 화원 가입 현황 
List<AdminUser> genderList = (List)request.getAttribute("genderList"); 
int FCount = 0;
int MCount = 0;

for(AdminUser temp : genderList){
	if( temp.getUser_gender().equals("F") ){
		FCount = temp.getUser_gender_count();
	}else{
		MCount = temp.getUser_gender_count();
	}
}
%>
<div class="col-xs-6 col-sm-3">
						<canvas id="genderCount" class="piechart chart-responsive" style="width: 200px; height: 200px;"></canvas>
						<%-- 남여 가입현황 --%>
							<script>
							 var genderList = '<%= genderList %>';
							//console.log(genderList);
							
							var ctx = document.getElementById("genderCount").getContext('2d');
							var contentCount = new Chart(ctx, {
							  type: 'pie',
							  data: {
							    labels: ["여", "남"],
							    datasets: [{
							      backgroundColor: [
							       // "#2ecc71",
							       // "#3498db",
							       //"#95a5a6",
							       //"#9b59b6",
							        "#f1c40f",
							        "#e74c3c",
							       // "#34495e"
							      ],
							      data: [<%= FCount%>, <%= MCount %>]
							    }]
							  }
							});	
							</script>
							
						<h4>성별 가입현황</h4>
					</div>