<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="org.json.JSONObject" %>

<%-- 2009년도부터 2014년도의 동물 종류 불러오기 for문 --%>

<%
	Connection conn = null;
	PreparedStatement pstmtOld = null; 
	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); 
		String url = "jdbc:mysql://localhost:3306/animaldb?characterEncoding=EUC-KR&serverTimezone=UTC&autoReconnect=true&useSSL=false";
		String id = "root"; 		// 사용자계정
		String pw = "plus_1004";
		conn = DriverManager.getConnection(url, id, pw);
		
			ResultSet rsOld = null;
			
			List barlist = new LinkedList();
			JSONObject responseObj = new JSONObject();
			
			String sqlOld = "select count(case when kindCd like \"[개]%\" then 1 end) as Dogs, "
					+ "count(case when kindCd like \"[고양이]%\" then 1 end) as Cats, "
					+ "count(case when kindCd like \"[기타축종]%\" then 1 end) as The_Others from animal_old where happenDt like ?;";
			pstmtOld = conn.prepareStatement(sqlOld); // prepareStatement에서 해당 sql을 미리 컴파일한다. 

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