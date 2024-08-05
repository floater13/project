<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO();
List<BoardDTO> list = dao.getBoardList();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>커뮤니티</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 80%;
            max-width: 900px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #009688;
            color: white;
        }
        td {
            text-align: center;
        }
        a {
            text-decoration: none;
            color: #009688;
        }
        a:hover {
            color: #00796b;
        }
        .btn-container {
            text-align: right;
        }
        .btn {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            background-color: #009688;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #00796b;
        }
        .btn-secondary {
            background-color: #2196F3;
        }
        .btn-secondary:hover {
            background-color: #1976D2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>커뮤니티 게시판</h2>
        <table>
            <thead>
                <tr>
                    <th class="num">번호</th>
                    <th class="title">제목</th>
                    <th class="writer">작성자</th>
                    <th class="regtime">작성일시</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
            <%
            for (BoardDTO dto : list) {
            %>
                <tr>
                    <td><%= dto.getNum() %></td>
                    <td style="text-align:left;">
                        <a href="view.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a>
                    </td>
                    <td><%= dto.getWriter() %></td>
                    <td><%= dto.getRegtime() %></td>
                    <td><%= dto.getHits() %></td>
                </tr>
            <%
            }
            %>
            </tbody>
        </table>

        <div class="btn-container">
            <button class="btn" onclick="location.href='write.jsp'">글쓰기</button>
            <button class="btn btn-secondary" onclick="location.href='index.jsp'">홈으로</button>
        </div>
    </div>
</body>
</html>
