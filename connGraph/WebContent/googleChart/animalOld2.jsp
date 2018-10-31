<%-- 2009�⵵���� 2014�⵵�� ���� ����, �Ծ� count �ҷ����� for�� --%>

<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="org.json.JSONObject" %>
<%
	Connection conn = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); 
		String url = "jdbc:mysql://localhost:3306/animaldb?characterEncoding=EUC-KR&serverTimezone=UTC&autoReconnect=true&useSSL=false";
		String id = "root"; 		// ����ڰ���
		String pw = "plus_1004";
		conn = DriverManager.getConnection(url, id, pw);
		
			ResultSet rsOld = null;
			ResultSet rsOld2 = null;
			ResultSet rs2015 = null;
			ResultSet rs2016 = null;
			ResultSet rs2017 = null;
			
			List barlist = new LinkedList();
			JSONObject responseObj = new JSONObject();
			
			String sqlOld = "select count(case when kindCd like \"[��]%\" then 1 end) as Dogs, "
					+ "count(case when kindCd like \"[�����]%\" then 1 end) as Cats, "
					+ "count(case when kindCd like \"[��Ÿ����]%\" then 1 end) as The_Others from animal_old where happenDt like ?;";
			PreparedStatement pstmtOld = conn.prepareStatement(sqlOld); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 

			String sqlOld2 = "select count(*) as adoption from animal_old where processState=\"����(�Ծ�)\" and happenDt like ?;";
			PreparedStatement pstmtOld2 = conn.prepareStatement(sqlOld2); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 

			for (int a = 2009; a < 2015; a++){
				String strA = String.valueOf(a);
				
				pstmtOld.setString(1, strA+"%"); 
				rsOld = pstmtOld.executeQuery();
				
				pstmtOld2.setString(1, strA+"%"); 
				rsOld2 = pstmtOld2.executeQuery();

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
				}while(rsOld2.next()){
					int adoption = rsOld2.getInt("adoption");
					System.out.println(adoption);

					opObj.put("Adoption", adoption);
					barlist.add(opObj);
				}
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