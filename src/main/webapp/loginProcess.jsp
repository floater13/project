<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Process</title>
</head>
<body>
<%
    String URL = "jdbc:mysql://localhost:3307/spring5fs";
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    try {
        // 데이터베이스 드라이버 로드
        Class.forName("com.mysql.cj.jdbc.Driver");
        // 데이터베이스 연결
        conn = DriverManager.getConnection(URL, "root", "mysql");
        
        // SQL 쿼리 준비
        String query = "SELECT * FROM sports WHERE id = ? AND ssn = ?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, password);
        
        // 쿼리 실행
        rs = stmt.executeQuery();
        
        if (rs.next()) {
            // 로그인 성공
            session.setAttribute("userId", rs.getString("id"));
            session.setAttribute("userName", rs.getString("name"));

            // 쿠키 설정
            Cookie loginCookie = new Cookie("username", username);
            loginCookie.setMaxAge(60 * 60); // 1시간 동안 유효
            response.addCookie(loginCookie);

            // 성공 메시지 및 리다이렉션
            out.println("<script type='text/javascript'>");
            out.println("alert('환영합니다, " + username + "!');");
            out.println("window.location.href = 'index.jsp';");
            out.println("</script>");
        } else {
            // 로그인 실패
            out.println("<script type='text/javascript'>");
            out.println("alert('로그인 실패!');");
            out.println("window.location.href = 'login.jsp';");
            out.println("</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>로그인 처리 중 오류가 발생했습니다: " + e.getMessage() + "</p>");
    } finally {
        // 자원 반환
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
</body>
</html>

