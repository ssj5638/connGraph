<%-- 그래프 버튼화 TEST용 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
int totalVisitors = 883000;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("y", 22059); map.put("name", "A"); list.add(map);
map = new HashMap<Object,Object>(); map.put("y", 11571); map.put("name", "R"); list.add(map);
map = new HashMap<Object,Object>(); map.put("y", 23382); map.put("name", "D"); list.add(map);
 
String newVsReturningVisitorsDataPoints = gsonObj.toJson(list);
 
list = new ArrayList<Map<Object,Object>>();
map = new HashMap<Object,Object>(); map.put("label", "F"); map.put("y", 9843); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "M"); map.put("y", 12091); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Q"); map.put("y", 125); list.add(map);
 
String aDataPoints = gsonObj.toJson(list);
 
list = new ArrayList<Map<Object,Object>>();
map = new HashMap<Object,Object>(); map.put("label", "F"); map.put("y", 4994); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "M"); map.put("y", 6531); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Q"); map.put("y", 46); list.add(map);
 
String rDataPoints  = gsonObj.toJson(list);

list = new ArrayList<Map<Object,Object>>();
map = new HashMap<Object,Object>(); map.put("label", "F"); map.put("y", 10554); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "M"); map.put("y", 12581); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Q"); map.put("y", 247); list.add(map);
 
String dDataPoints  = gsonObj.toJson(list);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function () {
 
var totalVisitors = <%out.print(totalVisitors);%>;
var visitorsData = {
	"New vs Returning Visitors": [{
		click: visitorsChartDrilldownHandler,
		cursor: "pointer",
		explodeOnClick: false,
		innerRadius: "60%",
		legendMarkerType: "square",
		name: "New vs Returning Visitors",
		radius: "100%",
		showInLegend: true,
		startAngle: 90,
		type: "doughnut",
		dataPoints: <%out.print(newVsReturningVisitorsDataPoints);%>
	}],
	"A": [{
		type: "column",
		xValueType: "dateTime",
		dataPoints: <%out.print(aDataPoints);%>
	}],
	"R": [{
		type: "column",
		xValueType: "dateTime",
		dataPoints: <%out.print(rDataPoints);%>
	}],
	"D": [{
		type: "column",
		xValueType: "dateTime",
		dataPoints: <%out.print(dDataPoints);%>
	}]
};
 
var newVSReturningVisitorsOptions = {
	animationEnabled: true,
	theme: "light2",
	title: {
		text: "보호 상태"
	},
	legend: {
		fontFamily: "calibri",
		fontSize: 14,
		itemTextFormatter: function (e) {
			return e.dataPoint.name + ": " + Math.round(e.dataPoint.y / totalVisitors * 100) + "%";  
		}
	},
	data: []
};
 
var visitorsDrilldownedChartOptions = {
	animationEnabled: true,
	theme: "light2",
	data: []
};
 
var chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
chart.options.data = visitorsData["New vs Returning Visitors"];
chart.render();
 
function visitorsChartDrilldownHandler(e) {
	chart = new CanvasJS.Chart("sub_graph", visitorsDrilldownedChartOptions);
	chart.options.data = visitorsData[e.dataPoint.name];
	chart.options.title = { text: e.dataPoint.name }
	chart.render();
	$("#backButton").toggleClass("invisible");
}
 
$("#backButton").click(function() { 
	$(this).toggleClass("invisible");
	chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
	chart.options.data = visitorsData["New vs Returning Visitors"];
	chart.render();
} );
 
}
</script>
<style>
/*   #backButton {
	border-radius: 4px;
	padding: 8px;
	border: none;
	font-size: 16px;
	background-color: #2eacd1;
	color: white;
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
  }
  .invisible {
    display: none;
  } */
</style>
</head>
<body>
<div>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<div id="sub_graph" style="height: 370px; width: 100%;"></div>
</div>
<button class="btn invisible" id="backButton">&lt; Back</button>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>     