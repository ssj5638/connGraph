<%-- 2015년도 보호 상태 --%>

<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="org.json.JSONObject" %>

<%
	Connection conn = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); 
		String url = "jdbc:mysql://localhost:3306/animaldb?characterEncoding=EUC-KR&serverTimezone=UTC&autoReconnect=true&useSSL=false&allowPublicKeyRetrieval=true";
		String id = "root"; 		// 사용자계정
		String pw = "plus_1004";
		conn = DriverManager.getConnection(url, id, pw);
		
			ResultSet rs2015 = null;
			
			List barlist = new LinkedList();
			JSONObject responseObj = new JSONObject();
			
			String sql1 = "select count(case when processState_Pre='C' then 1 end) as C, " + 
							"count(case when processState_Pre='A' then 1 end) as A, " + 
							"count(case when processState_Pre='D' then 1 end) as D, " + 
							"count(case when processState_Pre='R' then 1 end) as R,	" + 
							"count(case when processState_Pre='E' then 1 end) as E " +
							"from animal_2015 where kind='1';";
							
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			
			rs2015 = pstmt1.executeQuery();
			
			JSONObject opObj2015 = new JSONObject();
			
			while(rs2015.next()){
				String year = "2015";
				System.out.println(year);
				int c = rs2015.getInt("C");	// 보호중
				System.out.println(c);
				int a = rs2015.getInt("A"); // 기증, 입양
				System.out.println(a);
				int d = rs2015.getInt("D"); // 자연사, 안락사
				System.out.println(d); 
				int r = rs2015.getInt("R"); // 반환
				System.out.println(r); 
				int e = rs2015.getInt("E"); // 방사, 미포획
				System.out.println(e); 
				
				opObj2015.put("Year", year);
				opObj2015.put("C", c);
				opObj2015.put("A", a);
				opObj2015.put("D", d);
				opObj2015.put("R", r);
				opObj2015.put("E", e);
				barlist.add(opObj2015);
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