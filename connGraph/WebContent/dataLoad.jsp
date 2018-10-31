<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="org.json.JSONObject" %>

<%
	Connection conn = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); 
		String url = "jdbc:mysql://localhost:3306/animaldb?serverTimezone=UTC&autoReconnect=true&useSSL=false";
		String id = "root"; 		// 사용자계정
		String pw = "plus_1004"; 	// 사용자계정의 패스워드 	
		conn = DriverManager.getConnection(url, id, pw);
		
			ResultSet rs2015 = null;
			ResultSet rs2016 = null;
			
			List barlist = new LinkedList();
			JSONObject responseObj = new JSONObject();
			
			String sql1 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2015;";
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			
			String sql2 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2016;";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			
			rs2015 = pstmt1.executeQuery();
			rs2016 = pstmt2.executeQuery();
			
	        JSONObject barObj = null;
			
			while(rs2015.next()){
//				String kind[] = {"Dogs", "Cats", "The_Others"};
//				out.println(kind+"<br>");
				int dogs = rs2015.getInt("Dogs");
				out.println(dogs+"<br>");
				int cats = rs2015.getInt("Cats");
				out.println(cats+"<br>");
				int theOthers = rs2015.getInt("The_Others");
				out.println(theOthers+"<br>"); 

	            barObj = new JSONObject();
	            barObj.put("Dogs", dogs);
	            barObj.put("Cats", cats);
	            barObj.put("The_Others", theOthers);
	            barlist.add(barObj);
	            out.println(barlist.toString());
			}
			while(rs2016.next()){
//				String kind[] = {"Dogs", "Cats", "The_Others"};
//				System.out.println(kind);
				int dogs = rs2016.getInt("Dogs");
				out.println(dogs+"<br>");
				int cats = rs2016.getInt("Cats");
				out.println(cats+"<br>");
				int theOthers = rs2016.getInt("The_Others");
				out.println(theOthers+"<br>"); 
				
	            barObj = new JSONObject();
				barObj.put("Dogs", dogs);
				barObj.put("Cats", cats);
				barObj.put("The_Others", theOthers);
	            barlist.add(barObj);
	            out.println(barlist.toString());
			}
			
			
	} catch(SQLException e){
		System.err.println("Error" + e.getMessage());
	} catch(ClassNotFoundException e){
		System.err.println("JDBC 드라이버를 찾지 못했습니다.");
	} finally{
		if(conn != null){
			try{
				conn.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
	}
%>