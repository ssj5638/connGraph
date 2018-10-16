<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="org.json.JSONObject" %>

<%-- 2009년도부터 2017년도의 동물 종류 불러오기 for문 및 각 Table에서 데이터 불러오기 --%>

<%
	Connection conn = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); 
		String url = "jdbc:mysql://localhost:3306/animaldb?characterEncoding=EUC-KR&serverTimezone=UTC&autoReconnect=true&useSSL=false";
		String id = "root"; 		// 사용자계정
		String pw = "plus_1004";
		conn = DriverManager.getConnection(url, id, pw);
		
			ResultSet rsOld = null;
			ResultSet rs2015 = null;
			ResultSet rs2016 = null;
			ResultSet rs2017 = null;
			
			List barlist = new LinkedList();
			JSONObject responseObj = new JSONObject();
			
			String sqlOld = "select count(case when kindCd like \"[개]%\" then 1 end) as Dogs, "
					+ "count(case when kindCd like \"[고양이]%\" then 1 end) as Cats, "
					+ "count(case when kindCd like \"[기타축종]%\" then 1 end) as The_Others from animal_old where happenDt like ?;";
			PreparedStatement pstmtOld = conn.prepareStatement(sqlOld); // prepareStatement에서 해당 sql을 미리 컴파일한다. 

			String sql2015 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2015;";
			PreparedStatement pstmt2015 = conn.prepareStatement(sql2015);
			
			String sql2016 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2016;";
			PreparedStatement pstmt2016 = conn.prepareStatement(sql2016);
			
			String sql2017 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2017;";
			PreparedStatement pstmt2017 = conn.prepareStatement(sql2017);
			
			for (int a = 2009; a < 2015; a++){
				String strA = String.valueOf(a);
				pstmtOld.setString(1, strA+"%"); 
				rsOld = pstmtOld.executeQuery();

				JSONObject opObj = new JSONObject();
				
				while(rsOld.next()){
					String year = strA;
					System.out.println(year);
					int dogs = rsOld.getInt("Dogs");
					System.out.println(dogs);
					int cats = rsOld.getInt("Cats");
					System.out.println(cats);
					int theOthers = rsOld.getInt("The_Others");
					System.out.println(theOthers); 
					
					opObj.put("Year", year);
					opObj.put("Dogs", dogs);
					opObj.put("Cats", cats);
					opObj.put("The_Others", theOthers);
					barlist.add(opObj);
				}
			}
			responseObj.put("barlist", barlist);
			
			rs2015 = pstmt2015.executeQuery();
			rs2016 = pstmt2016.executeQuery();
			rs2017 = pstmt2017.executeQuery();
			
			while(rs2015.next()){				
				JSONObject opObj = new JSONObject();
				
				String year = "2015";
				System.out.println(year);
				int dogs = rs2015.getInt("Dogs");
				System.out.println(dogs);
				int cats = rs2015.getInt("Cats");
				System.out.println(cats);
				int theOthers = rs2015.getInt("The_Others");
				System.out.println(theOthers); 
				
				opObj.put("Year", year);
				opObj.put("Dogs", dogs);
				opObj.put("Cats", cats);
				opObj.put("The_Others", theOthers);
				barlist.add(opObj);
			}
			responseObj.put("barlist", barlist);
			
			while(rs2016.next()){
				JSONObject opObj = new JSONObject();
				
				String year = "2016";
				System.out.println(year);
				int dogs = rs2016.getInt("Dogs");
				System.out.println(dogs);
				int cats = rs2016.getInt("Cats");
				System.out.println(cats);
				int theOthers = rs2016.getInt("The_Others");
				System.out.println(theOthers);

				opObj.put("Year", year);
				opObj.put("Dogs", dogs);
				opObj.put("Cats", cats);
				opObj.put("The_Others", theOthers);
				barlist.add(opObj);
			}
			responseObj.put("barlist", barlist);
			
			while(rs2017.next()){
				JSONObject opObj = new JSONObject();
				
				String year = "2017";
				System.out.println(year);
				int dogs = rs2017.getInt("Dogs");
				System.out.println(dogs);
				int cats = rs2017.getInt("Cats");
				System.out.println(cats);
				int theOthers = rs2017.getInt("The_Others");
				System.out.println(theOthers);

				opObj.put("Year", year);
				opObj.put("Dogs", dogs);
				opObj.put("Cats", cats);
				opObj.put("The_Others", theOthers);
				barlist.add(opObj);
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