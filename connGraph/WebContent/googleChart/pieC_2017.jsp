<%-- 2017년도 보호 상태 --%>

<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="org.json.JSONObject" %>

<%
	Connection conn = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); 
		String url = "jdbc:mysql://localhost:3306/animaldb?characterEncoding=EUC-KR&serverTimezone=UTC&autoReconnect=true&useSSL=false";
		String id = "root"; 		// 사용자계정
		String pw = "plus_1004";
		conn = DriverManager.getConnection(url, id, pw);
		
			ResultSet rs2017 = null;
			
			List barlist = new LinkedList();
			JSONObject responseObj = new JSONObject();
			
			String sql1 = "select count(case when processState_Pre='C' then 1 end) as C, " + 
							"count(case when processState_Pre='A' then 1 end) as A, " + 
							"count(case when processState_Pre='D' then 1 end) as D, " + 
							"count(case when processState_Pre='R' then 1 end) as R,	" + 
							"count(case when processState_Pre='E' then 1 end) as E " +
							"from animal_2017 where kind='1';";
							
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			
			rs2017 = pstmt1.executeQuery();
			
			JSONObject opObj2017 = new JSONObject();
			
			while(rs2017.next()){
				String year = "2017";
				System.out.println(year);
				int c = rs2017.getInt("C");
				System.out.println(c);
				int a = rs2017.getInt("A");
				System.out.println(a);
				int d = rs2017.getInt("D");
				System.out.println(d); 
				int r = rs2017.getInt("R");
				System.out.println(r); 
				int e = rs2017.getInt("E");
				System.out.println(e); 
				
				opObj2017.put("Year", year);
				opObj2017.put("C", c);
				opObj2017.put("A", a);
				opObj2017.put("D", d);
				opObj2017.put("R", r);
				opObj2017.put("E", e);
				barlist.add(opObj2017);
			}
			responseObj.put("barlist", barlist);
			out.print(responseObj.toString());
	} catch(Exception e){
		e.printStackTrace();
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