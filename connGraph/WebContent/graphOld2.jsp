<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="org.json.JSONObject" %>

<%-- 2009�⵵���� 2017�⵵�� ���� ����, �Ծ� count �ҷ����� --%>

<%
	Connection conn = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); 
		String url = "jdbc:mysql://localhost:3306/animaldb?characterEncoding=EUC-KR&serverTimezone=UTC&autoReconnect=true&useSSL=false";
		String id = "root"; 		// ����ڰ���
		String pw = "plus_1004";
		conn = DriverManager.getConnection(url, id, pw);
		
			ResultSet rsOld = null;		// 09-14�⵵ ����
			ResultSet rsOld_2 = null;	// 09-14�⵵ �Ծ�
			ResultSet rs15 = null;		// 15�⵵ ����
			ResultSet rs15_2 = null;	// 15�⵵ �Ծ�
			ResultSet rs16 = null;		// 16�⵵ ����
			ResultSet rs16_2 = null;	// 16�⵵ �Ծ�
			ResultSet rs17 = null;		// 17�⵵ ����
			ResultSet rs17_2 = null;	// 17�⵵ �Ծ�
			
			List barlist = new LinkedList();
			JSONObject responseObj = new JSONObject();
			
			// 09 - 14�⵵ ����, �Ծ� ������
			String sqlOld = "select count(case when kindCd like \"[��]%\" then 1 end) as Dogs, "
					+ "count(case when kindCd like \"[�����]%\" then 1 end) as Cats, "
					+ "count(case when kindCd like \"[��Ÿ����]%\" then 1 end) as The_Others from animal_old where happenDt like ?;";
			PreparedStatement pstmtOld = conn.prepareStatement(sqlOld); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 

			String sqlOld_2 = "select count(*) as adoption from animal_old where processState=\"����(�Ծ�)\" and happenDt like ?;";
			PreparedStatement pstmtOld_2 = conn.prepareStatement(sqlOld_2); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 

			// 15�⵵ ����, �Ծ� ������
			String sql2015 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2015;";
			PreparedStatement pstmt15 = conn.prepareStatement(sql2015);
			String sql2015_2 = "select count(*) as adoption from animal_2015 where processState=\"����(�Ծ�)\";";
			PreparedStatement pstmt15_2 = conn.prepareStatement(sql2015_2);
			
			// 16�⵵ ����, �Ծ� ������
			String sql2016 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2016;";
			PreparedStatement pstmt16 = conn.prepareStatement(sql2016);
			String sql2016_2 = "select count(*) as adoption from animal_2016 where processState=\"����(�Ծ�)\";";
			PreparedStatement pstmt16_2 = conn.prepareStatement(sql2016_2);
			
			// 17�⵵ ����, �Ծ� ������
			String sql2017 = "select count(case when kind='0' then 1 end) as Dogs, count(case when kind='1' then 1 end) as Cats, count(case when kind='2' then 1 end) as The_Others from animal_2017;";
			PreparedStatement pstmt17 = conn.prepareStatement(sql2017);
			String sql2017_2 = "select count(*) as adoption from animal_2017 where processState=\"����(�Ծ�)\";";
			PreparedStatement pstmt17_2 = conn.prepareStatement(sql2017_2);
			
			// 09-14
			for (int a = 2009; a < 2015; a++){
				String strA = String.valueOf(a);
				
				pstmtOld.setString(1, strA+"%"); 
				rsOld = pstmtOld.executeQuery();
				
				pstmtOld_2.setString(1, strA+"%"); 
				rsOld_2 = pstmtOld_2.executeQuery();

				JSONObject opObj = new JSONObject();
				
				while(rsOld.next()){
					String year = strA;
					int dogs = rsOld.getInt("Dogs");
					int cats = rsOld.getInt("Cats");
					int theOthers = rsOld.getInt("The_Others");
					
					opObj.put("Year", year);
 					opObj.put("Dogs", dogs);
					opObj.put("Cats", cats);
					opObj.put("The_Others", theOthers);
				}while(rsOld_2.next()){
					int adoption = rsOld_2.getInt("adoption");
					
					opObj.put("Adoption", adoption);
					barlist.add(opObj);
				}
			}
			responseObj.put("barlist", barlist);
			
			rs15 = pstmt15.executeQuery();
			rs15_2 = pstmt15_2.executeQuery();
			rs16 = pstmt16.executeQuery();
			rs16_2 = pstmt16_2.executeQuery();
			rs17 = pstmt17.executeQuery();
			rs17_2 = pstmt17_2.executeQuery();

			JSONObject opObj15 = new JSONObject();
			JSONObject opObj16 = new JSONObject();
			JSONObject opObj17 = new JSONObject();
			
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