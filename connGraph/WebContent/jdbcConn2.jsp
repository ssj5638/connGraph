<%-- import connGraph.DBConn --%>

<%@page import="java.sql.*"%>
<%@page import="connGraph.DBConn" %>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	Connection conn = DBConn.getMySqlConnection();
	out.print("db ���� ���� : " + conn);

	PreparedStatement pstmt = null; 

	String sql = "select * from animal_2015 where kind = ?"; // sql ����
	pstmt = conn.prepareStatement(sql); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
	pstmt.setString(1, "0"); 
	
	ResultSet rs = null;
	
	rs = pstmt.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 
	
	if(rs.next()) { // ����� �� �྿ ���ư��鼭 �����´�.
		do{
			out.print("<br>");
			out.print(rs.getString("kind") + "<br>");
			out.print(rs.getString("breed_Pre") + "<br>");
			out.print(rs.getString("orgNm") + "<br>");
			out.print(rs.getString("age(after)") + "<br>");
		}while(rs.next());
	}else{
		out.print("�˻������ �����ϴ�.");
	}
%>
