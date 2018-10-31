<%-- 데이터를 불러오는데 오래걸리는 문제로 데이터 직접 입력 --%>

<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%
// SQL에서 불러온 데이터를 LIST 형식으로 변환
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
// 연도별 유기된 고양이수에 대한 리스트
// 연도별 유기된 기타 동물수에 대한 리스트
// 연도별 유기된 입양수에 대한 리스트

map = new HashMap<Object,Object>(); map.put("label", "2009"); map.put("y", 17913); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2010"); map.put("y", 42142); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2011"); map.put("y", 38185); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2012"); map.put("y", 46351); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2013"); map.put("y", 57499); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2014"); map.put("y", 57882); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2015"); map.put("y", 58220); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2016"); map.put("y", 62541); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2017"); map.put("y", 73023); list.add(map);
String dataPoints1 = gsonObj.toJson(list);	// 연도별 유기된 개수에 대한 리스트

list = new ArrayList<Map<Object,Object>>();
map = new HashMap<Object,Object>(); map.put("label", "2009"); map.put("y", 6897); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2010"); map.put("y", 19882); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2011"); map.put("y", 21522); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2012"); map.put("y", 29634); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2013"); map.put("y", 23322); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2014"); map.put("y", 20345); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2015"); map.put("y", 20602); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2016"); map.put("y", 24539); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2017"); map.put("y", 26543); list.add(map);
String dataPoints2 = gsonObj.toJson(list);	// 연도별 유기된 개수에 대한 리스트

list = new ArrayList<Map<Object,Object>>();
map = new HashMap<Object,Object>(); map.put("label", "2009"); map.put("y", 133); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2010"); map.put("y", 824); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2011"); map.put("y", 896); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2012"); map.put("y", 975); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2013"); map.put("y", 1006); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2014"); map.put("y", 1023); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2015"); map.put("y", 923); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2016"); map.put("y", 1095); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2017"); map.put("y", 1157); list.add(map);
String dataPoints3 = gsonObj.toJson(list);	// 연도별 유기된 개수에 대한 리스트

list = new ArrayList<Map<Object,Object>>();
map = new HashMap<Object,Object>(); map.put("label", "2009"); map.put("y", 6573); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2010"); map.put("y", 16187); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2011"); map.put("y", 15543); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2012"); map.put("y", 20707); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2013"); map.put("y", 25183); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2014"); map.put("y", 26446); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2015"); map.put("y", 27764); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2016"); map.put("y", 28823); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2017"); map.put("y", 31120); list.add(map);
String dataPoints4 = gsonObj.toJson(list);	// 연도별 유기된 개수에 대한 리스트
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