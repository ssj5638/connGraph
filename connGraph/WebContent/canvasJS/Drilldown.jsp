<%-- 기본 Drilldown 그래프 (선택하기전) --%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="connGraph.DBConn" %>
<%
Connection conn = DBConn.getMySqlConnection();

String sqlG1 = "select age_u,COUNT(*) as count from animal_re where kind='0' and happenDt like '2015%' and processState_Pre='A' GROUP BY age_u ORDER BY age_u asc;";
PreparedStatement pstmtG1 = conn.prepareStatement(sqlG1); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
ResultSet rsG1 = pstmtG1.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다. 

String sqlG2 = "select size,COUNT(*) as count from animal_re where kind='0' and happenDt like '2015%' and processState_Pre='A' GROUP BY size ORDER BY size asc;";
PreparedStatement pstmtG2 = conn.prepareStatement(sqlG2); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
ResultSet rsG2 = pstmtG2.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다. 

String sqlG3 = "select sexCd,COUNT(*) as count from animal_re where kind='0' and happenDt like '2015%' and processState_Pre='A' GROUP BY sexCd ORDER BY sexCd asc;";
PreparedStatement pstmtG3 = conn.prepareStatement(sqlG3); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
ResultSet rsG3 = pstmtG3.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다. 

String sqlG4 = "select neuterYn,COUNT(*) as count from animal_re where kind='0' and happenDt like '2015%' and processState_Pre='A' GROUP BY neuterYn ORDER BY neuterYn asc;";
PreparedStatement pstmtG4 = conn.prepareStatement(sqlG4); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
ResultSet rsG4 = pstmtG4.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다. 

String sqlG5 = "select orgNm_Pre,COUNT(*) as count from animal_re where kind='0' and happenDt like '2015%' and processState_Pre='A' GROUP BY orgNm_Pre ORDER BY orgNm_Pre asc;";
PreparedStatement pstmtG5 = conn.prepareStatement(sqlG5); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
ResultSet rsG5 = pstmtG5.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다. 

String sqlG6 = "select happenMth,COUNT(*) as count from animal_re where kind='0' and happenDt like '2015%' and processState_Pre='A' GROUP BY happenMth ORDER BY happenMth asc;";
PreparedStatement pstmtG6 = conn.prepareStatement(sqlG6); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
ResultSet rsG6 = pstmtG6.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다. 

Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
while(rsG1.next()){
	map = new HashMap<Object, Object>();
	map.put("label", rsG1.getString("age_u"));
	map.put("y", rsG1.getInt("count"));
	list.add(map);
}
String dataG1 = gsonObj.toJson(list);

list = new ArrayList<Map<Object,Object>>();
while(rsG2.next()){
	map = new HashMap<Object, Object>();
	map.put("label", rsG2.getString("size"));
	map.put("y", rsG2.getInt("count"));
	list.add(map);
}
String dataG2 = gsonObj.toJson(list);

list = new ArrayList<Map<Object,Object>>();
while(rsG3.next()){
	map = new HashMap<Object, Object>();
	map.put("label", rsG3.getString("sexCd"));
	map.put("y", rsG3.getInt("count"));
	list.add(map);
}
String dataG3 = gsonObj.toJson(list);

list = new ArrayList<Map<Object,Object>>();
while(rsG4.next()){
	map = new HashMap<Object, Object>();
	map.put("label", rsG4.getString("neuterYn"));
	map.put("y", rsG4.getInt("count"));
	list.add(map);
}
String dataG4 = gsonObj.toJson(list);

list = new ArrayList<Map<Object,Object>>();
while(rsG5.next()){
	map = new HashMap<Object, Object>();
	map.put("label", rsG5.getString("orgNm_Pre"));
	map.put("y", rsG5.getInt("count"));
	list.add(map);
}
String dataG5 = gsonObj.toJson(list);

list = new ArrayList<Map<Object,Object>>();
while(rsG6.next()){
	map = new HashMap<Object, Object>();
	map.put("label", rsG6.getString("happenMth"));
	map.put("y", rsG6.getInt("count"));
	list.add(map);
}
String dataG6 = gsonObj.toJson(list);
%> 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	.wrap {
		width:100%;
		height:100%;
		position:absolute;
		margin: 0;
		padding: 0;
	}
	.graphPart1{
		width:100%;
		height:33%;
		border:1px solid black;
		position:relative;
	}
		
	.graphPart2{
		width:100%;
		height:33%;
		border:1px solid black;
		position:relative;
	}
		
	.graphPart3{
		width:100%;
		height:33%;
		border:1px solid black;
		position:relative;
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
 
var chart1 = new CanvasJS.Chart("age", {
		animationEnabled: true,
		theme: "light2",
		title: {
			text: "성장기"
			},
		data: [{
			type: "column",
			yValueFormatString: "#,##0",
			indexLabel: "{label}: {y}",
			toolTipContent: "{y}",
			dataPoints : <%out.print(dataG1);%>
		}]
	});
	chart1.render();
	
var chart2 = new CanvasJS.Chart("size", {
		animationEnabled: true,
		theme: "light2",
		title: {
			text: "크기"
			},
		data: [{
			type: "column",
			yValueFormatString: "#,##0",
			indexLabel: "{label}: {y}",
			toolTipContent: "{y}",
			dataPoints : <%out.print(dataG2);%>
		}]
	});
	chart2.render();
	
	var chart3 = new CanvasJS.Chart("sexCd", {
		animationEnabled: true,
		theme: "light2",
		title: {
			text: "성별"
			},
		data: [{
			type: "column",
			yValueFormatString: "#,##0",
			indexLabel: "{label}: {y}",
			toolTipContent: "{y}",
			dataPoints : <%out.print(dataG3);%>
		}]
	});
	chart3.render();
	
	var chart4 = new CanvasJS.Chart("neuterYn", {
		animationEnabled: true,
		theme: "light2",
		title: {
			text: "중성화 상태"
			},
		data: [{
			type: "column",
			yValueFormatString: "#,##0",
			indexLabel: "{label}: {y}",
			toolTipContent: "{y}",
			dataPoints : <%out.print(dataG4);%>
		}]
	});
	chart4.render();
	
	var chart5 = new CanvasJS.Chart("happenDt", {
		animationEnabled: true,
		theme: "light2",
		title: {
			text: "유기동물 발견시기"
			},
		data: [{
			type: "column",
			yValueFormatString: "#,##0",
			indexLabel: "{label}: {y}",
			toolTipContent: "{y}",
			dataPoints : <%out.print(dataG5);%>
		}]
	});
	chart5.render();
	
	var chart6 = new CanvasJS.Chart("orgNm", {
		animationEnabled: true,
		theme: "light2",
		title: {
			text: "보호지역"
			},
		data: [{
			type: "column",
			yValueFormatString: "#,##0",
			indexLabel: "{label}: {y}",
			toolTipContent: "{y}",
			dataPoints : <%out.print(dataG6);%>
		}]
	});
	chart6.render();
 
}
</script>
</head>
<body>
<div class="wrap">
<div class="graphPart1">
	<div id="age" style="height: 100%; width: 50%; float:left;"></div>
	<div id="size" style="height: 100%; width: 50%; float:left;"></div>
</div>
<div class="graphPart2">
	<div id="sexCd" style="height: 100%; width: 50%; float:left;"></div>
	<div id="neuterYn" style="height: 100%; width: 50%; float:left;"></div>
</div>
<div class="graphPart3">
	<div id="happenDt" style="height: 100%; width: 50%; float:left;"></div>
	<div id="orgNm" style="height: 100%; width: 50%; float:left;"></div>
</div>
</div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>