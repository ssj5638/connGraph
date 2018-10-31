<%-- Mysql 연결 확인 --%>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	// null로 초기화 한다
	Connection conn = null;
	try{
		// 사용하려는 데이터베이스명을 포함한 URL 기술 
//		String url = "jdbc:mysql://localhost:3306/animaldb"; 
		// Error The server time zone value 에러 해결
		// mysql-connector-java 버전 5.1.X 이후 버전 부터 KST 타입존을 인식하지 못하는 이슈
		String url = "jdbc:mysql://localhost:3306/animaldb?characterEncoding=EUC-KR&serverTimezone=UTC";
		String id = "root"; 		// 사용자계정
		String pw = "plus_1004"; 	// 사용자계정의 패스워드 
		// 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
		Class.forName("com.mysql.jdbc.Driver"); 
		// DriverManager 객체로부터 Connection 객체를 얻어온다.
		conn=DriverManager.getConnection(url,id,pw);
		// 커넥션이 제대로 연결되면 수행된다. 
		System.out.println("제대로 연결되었습니다."); 
		// 예외가 발생하면 예외 상황을 처리한다. 
		
		conn.close();
	} catch(SQLException e){
		System.err.println("Error" + e.getMessage());
		
	} catch(ClassNotFoundException e){
		System.err.println("JDBC 드라이버를 찾지 못했습니다.");
	}
%>