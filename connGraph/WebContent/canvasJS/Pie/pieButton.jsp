<%-- �⺻ Pie �׷��� (selectBox���� ���� �ޱ� ���� ��Ÿ������ ��) --%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
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
					"from animal_re where kind='0' and happenDt like '2017%';";
					
	pstmtPie = conn.prepareStatement(sqlPie); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
	
	rsPie = pstmtPie.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 
	
	int total = 0;
	
	Gson gsonObj = new Gson();
	Map<Object,Object> map = null;
	List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
	while(rsPie.next()){
		map = new HashMap<Object, Object>();
		map.put("label", "�Ծ�/����");
		map.put("y", rsPie.getInt("A"));
		map.put("color", "#f29886");
		list.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "�ȶ���/�ڿ���");
		map.put("y", rsPie.getInt("D"));
		map.put("color", "#008080");
		list.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "��ȯ");
		map.put("y", rsPie.getInt("R"));
		map.put("color", "#ac4762");
		//
		list.add(map);
		map = new HashMap<Object, Object>();
		map.put("label", "��Ÿ");
		map.put("y", rsPie.getInt("C")+rsPie.getInt("E"));
		map.put("color", "#3e91b5");
		list.add(map);
		
		total = rsPie.getInt("A")+rsPie.getInt("D")+rsPie.getInt("R")+rsPie.getInt("C")+rsPie.getInt("E");
	}	
	String dataPoints = gsonObj.toJson(list);
	//System.out.println(total);
	//System.out.println(dataPoints);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "������"); map.put("y", 1529); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��⵵"); map.put("y", 6822); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��󳲵�"); map.put("y", 2590); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "���ϵ�"); map.put("y", 1575); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "���ֱ�����"); map.put("y", 695); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "�뱸������"); map.put("y", 744); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����������"); map.put("y", 781); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "�λ걤����"); map.put("y", 801); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����Ư����"); map.put("y", 1632); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����Ư����ġ��"); map.put("y", 88); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��걤����"); map.put("y", 712); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��õ������"); map.put("y", 1250); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "���󳲵�"); map.put("y", 1138); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����ϵ�"); map.put("y", 1170); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����Ư����ġ��"); map.put("y", 736); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��û����"); map.put("y", 1632); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��û�ϵ�"); map.put("y", 1280); list.add(map);
	String a17orgNm = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "������"); map.put("y", 1206); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��⵵"); map.put("y", 6551); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��󳲵�"); map.put("y", 3158); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "���ϵ�"); map.put("y", 1875); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "���ֱ�����"); map.put("y", 557); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "�뱸������"); map.put("y", 1025); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����������"); map.put("y", 1237); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "�λ걤����"); map.put("y", 2271); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����Ư����"); map.put("y", 1914); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����Ư����ġ��"); map.put("y", 99); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��걤����"); map.put("y", 276); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��õ������"); map.put("y", 1628); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "���󳲵�"); map.put("y", 1245); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����ϵ�"); map.put("y", 2010); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����Ư����ġ��"); map.put("y", 3398); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��û����"); map.put("y", 1464); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��û�ϵ�"); map.put("y", 954); list.add(map);
	String d17orgNm = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "������"); map.put("y", 890); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��⵵"); map.put("y", 3552); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��󳲵�"); map.put("y", 855); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "���ϵ�"); map.put("y", 446); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "���ֱ�����"); map.put("y", 485); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "�뱸������"); map.put("y", 575); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����������"); map.put("y", 938); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "�λ걤����"); map.put("y", 847); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����Ư����"); map.put("y", 2010); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����Ư����ġ��"); map.put("y", 27); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��걤����"); map.put("y", 343); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��õ������"); map.put("y", 1040); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "���󳲵�"); map.put("y", 412); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����ϵ�"); map.put("y", 402); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����Ư����ġ��"); map.put("y", 365); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��û����"); map.put("y", 441); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "��û�ϵ�"); map.put("y", 568); list.add(map);
	String r17orgNm = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "1��"); map.put("y", 1835); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "2��"); map.put("y", 1802); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "3��"); map.put("y", 2263); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "4��"); map.put("y", 2145); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "5��"); map.put("y", 2200); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "6��"); map.put("y", 2009); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "7��"); map.put("y", 2505); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "8��"); map.put("y", 2574); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "9��"); map.put("y", 2137); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "10��"); map.put("y", 2081); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "11��"); map.put("y", 1921); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "12��"); map.put("y", 1703); list.add(map);
	String a17happenMth = gsonObj.toJson(list);	
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "1��"); map.put("y", 1743); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "2��"); map.put("y", 1671); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "3��"); map.put("y", 2029); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "4��"); map.put("y", 2080); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "5��"); map.put("y", 2280); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "6��"); map.put("y", 2496); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "7��"); map.put("y", 3283); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "8��"); map.put("y", 3727); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "9��"); map.put("y", 3126); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "10��"); map.put("y", 2978); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "11��"); map.put("y", 2876); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "12��"); map.put("y", 2679); list.add(map);
	String d17happenMth = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "1��"); map.put("y", 874); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "2��"); map.put("y", 816); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "3��"); map.put("y", 1057); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "4��"); map.put("y", 1216); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "5��"); map.put("y", 1440); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "6��"); map.put("y", 1316); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "7��"); map.put("y", 1501); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "8��"); map.put("y", 1531); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "9��"); map.put("y", 1384); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "10��"); map.put("y", 1225); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "11��"); map.put("y", 1012); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "12��"); map.put("y", 824); list.add(map);
	String r17happenMth = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "���߱�"); map.put("y", 12751); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "���߱�"); map.put("y", 12063); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����"); map.put("y", 361); list.add(map);
	String a17age = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "���߱�"); map.put("y", 13985); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "���߱�"); map.put("y", 15258); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����"); map.put("y", 1725); list.add(map);
	String d17age = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "���߱�"); map.put("y", 3278); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "���߱�"); map.put("y", 9686); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����"); map.put("y", 1232); list.add(map);
	String r17age = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "�̻�"); map.put("y", 96); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "�ʼ���"); map.put("y", 9423); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����"); map.put("y", 11043); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����"); map.put("y", 4060); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����"); map.put("y", 553); list.add(map);
	String a17size = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "�̻�"); map.put("y", 116); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "�ʼ���"); map.put("y", 10330); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����"); map.put("y", 14499); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����"); map.put("y", 5672); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����"); map.put("y", 351); list.add(map);
	String d17size = gsonObj.toJson(list);
	
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "�̻�"); map.put("y", 64); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "�ʼ���"); map.put("y", 2982); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����"); map.put("y", 7076); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����"); map.put("y", 3298); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "����"); map.put("y", 776); list.add(map);
	String r17size = gsonObj.toJson(list);

	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "unknown"); map.put("y", 285); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "Female"); map.put("y", 11527); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "Male"); map.put("y", 13363); list.add(map);
	String a17sex = gsonObj.toJson(list);

	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "unknown"); map.put("y", 417); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "Female"); map.put("y", 14504); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "Male"); map.put("y", 16047); list.add(map);
	String d17sex = gsonObj.toJson(list);

	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "unknown"); map.put("y", 63); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "Female"); map.put("y", 5962); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "Male"); map.put("y", 8171); list.add(map);
	String r17sex = gsonObj.toJson(list);

	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "unknown"); map.put("y", 7325); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "yes"); map.put("y", 1784); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "no"); map.put("y", 16066); list.add(map);
	String a17neuter = gsonObj.toJson(list);

	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "unknown"); map.put("y", 9876); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "yes"); map.put("y", 1230); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "no"); map.put("y", 19862); list.add(map);
	String d17neuter = gsonObj.toJson(list);

	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object, Object>(); map.put("label", "unknown"); map.put("y", 4979); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "yes"); map.put("y", 1946); list.add(map);
	map = new HashMap<Object, Object>(); map.put("label", "no"); map.put("y", 7271); list.add(map);
	String r17neuter = gsonObj.toJson(list);
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
	
	.graphZone1{
		float: left;
		width:30%;
		height:100%;
	}
		
	.graphZone2{
		float: right;
		width:69%;
		height:100%;
	}
	.graphPart1{
		width:100%;
		height:33%;
		position:relative;
	}
		
	.graphPart2{
		width:100%;
		height:33%;
		position:relative;
	}
		
	.graphPart3{
		width:100%;
		height:33%;
		position:relative;
	}
	
	
	.iframe{
		width:100%;
		height:100%;
		position:relative;
		margin:0;
		border:0;

	}
</style>
<script type="text/javascript">
window.onload = function () {
 
var totalVisitors = <%out.print(total);%>;
var visitorsData = {
	"Abandoned Animal": [{
		click: visitorsChartDrilldownHandler,
		cursor: "pointer",
		explodeOnClick: false,
		innerRadius: "60%",
		legendMarkerType: "square",
		name: "Abandoned Animal",
		radius: "100%",
		showInLegend: true,
		startAngle: 0,
		type: "doughnut",
		dataPoints: <%out.print(dataPoints);%>
	}],
	"�Ծ�/����": [[{
			name: "���⵿�� ��ȣ ����",
			color: "#f29886",
			type: "column",
			xValueType: "count",
			dataPoints: <%out.print(a17orgNm);%>}],
		[{
			name: "���� �߻� �ñ�",
			color: "#f29886",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(a17happenMth);%>}],
		[{
			name: "���� ���� ���� ����",
			color: "#f29886",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(a17age);%>}],
		[{
			name: "���� ���� ������",
			color: "#f29886",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(a17size);%>}],
		[{
			name: "���� ���� ����",
			color: "#f29886",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(a17sex);%>}],
		[{
			name: "���� ���� �߼�ȭ ����",
			color: "#f29886",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(a17neuter);%>}]],
	"�ȶ���/�ڿ���": [[{
			name: "���⵿�� ��ȣ ����",
			color: "#008080",
			type: "column",
			xValueType: "count",
			dataPoints: <%out.print(d17orgNm);%>}],
		[{
			name: "���� �߻� �ñ�",
			color: "#008080",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17happenMth);%>}],
		[{
			name: "���� ���� ���� ����",
			color: "#008080",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17age);%>}],
		[{
			name: "���� ���� ������",
			color: "#008080",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17size);%>}],
		[{
			name: "���� ���� ����",
			color: "#008080",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17sex);%>}],
		[{
			name: "���� ���� �߼�ȭ ����",
			color: "#008080",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17neuter);%>}]],
	"��ȯ": [[{
			name: "���⵿�� ��ȣ ����",
			color: "#ac4762",
			type: "column",
			xValueType: "count",
			dataPoints: <%out.print(r17orgNm);%>}],
		[{
			name: "���� �߻� �ñ�",
			color: "#ac4762",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17happenMth);%>}],
		[{
			name: "���� ���� ���� ����",
			color: "#ac4762",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17age);%>}],
		[{
			name: "���� ���� ������",
			color: "#ac4762",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17size);%>}],
		[{
			name: "���� ���� ����",
			color: "#ac4762",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17sex);%>}],
		[{
			name: "���� ���� �߼�ȭ ����",
			color: "#ac4762",
			type: "column",
			yValueType: "count",
			dataPoints: <%out.print(r17neuter);%>}]]
};
 
var newVSReturningVisitorsOptions = {
	animationEnabled: true,
	theme: "light2",
	title: {
		text: "��ȣ ����"
	},
	legend: {
		fontFamily: "calibri",
		fontSize: 14,
		itemTextFormatter: function (e) {
			return e.dataPoint.label + ": " + Math.round(e.dataPoint.y / totalVisitors * 100) + "%";  
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
chart.options.data = visitorsData["Abandoned Animal"];
chart.render();
 
function visitorsChartDrilldownHandler(e) {
	//alert(JSON.stringify(visitorsData[e.dataPoint.label][0]));		// ���� �Ķ������ ������ Ȯ��
	//alert(JSON.stringify(visitorsData[e.dataPoint.label][0][0]["name"]));
	chart = new CanvasJS.Chart("orgNm", visitorsDrilldownedChartOptions);
	chart.options.data = visitorsData[e.dataPoint.label][0];
	chart.options.title = { text: visitorsData[e.dataPoint.label][0][0]["name"] }
	chart.render();	
	
	chart = new CanvasJS.Chart("happenMth", visitorsDrilldownedChartOptions);
	chart.options.data = visitorsData[e.dataPoint.label][1];
	chart.options.title = { text: visitorsData[e.dataPoint.label][1][0]["name"] }
	chart.render();	

	chart = new CanvasJS.Chart("age", visitorsDrilldownedChartOptions);
	chart.options.data = visitorsData[e.dataPoint.label][2];
	chart.options.title = { text: visitorsData[e.dataPoint.label][2][0]["name"] }
	chart.render();	

	chart = new CanvasJS.Chart("size", visitorsDrilldownedChartOptions);
	chart.options.data = visitorsData[e.dataPoint.label][3];
	chart.options.title = { text: visitorsData[e.dataPoint.label][3][0]["name"] }
	chart.render();	

	chart = new CanvasJS.Chart("sex", visitorsDrilldownedChartOptions);
	chart.options.data = visitorsData[e.dataPoint.label][4];
	chart.options.title = { text: visitorsData[e.dataPoint.label][4][0]["name"] }
	chart.render();	

	chart = new CanvasJS.Chart("neuter", visitorsDrilldownedChartOptions);
	chart.options.data = visitorsData[e.dataPoint.label][5];
	chart.options.title = { text: visitorsData[e.dataPoint.label][5][0]["name"] }
	chart.render();	
}
}
</script>
<style>
</style>
</head>
<body>
<div class="wrap">
	<div class="graphZone1">
		<div id="chartContainer" style="height: 100%; width: 100%;"></div>
	</div>
	<div class="graphZone2">
		<div class="graphPart1">
				<div id="orgNm" style="height: 100%; width: 50%; float:left;"></div>
				<div id="happenMth" style="height: 100%; width: 50%; float:left;"></div>
		</div>		
		<div class="graphPart2">
				<div id="age" style="height: 100%; width: 50%; float:left;"></div>
				<div id="size" style="height: 100%; width: 50%; float:left;"></div>
		</div>
		<div class="graphPart3">
				<div id="sex" style="height: 100%; width: 50%; float:left;"></div>
				<div id="neuter" style="height: 100%; width: 50%; float:left;"></div>
		</div>
	</div>
</div>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>        