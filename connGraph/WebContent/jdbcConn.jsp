<%-- import ���� �ʰ� JSP ���Ͽ��� ���� Mysql connection --%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% 
Connection conn = null; 
// null�� �ʱ�ȭ �Ѵ�. 
PreparedStatement pstmt = null; 
try { 
	String url = "jdbc:mysql://localhost:3306/animaldb?serverTimezone=UTC&autoReconnect=true&useSSL=false";
	String id = "root"; 		// ����ڰ���
	String pw = "plus_1004"; 	// ����ڰ����� �н����� 	
	
	Class.forName("com.mysql.jdbc.Driver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�. 
	
	conn = DriverManager.getConnection(url, id, pw); // DriverManager ��ü�κ��� Connection ��ü�� ���´�. 
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
} catch(SQLException e){
	System.err.println("Error" + e.getMessage());
	
} catch(ClassNotFoundException e){
	System.err.println("JDBC ����̹��� ã�� ���߽��ϴ�.");
}
%>
