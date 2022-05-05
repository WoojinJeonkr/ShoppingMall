<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script type="text/javascript" src="resources/js/d3.layout.cloud.js"></script>
<head>
<title>통계</title>
<!-- 통계 페이지에서는 chart.js와 d3.js를 사용하여 온라인 쇼핑몰에 관해 word cloud와 radar chart를 보여줍니다 -->
<link rel = "stylesheet" type = "text/css" href = "resources/css/statistics.css">
</head>
<body>
<h1 style="margin:150px; margin-top: 150px;">통계</h1>
<div id="top"><jsp:include page="top.jsp"></jsp:include></div>
<div id="chart" class="chart">
	<script>
		var frequency_list = [{"text":"리브드 사이클링 쇼츠","size":20},{"text":"리브드 탑","size":43},{"text":"쇼트 트윌 스커트","size":20},{"text": "오버사이즈 데님 재킷","size":32},{"text":"오버사이즈 리넨 블렌드 재킷","size":20},{"text":"와이드 하이웨이스트 진","size":20},{"text":"집업 스웨트셔츠","size":20},{"text":"카고 팬츠","size":70},{"text":"컷아웃 재킷 드레스","size":46},{"text":"코튼 크롭트 셔츠","size":20},{"text":"크롭트 가디건","size":21}];
		var color = d3.scale.linear()
	            .domain([0,1,2,3,4,5,6,10,15,20,100])
	            .range(["#ddd", "#ccc", "#bbb", "#aaa", "#999", "#888", "#777", "#666", "#555", "#444", "#333", "#222"]);
	
	    d3.layout.cloud().size([800, 300])
	            .words(frequency_list)
	            .rotate(0)
	            .fontSize(function(d) { return d.size; })
	            .on("end", draw)
	            .start();
	
	    function draw(words) {
	        d3.select("body").append("svg")
	                .attr("width", 850)
	                .attr("height", 500)
	                .attr("class", "wordcloud")
	                .append("g")
	                .attr("transform", "translate(320,200)")
	                .selectAll("text")
	                .data(words)
	                .enter().append("text")
	                .style("font-size", function(d) { return d.size + "px"; })
	                .style("fill", function(d, i) { return color(i); })
	                .attr("transform", function(d) {
	                    return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
	                })
	                .text(function(d) { return d.text; });
	    }
	</script>
<div class="chart" style="float: right; width: 60%; margin:0 auto;">
	<canvas id="radar-chart" width="400" height="400"></canvas>
</div>
	<script>
	new Chart(document.getElementById("radar-chart"), {
	    type: 'radar',
	    data: {
	      labels: ["주변인", "패션매장", "인터넷", "스트리트 패션", "TV 방송"],
	      datasets: [
	        {
	          label: "고소득",
	          fill: true,
	          backgroundColor: "rgba(179,181,198,0.2)",
	          borderColor: "rgba(179,181,198,1)",
	          pointBorderColor: "#fff",
	          pointBackgroundColor: "rgba(179,181,198,1)",
	          data: [35.8,39.4,35.6,22.3,16.0]
	        }, {
	          label: "중소득",
	          fill: true,
	          backgroundColor: "rgba(255,99,132,0.2)",
	          borderColor: "rgba(255,99,132,1)",
	          pointBorderColor: "#fff",
	          pointBackgroundColor: "rgba(255,99,132,1)",
	          pointBorderColor: "#fff",
	          data: [40.2,33.8,35.1,27.5,22.0]
	        }, {
	            label: "저소득",
	            fill: true,
	            backgroundColor: "rgba(255,192,0,0.2)",
	            borderColor: "rgba(255,192,0,1)",
	            pointBorderColor: "#fff",
	            pointBackgroundColor: "rgba(255,192,0,1)",
	            pointBorderColor: "#fff",
	            data: [52.0,33.1,20.2,34.2,32.1]
	          }
	      ]
	    },
	    options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
	      title: {
	        display: true,
	        text: '소득 계층별 2021년 상반기 패션 정보원'
	      }
	    }
	});
	</script>
</div>
</body>
</html>