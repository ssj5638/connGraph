<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="connGraph.DBConn" %>
<%
Connection conn = DBConn.getMySqlConnection();

PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "SELECT orgNm_Pre,COUNT(*) as count FROM animal_2015 where kind='0' and processState_Pre='D' GROUP BY orgNm_Pre ORDER BY count DESC;";

pstmt = conn.prepareStatement(sql);

rs = pstmt.executeQuery();

Gson gsonObj = new Gson();
Map<Object, Object> map = null;
List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

while(rs.next()){
	map = new HashMap<Object, Object>();
	map.put("label", rs.getString("orgNm_Pre"));
	map.put("y", rs.getInt("count"));
	list.add(map);
}
String dataPoints = gsonObj.toJson(list);
System.out.println(dataPoints);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			text: "Dogs * 안락사/자연사"
		}],
		data: [{
			type: "column",
			yValueFormatString: "#,##0",
			toolTipContent: "{label} : {y}",
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