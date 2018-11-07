<%-- 기본 Pie 그래프 (selectBox에서 값을 받기 전에 나타나도록 함) --%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="connGraph.DBConn" %>
<%
	Connection conn = DBConn.getMySqlConnection();

	PreparedStatement pstmtPie = null;
	ResultSet rsPie = null;

	String sqlPie = "select count(case when processState_Pre='C' then 1 end) as C, " + 
					"count(case when processState_Pre='A' then 1 end) as A, " + 
					"count(case when processState_Pre='D' then 1 end) as D, " + 
					"count(case when processState_Pre='R' then 1 end) as R,	" + 
					"count(case when processState_Pre='E' then 1 end) as E " +
					"from animal_re where kind='0' and happenDt like '2017%';";
					
	pstmtPie = conn.prepareStatement(sqlPie); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
	
	rsPie = pstmtPie.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다. 

	Gson gsonObj = new Gson();
	Map<Object,Object> map = null;
	List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
	while(rsPie.next()){
		map = new HashMap<Object, Object>();
		map.put("label", "입양/기증");
		map.put("y", rsPie.getInt("A"));
		list.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "안락사/자연사");
		map.put("y", rsPie.getInt("D"));
		list.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "반환");
		map.put("y", rsPie.getInt("R"));
		list.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "기타");
		map.put("y", rsPie.getInt("C")+rsPie.getInt("E"));
		list.add(map);
	}
	String dataPoints = gsonObj.toJson(list);
	//System.out.println(dataPoints);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	.graphZone1{
		float: left;
		width:30%;
		height:100%;
	}
		
	.graphZone2{
		float: right;
		width:70%;
		height:100%;
	}
	
	.iframe{
		width:99%;
		height:99%;
		position:relative;
		margin:0% 0.5% 0% 0.5%;
		background-color:white;
		border-radius: 10px;
		border: 1;
	}
</style>
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	title: {
		text: "2017년 유기동물 보호상태"
	},
	subtitles: [{
		text: "Dogs"
	}],
	data: [{
		type: "doughnut",
		yValueFormatString: "#,##0",
		indexLabel: "{label}: {y}",
		toolTipContent: "{y}",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
chart.render();
 
}
</script>
</head>
<body>
<div class="graphZone1">
	<div id="chartContainer" style="height: 100%; width: 100%;"></div>
</div>
<div class="graphZone2">
	<div class="iframe" src="bubble.jsp"></div>
</div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>