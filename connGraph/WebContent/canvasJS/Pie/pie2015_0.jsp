<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
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
					"from animal_2015 where kind='0';";
					
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
		map.put("y", rsPie.getInt("A")+rsPie.getInt("E"));
		list.add(map);
	}
	String dataPoints = gsonObj.toJson(list);
	System.out.println(dataPoints);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	title: {
		text: "2015년 유기동물 보호상태"
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
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>