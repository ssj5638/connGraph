<%-- select ���� �޾� Pie �׷��� �׸��� --%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="connGraph.DBConn" %>
<%	



Connection conn = DBConn.getMySqlConnection();

// Parameter
PreparedStatement rePstmt = null;
ResultSet reRs = null;

request.setCharacterEncoding("euc-kr");

String reYear = request.getParameter("year");
String reKind = request.getParameter("kind");

String strKind = null;

if (reKind.equals("1")){	// �ι�° �Ķ���ͷ� �������� �Է��� �� �ֵ��� ���� ��
	strKind = "Cats";
}else{
	strKind = "Dogs";
}
System.out.println(strKind);

System.out.println(reYear);		// ù��° �Ķ���� Ȯ��
System.out.println(reKind);		// �ι�° �Ķ���� Ȯ��


String reSql = "select count(case when processState_Pre='C' then 1 end) as C, " + 
				"count(case when processState_Pre='A' then 1 end) as A, " + 
				"count(case when processState_Pre='D' then 1 end) as D, " + 
				"count(case when processState_Pre='R' then 1 end) as R,	" + 
				"count(case when processState_Pre='E' then 1 end) as E " +
				"from animal_re where happenDt like ? and kind=?;";

				
rePstmt = conn.prepareStatement(reSql); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
rePstmt.setString(1, reYear+'%');
rePstmt.setString(2, reKind);

System.out.println(rePstmt);		// ������ Ȯ��

reRs = rePstmt.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 

Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

while(reRs.next()){
	map = new HashMap<Object, Object>();
	map.put("label", "�Ծ�/����");
	map.put("y", reRs.getInt("A"));
	list.add(map);
	map = new HashMap<Object, Object>();
	map.put("label", "�ȶ���/�ڿ���");
	map.put("y", reRs.getInt("D"));
	list.add(map);
	map = new HashMap<Object, Object>();
	map.put("label", "��ȯ");
	map.put("y", reRs.getInt("R"));
	list.add(map);
	map = new HashMap<Object, Object>();
	map.put("label", "��Ÿ");
	map.put("y", reRs.getInt("A")+reRs.getInt("E"));
	list.add(map);
}
String dataPoints1 = gsonObj.toJson(list);
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
	text: <%out.print(reYear);%> + "�� ���⵿�� ��ȣ����"
},
subtitles: [{
	text: <%-- <%out.print(strKind);%> --%>
}],
data: [{
	type: "doughnut",
	yValueFormatString: "#,##0",
	indexLabel: "{label}: {y}",
	toolTipContent: "{y}",
	dataPoints : <%out.print(dataPoints1);%>
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