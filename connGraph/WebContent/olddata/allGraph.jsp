<%-- 문제점 : 데이터 불러오기 오래걸림 --%>

<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="connGraph.DBConn" %>
<%
Connection conn = DBConn.getMySqlConnection();
PreparedStatement pstmt = null;

ResultSet rs09 = null;		// 09년도 종류
ResultSet rs10 = null;		// 10년도 종류
ResultSet rs11 = null;		// 11년도 종류
ResultSet rs12 = null;		// 12년도 종류
ResultSet rs13 = null;		// 13년도 종류
ResultSet rs14 = null;		// 14년도 종류
ResultSet rs15 = null;		// 15년도 종류
ResultSet rs16 = null;		// 16년도 종류
ResultSet rs17 = null;		// 17년도 종류
ResultSet rs09_2 = null;		// 09년도 입양
ResultSet rs10_2 = null;		// 10년도 입양
ResultSet rs11_2 = null;		// 11년도 입양
ResultSet rs12_2 = null;		// 12년도 입양
ResultSet rs13_2 = null;		// 13년도 입양
ResultSet rs14_2 = null;		// 14년도 입양
ResultSet rs15_2 = null;		// 15년도 입양
ResultSet rs16_2 = null;		// 16년도 입양
ResultSet rs17_2 = null;		// 17년도 입양

//09년도 종류, 입양 쿼리문
String sql09 = "select count(case when kindCd like \"[개]%\" then 1 end) as Dogs, "
		+ "count(case when kindCd like \"[고양이]%\" then 1 end) as Cats, "
		+ "count(case when kindCd like \"[기타축종]%\" then 1 end) as The_Others from animal_old where happenDt like \"2009%\";";
PreparedStatement pstmt09 = conn.prepareStatement(sql09); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
rs09 = pstmt09.executeQuery();

String sql09_2 = "select count(*) as adoption from animal_old where processState=\"종료(입양)\" and happenDt like \"2009%\";";
PreparedStatement pstmt09_2 = conn.prepareStatement(sql09_2); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
rs09_2 = pstmt09_2.executeQuery();

// 10년도 종류, 입양 쿼리문
String sql10 = "select count(case when kindCd like \"[개]%\" then 1 end) as Dogs, "
		+ "count(case when kindCd like \"[고양이]%\" then 1 end) as Cats, "
		+ "count(case when kindCd like \"[기타축종]%\" then 1 end) as The_Others from animal_old where happenDt like \"2010%\";";
PreparedStatement pstmt10 = conn.prepareStatement(sql10); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
rs10 = pstmt10.executeQuery();

String sql10_2 = "select count(*) as adoption from animal_old where processState=\"종료(입양)\" and happenDt like \"2010%\";";
PreparedStatement pstmt10_2 = conn.prepareStatement(sql10_2); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
rs10_2 = pstmt10_2.executeQuery();

// 11년도 종류, 입양 쿼리문
String sql11 = "select count(case when kindCd like \"[개]%\" then 1 end) as Dogs, "
		+ "count(case when kindCd like \"[고양이]%\" then 1 end) as Cats, "
		+ "count(case when kindCd like \"[기타축종]%\" then 1 end) as The_Others from animal_old where happenDt like \"2011%\";";
PreparedStatement pstmt11 = conn.prepareStatement(sql11); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
rs11 = pstmt11.executeQuery();

String sql11_2 = "select count(*) as adoption from animal_old where processState=\"종료(입양)\" and happenDt like \"2011%\";";
PreparedStatement pstmt11_2 = conn.prepareStatement(sql11_2); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
rs11_2 = pstmt11_2.executeQuery();	

// 12년도 종류, 입양 쿼리문
String sql12 = "select count(case when kindCd like \"[개]%\" then 1 end) as Dogs, "
		+ "count(case when kindCd like \"[고양이]%\" then 1 end) as Cats, "
		+ "count(case when kindCd like \"[기타축종]%\" then 1 end) as The_Others from animal_old where happenDt like \"2012%\";";
PreparedStatement pstmt12 = conn.prepareStatement(sql12); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
rs12 = pstmt12.executeQuery();

String sql12_2 = "select count(*) as adoption from animal_old where processState=\"종료(입양)\" and happenDt like \"2012%\";";
PreparedStatement pstmt12_2 = conn.prepareStatement(sql12_2); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
rs12_2 = pstmt12_2.executeQuery();	

// 13년도 종류, 입양 쿼리문
String sql13 = "select count(case when kindCd like \"[개]%\" then 1 end) as Dogs, "
		+ "count(case when kindCd like \"[고양이]%\" then 1 end) as Cats, "
		+ "count(case when kindCd like \"[기타축종]%\" then 1 end) as The_Others from animal_old where happenDt like \"2013%\";";
PreparedStatement pstmt13 = conn.prepareStatement(sql13); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
rs13 = pstmt13.executeQuery();

String sql13_2 = "select count(*) as adoption from animal_old where processState=\"종료(입양)\" and happenDt like \"2013%\";";
PreparedStatement pstmt13_2 = conn.prepareStatement(sql13_2); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
rs13_2 = pstmt13_2.executeQuery();

// 14년도 종류, 입양 쿼리문
String sql14 = "select count(case when kindCd like \"[개]%\" then 1 end) as Dogs, "
		+ "count(case when kindCd like \"[고양이]%\" then 1 end) as Cats, "
		+ "count(case when kindCd like \"[기타축종]%\" then 1 end) as The_Others from animal_old where happenDt like \"2014%\";";
PreparedStatement pstmt14 = conn.prepareStatement(sql14); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
rs14 = pstmt14.executeQuery();

String sql14_2 = "select count(*) as adoption from animal_old where processState=\"종료(입양)\" and happenDt like \"2014%\";";
PreparedStatement pstmt14_2 = conn.prepareStatement(sql14_2); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
rs14_2 = pstmt14_2.executeQuery();	

// 15년도 종류, 입양 쿼리문
String sql15 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2015;";
PreparedStatement pstmt15 = conn.prepareStatement(sql15);
rs15 = pstmt15.executeQuery();

String sql15_2 = "select count(*) as adoption from animal_2015 where processState=\"종료(입양)\";";
PreparedStatement pstmt15_2 = conn.prepareStatement(sql15_2);
rs15_2 = pstmt15_2.executeQuery();

// 16년도 종류, 입양 쿼리문
String sql16 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2016;";
PreparedStatement pstmt16 = conn.prepareStatement(sql16);
rs16 = pstmt16.executeQuery();

String sql16_2 = "select count(*) as adoption from animal_2016 where processState=\"종료(입양)\";";
PreparedStatement pstmt16_2 = conn.prepareStatement(sql16_2);
rs16_2 = pstmt16_2.executeQuery();

// 17년도 종류, 입양 쿼리문
String sql17 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2017;";
PreparedStatement pstmt17 = conn.prepareStatement(sql17);
rs17 = pstmt17.executeQuery();

String sql17_2 = "select count(*) as adoption from animal_2017 where processState=\"종료(입양)\";";
PreparedStatement pstmt17_2 = conn.prepareStatement(sql17_2);
rs17_2 = pstmt17_2.executeQuery();

// SQL에서 불러온 데이터를 LIST 형식으로 변환
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
List<Map<Object,Object>> list2 = new ArrayList<Map<Object,Object>>();
List<Map<Object,Object>> list3 = new ArrayList<Map<Object,Object>>();
List<Map<Object,Object>> list4 = new ArrayList<Map<Object,Object>>();

while(rs09.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2009"); map.put("y", rs09.getInt("Dogs")); list1.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2009"); map.put("y", rs09.getInt("Cats")); list2.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2009"); map.put("y", rs09.getInt("The_Others")); list3.add(map);
}while(rs09_2.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2009"); map.put("y", rs09_2.getInt("adoption")); list4.add(map);
}
while(rs10.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2010"); map.put("y", rs10.getInt("Dogs")); list1.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2010"); map.put("y", rs10.getInt("Cats")); list2.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2010"); map.put("y", rs10.getInt("The_Others")); list3.add(map);
}while(rs10_2.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2010"); map.put("y", rs10_2.getInt("adoption")); list4.add(map);
}
while(rs11.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2011"); map.put("y", rs11.getInt("Dogs")); list1.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2011"); map.put("y", rs11.getInt("Cats")); list2.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2011"); map.put("y", rs11.getInt("The_Others")); list3.add(map);
}while(rs11_2.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2011"); map.put("y", rs11_2.getInt("adoption")); list4.add(map);
}
while(rs12.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2012"); map.put("y", rs12.getInt("Dogs")); list1.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2012"); map.put("y", rs12.getInt("Cats")); list2.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2012"); map.put("y", rs12.getInt("The_Others")); list3.add(map);
}while(rs12_2.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2012"); map.put("y", rs12_2.getInt("adoption")); list4.add(map);
}
while(rs13.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2013"); map.put("y", rs13.getInt("Dogs")); list1.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2013"); map.put("y", rs13.getInt("Cats")); list2.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2013"); map.put("y", rs13.getInt("The_Others")); list3.add(map);
}while(rs13_2.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2013"); map.put("y", rs13_2.getInt("adoption")); list4.add(map);
}
while(rs14.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2014"); map.put("y", rs14.getInt("Dogs")); list1.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2014"); map.put("y", rs14.getInt("Cats")); list2.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2014"); map.put("y", rs14.getInt("The_Others")); list3.add(map);
}while(rs14_2.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2014"); map.put("y", rs14_2.getInt("adoption")); list4.add(map);
}
while(rs15.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2015"); map.put("y", rs15.getInt("Dogs")); list1.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2015"); map.put("y", rs15.getInt("Cats")); list2.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2015"); map.put("y", rs15.getInt("The_Others")); list3.add(map);
}while(rs15_2.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2015"); map.put("y", rs15_2.getInt("adoption")); list4.add(map);
}
while(rs16.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2016"); map.put("y", rs16.getInt("Dogs")); list1.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2016"); map.put("y", rs16.getInt("Cats")); list2.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2016"); map.put("y", rs16.getInt("The_Others")); list3.add(map);
}while(rs16_2.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2016"); map.put("y", rs16_2.getInt("adoption")); list4.add(map);
}
while(rs17.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2017"); map.put("y", rs17.getInt("Dogs")); list1.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2017"); map.put("y", rs17.getInt("Cats")); list2.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "2017"); map.put("y", rs17.getInt("The_Others")); list3.add(map);
}while(rs17_2.next()){
	map = new HashMap<Object,Object>(); map.put("label", "2017"); map.put("y", rs17_2.getInt("adoption")); list4.add(map);
}
String dataPoints1 = gsonObj.toJson(list1);
String dataPoints2 = gsonObj.toJson(list2);
String dataPoints3 = gsonObj.toJson(list3);
String dataPoints4 = gsonObj.toJson(list4);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	title: {
		text: "연도별 유기동물 종류 및 입양상황"
	},
	toolTip: {
		shared: true
	},
	legend: {
		cursor: "pointer",
		itemclick: toggleDataSeries
	},
	data: [{
		type: "column",
		name: "Dogs",
		yValueFormatString: "#0.##",
		showInLegend: true,
		dataPoints: <%out.print(dataPoints1);%>
	}, {
		type: "column",
		name: "Cats",
		yValueFormatString: "#0.##",
		showInLegend: true,
		dataPoints: <%out.print(dataPoints2);%>
	}, {
		type: "column",
		name: "The_Others",
		yValueFormatString: "#0.##",
		showInLegend: true,
		dataPoints: <%out.print(dataPoints3);%>
	}, {
		type: "line",
		name: "Adoption",
		showInLegend: true,
		xValueType: "dateTime",
		yValueFormatString: "$0.##",
		dataPoints: <%out.print(dataPoints4);%>
	}]
});
chart.render();
 
function toggleDataSeries(e) {
	if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	}
	else {
		e.dataSeries.visible = true;
	}
	chart.render();
}
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 100%; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html> 