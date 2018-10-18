<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="org.json.JSONObject" %>

<%-- 2016년도 보호 상태 --%>

<%
	Connection conn = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); 
		String url = "jdbc:mysql://localhost:3306/animaldb?characterEncoding=EUC-KR&serverTimezone=UTC&autoReconnect=true&useSSL=false";
		String id = "root"; 		// 사용자계정
		String pw = "plus_1004";
		conn = DriverManager.getConnection(url, id, pw);
		
			ResultSet rs2016 = null;
			
			List barlist = new LinkedList();
			JSONObject responseObj = new JSONObject();
			
			String sql1 = "select count(case when processState_Pre='C' then 1 end) as C, " + 
							"count(case when processState_Pre='A' then 1 end) as A, " + 
							"count(case when processState_Pre='D' then 1 end) as D, " + 
							"count(case when processState_Pre='R' then 1 end) as R,	" + 
							"count(case when processState_Pre='E' then 1 end) as E " +
							"from animal_2016 where kind='1';";
							
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			
			rs2016 = pstmt1.executeQuery();
			
			JSONObject opObj2016 = new JSONObject();
			
			while(rs2016.next()){
				String year = "2016";
				System.out.println(year);
				int c = rs2016.getInt("C");
				System.out.println(c);
				int a = rs2016.getInt("A");
				System.out.println(a);
				int d = rs2016.getInt("D");
				System.out.println(d); 
				int r = rs2016.getInt("R");
				System.out.println(r); 
				int e = rs2016.getInt("E");
				System.out.println(e); 
				
				opObj2016.put("Year", year);
				opObj2016.put("C", c);
				opObj2016.put("A", a);
				opObj2016.put("D", d);
				opObj2016.put("R", r);
				opObj2016.put("E", e);
				barlist.add(opObj2016);
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