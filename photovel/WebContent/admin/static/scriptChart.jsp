<%@ page contentType="text/html; charset=UTF-8"%>
						<%-- 수익 현황 --%>
						<script>
							var ctx = document.getElementById('profit').getContext('2d');
							var profit = new Chart(ctx, {
							  type: 'line',
							  data: {
							    labels: ['12월', '1월', '2월', '3월', '4월', '5월', '6월'],
							    datasets: [{
							      label: '광고',
							      data: [12, 19, 3, 17, 6, 3, 7],
							      backgroundColor: "rgba(153,255,51,0.4)"
							    }, {
							      label: '인앱',
							      data: [2, 29, 5, 5, 2, 3, 10],
							      backgroundColor: "rgba(255,153,0,0.4)"
							    }]
							  }
							});
						</script>
						<%-- 콘텐츠 등록 현황 --%>
						<script>
							var ctx = document.getElementById("contentCount").getContext('2d');
							var contentCount = new Chart(ctx, {
							  type: 'pie',
							  data: {
							    labels: ["어제", "오늘"],
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
							      data: [12, 19]
							    }]
							  }
							});	
						</script>
						
							