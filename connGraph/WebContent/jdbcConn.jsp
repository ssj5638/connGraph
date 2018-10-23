<%-- import 하지 않고 JSP 파일에서 직접 Mysql connection --%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% 
Connection conn = null; 
// null로 초기화 한다. 
PreparedStatement pstmt = null; 
try { 
	String url = "jdbc:mysql://localhost:3306/animaldb?serverTimezone=UTC&autoReconnect=true&useSSL=false";
	String id = "root"; 		// 사용자계정
	String pw = "plus_1004"; 	// 사용자계정의 패스워드 	
	
	Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다. 
	
	conn = DriverManager.getConnection(url, id, pw); // DriverManager 객체로부터 Connection 객체를 얻어온다. 
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
} catch(SQLException e){
	System.err.println("Error" + e.getMessage());
	
} catch(ClassNotFoundException e){
	System.err.println("JDBC 드라이버를 찾지 못했습니다.");
}
%>
