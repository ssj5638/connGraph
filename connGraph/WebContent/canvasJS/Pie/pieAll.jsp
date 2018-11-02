<%-- ������ �ϳ��� 15-17�� �׸��� --%>

<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="connGraph.DBConn" %>
<%	
	request.setCharacterEncoding("euc-kr");
	String reYear = request.getParameter("year");
	String reKind = request.getParameter("kind");
	
	System.out.println(reYear);
	System.out.println(reKind);
	

	Connection conn = DBConn.getMySqlConnection();

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select count(case when processState_Pre='C' then 1 end) as C, " + 
					"count(case when processState_Pre='A' then 1 end) as A, " + 
					"count(case when processState_Pre='D' then 1 end) as D, " + 
					"count(case when processState_Pre='R' then 1 end) as R,	" + 
					"count(case when processState_Pre='E' then 1 end) as E " +
					"from animal_? where kind=?;";
					
	pstmt = conn.prepareStatement(sql); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
	
	pstmt.setInt(1, 2015);
	pstmt.setString(2, "'0'");
	rs = pstmt.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 

	Gson gsonObj = new Gson();
	Map<Object,Object> map = null;
	List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
	while(rs.next()){
		map = new HashMap<Object, Object>();
		map.put("label", "�Ծ�/����");
		map.put("y", rs.getInt("A"));
		list.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "�ȶ���/�ڿ���");
		map.put("y", rs.getInt("D"));
		list.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "��ȯ");
		map.put("y", rs.getInt("R"));
		list.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "��Ÿ");
		map.put("y", rs.getInt("A")+rs.getInt("E"));
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
		text: "2015�� ���⵿�� ��ȣ����"
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