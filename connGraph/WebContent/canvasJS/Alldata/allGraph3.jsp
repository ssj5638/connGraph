<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="connGraph.DBConn" %>
<%
Connection conn = DBConn.getMySqlConnection();

PreparedStatement pstmtOld = null;
ResultSet rsOld = null;
String sqlOld = "select substr(happenDt, 1, 4) as Years, count(case when kindCd like '[��]%' then 1 end) as Dogs," + 
				"count(case when kindCd like '[�����]%' then 1 end) as Cats, " + 
				"count(case when kindCd like '[��Ÿ����]%' then 1 end) as The_Others, " + 
				"count(case when processState like '%�Ծ�%' then 1 end) as Adop " + 
				"from animal_old group by substr(happenDt, 1, 4);";
			
pstmtOld = conn.prepareStatement(sqlOld); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 

rsOld = pstmtOld.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 

PreparedStatement pstmtRe = null;
ResultSet rsRe = null;
String sqlRe = "select substr(happenDt, 1, 4) as Years, count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others, count(case when processState like '%�Ծ�%' then 1 end) as Adop from animal_re group by substr(happenDt, 1, 4);";
			
pstmtRe = conn.prepareStatement(sqlRe); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 

rsRe = pstmtRe.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 

Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
List<Map<Object,Object>> list2 = new ArrayList<Map<Object,Object>>();
List<Map<Object,Object>> list3 = new ArrayList<Map<Object,Object>>();
List<Map<Object,Object>> list4 = new ArrayList<Map<Object,Object>>();

while(rsOld.next()){
map = new HashMap<Object, Object>();
map.put("label", rsOld.getInt("Years"));
map.put("y", rsOld.getInt("Dogs"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", rsOld.getInt("Years"));
map.put("y", rsOld.getInt("Cats"));
list2.add(map);

map = new HashMap<Object, Object>();
map.put("label", rsOld.getInt("Years"));
map.put("y", rsOld.getInt("The_Others"));
list3.add(map);

map = new HashMap<Object, Object>();
map.put("label", rsOld.getInt("Years"));
map.put("y", rsOld.getInt("Adop"));
list4.add(map);
}

while(rsRe.next()){
map = new HashMap<Object, Object>();
map.put("label", rsRe.getInt("Years"));
map.put("y", rsRe.getInt("Dogs"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", rsRe.getInt("Years"));
map.put("y", rsRe.getInt("Cats"));
list2.add(map);

map = new HashMap<Object, Object>();
map.put("label", rsRe.getInt("Years"));
map.put("y", rsRe.getInt("The_Others"));
list3.add(map);

map = new HashMap<Object, Object>();
map.put("label", rsRe.getInt("Years"));
map.put("y", rsRe.getInt("Adop"));
list4.add(map);
}

String dataPoints1 = gsonObj.toJson(list1);
String dataPoints2 = gsonObj.toJson(list2);
String dataPoints3 = gsonObj.toJson(list3);
String dataPoints4 = gsonObj.toJson(list4);

/* System.out.println(dataPoints1);
System.out.println(dataPoints2);
System.out.println(dataPoints3);
System.out.println(dataPoints4); */
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
		text: "������ ���⵿�� ���� �� �Ծ��Ȳ"
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
		yValueFormatString: "0.##",
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