<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="connGraph.DBConn" %>

<%
Connection conn = DBConn.getMySqlConnection();

PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "select * from animal_2015;";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

String xVal, yVal;

Gson gsonObj = new Gson();
Map<Object, Object> map = null;
List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
String dataPoints = null;

while(rs.next()){
	xVal = rs.getString("age(after)");
	yVal = rs.getString("age_u");
	
	map = new HashMap<Object,Object>(); 
	map.put("label", xVal); 
	map.put("y", Double.parseDouble(xVal)); 
	list.add(map);
	dataPoints = gsonObj.toJson(list);
}
conn.close();
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
<% if(dataPoints != null) { %>
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "JSP Column Chart from Database"
	},
	data: [{
		type: "column", //change type to bar, line, area, pie, etc
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
<% } %> 
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>           