<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="org.json.JSONObject" %>

<%-- 2009�⵵���� 2014�⵵�� ���� ���� �ҷ����� for�� --%>

<%
	Connection conn = null;
	PreparedStatement pstmtOld = null; 
	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); 
		String url = "jdbc:mysql://localhost:3306/animaldb?characterEncoding=EUC-KR&serverTimezone=UTC&autoReconnect=true&useSSL=false";
		String id = "root"; 		// ����ڰ���
		String pw = "plus_1004";
		conn = DriverManager.getConnection(url, id, pw);
		
			ResultSet rsOld = null;
			
			List barlist = new LinkedList();
			JSONObject responseObj = new JSONObject();
			
			String sqlOld = "select count(case when kindCd like \"[��]%\" then 1 end) as Dogs, "
					+ "count(case when kindCd like \"[�����]%\" then 1 end) as Cats, "
					+ "count(case when kindCd like \"[��Ÿ����]%\" then 1 end) as The_Others from animal_old where happenDt like ?;";
			pstmtOld = conn.prepareStatement(sqlOld); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 

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