<%-- Mysql ���� Ȯ�� --%>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	// null�� �ʱ�ȭ �Ѵ�
	Connection conn = null;
	try{
		// ����Ϸ��� �����ͺ��̽����� ������ URL ��� 
//		String url = "jdbc:mysql://localhost:3306/animaldb"; 
		// Error The server time zone value ���� �ذ�
		// mysql-connector-java ���� 5.1.X ���� ���� ���� KST Ÿ������ �ν����� ���ϴ� �̽�
		String url = "jdbc:mysql://localhost:3306/animaldb?characterEncoding=EUC-KR&serverTimezone=UTC";
		String id = "root"; 		// ����ڰ���
		String pw = "plus_1004"; 	// ����ڰ����� �н����� 
		// �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
		Class.forName("com.mysql.jdbc.Driver"); 
		// DriverManager ��ü�κ��� Connection ��ü�� ���´�.
		conn=DriverManager.getConnection(url,id,pw);
		// Ŀ�ؼ��� ����� ����Ǹ� ����ȴ�. 
		System.out.println("����� ����Ǿ����ϴ�."); 
		// ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�. 
		
		conn.close();
	} catch(SQLException e){
		System.err.println("Error" + e.getMessage());
		
	} catch(ClassNotFoundException e){
		System.err.println("JDBC ����̹��� ã�� ���߽��ϴ�.");
	}
%>