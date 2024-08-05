<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Join Process</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String URL = "jdbc:mysql://localhost:3307/spring5fs";
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String tel = request.getParameter("tel");
    String team = request.getParameter("team");
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
	
    
    try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
      
        conn = DriverManager.getConnection(URL, "root", "mysql");
        
        String query1 ="SELECT * FROM sports WHERE id = ?";
        stmt = conn.prepareStatement(query1);
        stmt.setString(1, id);
        
        rs = stmt.executeQuery();
        
        if (rs.next()) {   
            
%>
   <script>
                alert('이미 등록된 아이디입니다.');
                history.back()
            </script>
<%          
        } else { 
		String query2 ="INSERT INTO sports (id, ssn, name, tel, team) VALUES (?, ?, ?, ?, ?)";
		
		stmt = conn.prepareStatement(query2);
		stmt.setString(1, id);
		stmt.setString(2, password);
		stmt.setString(3, name);
		stmt.setString(4, tel);
		stmt.setString(5, team);
		stmt.executeUpdate(); 
%>
	<script>
                alert('가입이 완료되었습니다.');
                window.location.href = 'index.jsp';
            </script>
<%

        }
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
