<%-- import connGraph.DBConn --%>

<%@page import="java.sql.*"%>
<%@page import="connGraph.DBConn" %>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	Connection conn = DBConn.getMySqlConnection();
	out.print("db 연결 정보 : " + conn);

	PreparedStatement pstmt = null; 

	String sql = "select * from animal_2015 where kind = ?"; // sql 쿼리
	pstmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
	pstmt.setString(1, "0"); 
	
	ResultSet rs = null;
	
	rs = pstmt.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다. 
	
	if(rs.next()) { // 결과를 한 행씩 돌아가면서 가져온다.
		do{
			out.print("<br>");
			out.print(rs.getString("kind") + "<br>");
			out.print(rs.getString("breed_Pre") + "<br>");
			out.print(rs.getString("orgNm") + "<br>");
			out.print(rs.getString("age(after)") + "<br>");
		}while(rs.next());
	}else{
		out.print("검색결과가 없습니다.");
	}
%>
