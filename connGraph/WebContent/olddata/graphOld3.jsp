<%-- 2009년도부터 2017년도의 동물 종류, 입양 count 불러오기 where절 --%>

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

		ResultSet rs09 = null;		// 09년도 종류
		ResultSet rs09_2 = null;	// 09년도 입양
		ResultSet rs10 = null;		// 10년도 종류
		ResultSet rs10_2 = null;	// 10년도 입양
		ResultSet rs11 = null;		// 11년도 종류
		ResultSet rs11_2 = null;	// 11년도 입양
		ResultSet rs12 = null;		// 12년도 종류
		ResultSet rs12_2 = null;	// 12년도 입양
		ResultSet rs13 = null;		// 13년도 종류
		ResultSet rs13_2 = null;	// 13년도 입양
		ResultSet rs14 = null;		// 14년도 종류
		ResultSet rs14_2 = null;	// 14년도 입양
		ResultSet rs15 = null;		// 15년도 종류
		ResultSet rs15_2 = null;	// 15년도 입양
		ResultSet rs16 = null;		// 16년도 종류
		ResultSet rs16_2 = null;	// 16년도 입양
		ResultSet rs17 = null;		// 17년도 종류
		ResultSet rs17_2 = null;	// 17년도 입양
			
		List barlist = new LinkedList();
		JSONObject responseObj = new JSONObject();
		
		// 09 - 14년도 종류, 입양 쿼리문
		String sql09 = "select count(case when kindCd like \"[개]%\" then 1 end) as Dogs, "
				+ "count(case when kindCd like \"[고양이]%\" then 1 end) as Cats, "
				+ "count(case when kindCd like \"[기타축종]%\" then 1 end) as The_Others from animal_old where happenDt like \"2009%\";";
		PreparedStatement pstmt09 = conn.prepareStatement(sql09); // prepareStatement에서 해당 sql을 미리 컴파일한다. 

		String sql09_2 = "select count(*) as adoption from animal_old where processState=\"종료(입양)\" and happenDt like \"2009%\";";
		PreparedStatement pstmt09_2 = conn.prepareStatement(sql09_2); // prepareStatement에서 해당 sql을 미리 컴파일한다. 

		// 09 - 14년도 종류, 입양 쿼리문
		String sql10 = "select count(case when kindCd like \"[개]%\" then 1 end) as Dogs, "
				+ "count(case when kindCd like \"[고양이]%\" then 1 end) as Cats, "
				+ "count(case when kindCd like \"[기타축종]%\" then 1 end) as The_Others from animal_old where happenDt like \"2010%\";";
		PreparedStatement pstmt10 = conn.prepareStatement(sql10); // prepareStatement에서 해당 sql을 미리 컴파일한다. 

		String sql10_2 = "select count(*) as adoption from animal_old where processState=\"종료(입양)\" and happenDt like \"2010%\";";
		PreparedStatement pstmt10_2 = conn.prepareStatement(sql10_2); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
		// 09 - 14년도 종류, 입양 쿼리문
		String sql11 = "select count(case when kindCd like \"[개]%\" then 1 end) as Dogs, "
				+ "count(case when kindCd like \"[고양이]%\" then 1 end) as Cats, "
				+ "count(case when kindCd like \"[기타축종]%\" then 1 end) as The_Others from animal_old where happenDt like \"2011%\";";
		PreparedStatement pstmt11 = conn.prepareStatement(sql11); // prepareStatement에서 해당 sql을 미리 컴파일한다. 

		String sql11_2 = "select count(*) as adoption from animal_old where processState=\"종료(입양)\" and happenDt like \"2011%\";";
		PreparedStatement pstmt11_2 = conn.prepareStatement(sql11_2); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
		// 09 - 14년도 종류, 입양 쿼리문
		String sql12 = "select count(case when kindCd like \"[개]%\" then 1 end) as Dogs, "
				+ "count(case when kindCd like \"[고양이]%\" then 1 end) as Cats, "
				+ "count(case when kindCd like \"[기타축종]%\" then 1 end) as The_Others from animal_old where happenDt like \"2012%\";";
		PreparedStatement pstmt12 = conn.prepareStatement(sql12); // prepareStatement에서 해당 sql을 미리 컴파일한다. 

		String sql12_2 = "select count(*) as adoption from animal_old where processState=\"종료(입양)\" and happenDt like \"2012%\";";
		PreparedStatement pstmt12_2 = conn.prepareStatement(sql12_2); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
		// 09 - 14년도 종류, 입양 쿼리문
		String sql13 = "select count(case when kindCd like \"[개]%\" then 1 end) as Dogs, "
				+ "count(case when kindCd like \"[고양이]%\" then 1 end) as Cats, "
				+ "count(case when kindCd like \"[기타축종]%\" then 1 end) as The_Others from animal_old where happenDt like \"2013%\";";
		PreparedStatement pstmt13 = conn.prepareStatement(sql13); // prepareStatement에서 해당 sql을 미리 컴파일한다. 

		String sql13_2 = "select count(*) as adoption from animal_old where processState=\"종료(입양)\" and happenDt like \"2013%\";";
		PreparedStatement pstmt13_2 = conn.prepareStatement(sql13_2); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
		// 09 - 14년도 종류, 입양 쿼리문
		String sql14 = "select count(case when kindCd like \"[개]%\" then 1 end) as Dogs, "
				+ "count(case when kindCd like \"[고양이]%\" then 1 end) as Cats, "
				+ "count(case when kindCd like \"[기타축종]%\" then 1 end) as The_Others from animal_old where happenDt like \"2014%\";";
		PreparedStatement pstmt14 = conn.prepareStatement(sql14); // prepareStatement에서 해당 sql을 미리 컴파일한다. 

		String sql14_2 = "select count(*) as adoption from animal_old where processState=\"종료(입양)\" and happenDt like \"2014%\";";
		PreparedStatement pstmt14_2 = conn.prepareStatement(sql14_2); // prepareStatement에서 해당 sql을 미리 컴파일한다. 

		// 15년도 종류, 입양 쿼리문
		String sql2015 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2015;";
		PreparedStatement pstmt15 = conn.prepareStatement(sql2015);
		String sql2015_2 = "select count(*) as adoption from animal_2015 where processState=\"종료(입양)\";";
		PreparedStatement pstmt15_2 = conn.prepareStatement(sql2015_2);
		
		// 16년도 종류, 입양 쿼리문
		String sql2016 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2016;";
		PreparedStatement pstmt16 = conn.prepareStatement(sql2016);
		String sql2016_2 = "select count(*) as adoption from animal_2016 where processState=\"종료(입양)\";";
		PreparedStatement pstmt16_2 = conn.prepareStatement(sql2016_2);
		
		// 17년도 종류, 입양 쿼리문
		String sql2017 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2017;";
		PreparedStatement pstmt17 = conn.prepareStatement(sql2017);
		String sql2017_2 = "select count(*) as adoption from animal_2017 where processState=\"종료(입양)\";";
		PreparedStatement pstmt17_2 = conn.prepareStatement(sql2017_2);

		rs09 = pstmt09.executeQuery();
		rs09_2 = pstmt09_2.executeQuery();
		rs10 = pstmt10.executeQuery();
		rs10_2 = pstmt10_2.executeQuery();	
		rs11 = pstmt11.executeQuery();
		rs11_2 = pstmt11_2.executeQuery();	
		rs12 = pstmt12.executeQuery();
		rs12_2 = pstmt12_2.executeQuery();	
		rs13 = pstmt13.executeQuery();
		rs13_2 = pstmt13_2.executeQuery();	
		rs14 = pstmt14.executeQuery();
		rs14_2 = pstmt14_2.executeQuery();		
		rs15 = pstmt15.executeQuery();
		rs15_2 = pstmt15_2.executeQuery();
		rs16 = pstmt16.executeQuery();
		rs16_2 = pstmt16_2.executeQuery();
		rs17 = pstmt17.executeQuery();
		rs17_2 = pstmt17_2.executeQuery();

		JSONObject opObj09 = new JSONObject();
		JSONObject opObj10 = new JSONObject();
		JSONObject opObj11 = new JSONObject();
		JSONObject opObj12 = new JSONObject();
		JSONObject opObj13 = new JSONObject();
		JSONObject opObj14 = new JSONObject();
		JSONObject opObj15 = new JSONObject();
		JSONObject opObj16 = new JSONObject();
		JSONObject opObj17 = new JSONObject();
		// 09
		while(rs09.next()){				
			String year = "2009";
			int dogs = rs09.getInt("Dogs");
			int cats = rs09.getInt("Cats");
			int theOthers = rs09.getInt("The_Others");
			
			opObj09.put("Year", year);
			opObj09.put("Dogs", dogs);
			opObj09.put("Cats", cats);
			opObj09.put("The_Others", theOthers);
		}
		while(rs09_2.next()){
			int adoption = rs09_2.getInt("adoption");
				opObj09.put("Adoption", adoption);
			barlist.add(opObj09);
		}
		responseObj.put("barlist", barlist);
		// 10
		while(rs10.next()){				
			String year = "2010";
			int dogs = rs10.getInt("Dogs");
			int cats = rs10.getInt("Cats");
			int theOthers = rs10.getInt("The_Others");
			
			opObj10.put("Year", year);
			opObj10.put("Dogs", dogs);
			opObj10.put("Cats", cats);
			opObj10.put("The_Others", theOthers);
		}
		while(rs10_2.next()){
			int adoption = rs10_2.getInt("adoption");
				opObj10.put("Adoption", adoption);
			barlist.add(opObj10);
		}
		responseObj.put("barlist", barlist);
		// 11
		while(rs11.next()){				
			String year = "2011";
			int dogs = rs11.getInt("Dogs");
			int cats = rs11.getInt("Cats");
			int theOthers = rs11.getInt("The_Others");
			
			opObj11.put("Year", year);
			opObj11.put("Dogs", dogs);
			opObj11.put("Cats", cats);
			opObj11.put("The_Others", theOthers);
		}
		while(rs11_2.next()){
			int adoption = rs11_2.getInt("adoption");
				opObj11.put("Adoption", adoption);
			barlist.add(opObj11);
		}
		responseObj.put("barlist", barlist);
		// 12
		while(rs12.next()){				
			String year = "2012";
			int dogs = rs12.getInt("Dogs");
			int cats = rs12.getInt("Cats");
			int theOthers = rs12.getInt("The_Others");
			
			opObj12.put("Year", year);
			opObj12.put("Dogs", dogs);
			opObj12.put("Cats", cats);
			opObj12.put("The_Others", theOthers);
		}
		while(rs12_2.next()){
			int adoption = rs12_2.getInt("adoption");
				opObj12.put("Adoption", adoption);
			barlist.add(opObj12);
		}
		responseObj.put("barlist", barlist);
		// 13
		while(rs13.next()){				
			String year = "2013";
			int dogs = rs13.getInt("Dogs");
			int cats = rs13.getInt("Cats");
			int theOthers = rs13.getInt("The_Others");
			
			opObj13.put("Year", year);
			opObj13.put("Dogs", dogs);
			opObj13.put("Cats", cats);
			opObj13.put("The_Others", theOthers);
		}
		while(rs13_2.next()){
			int adoption = rs13_2.getInt("adoption");
				opObj13.put("Adoption", adoption);
			barlist.add(opObj13);
		}
		responseObj.put("barlist", barlist);
		// 14
		while(rs14.next()){				
			String year = "2014";
			int dogs = rs14.getInt("Dogs");
			int cats = rs14.getInt("Cats");
			int theOthers = rs14.getInt("The_Others");
			
			opObj14.put("Year", year);
			opObj14.put("Dogs", dogs);
			opObj14.put("Cats", cats);
			opObj14.put("The_Others", theOthers);
		}
		while(rs14_2.next()){
			int adoption = rs14_2.getInt("adoption");
				opObj14.put("Adoption", adoption);
			barlist.add(opObj14);
		}
		responseObj.put("barlist", barlist);
		// 15
		while(rs15.next()){				
			String year = "2015";
			int dogs = rs15.getInt("Dogs");
			int cats = rs15.getInt("Cats");
			int theOthers = rs15.getInt("The_Others");
			
			opObj15.put("Year", year);
			opObj15.put("Dogs", dogs);
			opObj15.put("Cats", cats);
			opObj15.put("The_Others", theOthers);
		}
		while(rs15_2.next()){
			int adoption = rs15_2.getInt("adoption");
				opObj15.put("Adoption", adoption);
			barlist.add(opObj15);
		}
		responseObj.put("barlist", barlist);
			// 16
		while(rs16.next()){				
			String year = "2016";
			int dogs = rs16.getInt("Dogs");
			int cats = rs16.getInt("Cats");
			int theOthers = rs16.getInt("The_Others");

			opObj16.put("Year", year);
			opObj16.put("Dogs", dogs);
			opObj16.put("Cats", cats);
			opObj16.put("The_Others", theOthers);
		}
		while(rs16_2.next()){
			int adoption = rs16_2.getInt("adoption");

			opObj16.put("Adoption", adoption);
			barlist.add(opObj16);
		}
		responseObj.put("barlist", barlist);

			// 17
		while(rs17.next()){				
			String year = "2017";
			int dogs = rs17.getInt("Dogs");
			int cats = rs17.getInt("Cats");
			int theOthers = rs17.getInt("The_Others");

			opObj17.put("Year", year);
			opObj17.put("Dogs", dogs);
			opObj17.put("Cats", cats);
			opObj17.put("The_Others", theOthers);
		}
		while(rs17_2.next()){
			int adoption = rs17_2.getInt("adoption");

			opObj17.put("Adoption", adoption);
			barlist.add(opObj17);
		}
		responseObj.put("barlist", barlist);
		out.print(responseObj.toString());
		System.out.println(responseObj.toString());
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