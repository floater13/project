<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
BoardDAO dao = new BoardDAO();
dao.increaseHits(Integer.parseInt(num));
BoardDTO dto = dao.getOne(Integer.parseInt(num));
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
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
            max-width: 800px;
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
            padding: 12px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #009688;
            color: white;
            text-align: left;
        }
        td {
            text-align: left;
        }
        a {
            text-decoration: none;
            color: #009688;
        }
        a:hover {
            color: #00796b;
        }
        .btn-container {
            margin-top: 20px;
            text-align: right;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #009688;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, box-shadow 0.3s;
            margin-left: 10px;
        }
        .btn:hover {
            background-color: #00796b;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .btn-secondary {
            background-color: #f44336;
        }
        .btn-secondary:hover {
            background-color: #c62828;
        }
    </style>
</head>
<body>
    <div class="container">
        <table>
            <tr>
                <th>제목</th>
                <td><%=dto.getTitle() %></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%=dto.getWriter() %></td>
            </tr>
            <tr>
                <th>작성일시</th>
                <td><%=dto.getRegtime() %></td>
            </tr>
            <tr>
                <th>조회수</th>
                <td><%=dto.getHits() %></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><%=dto.getContent() %></td>
            </tr>
        </table>

        <div class="btn-container">
            <button class="btn" onclick="location.href='list.jsp'">목록보기</button>
            <button class="btn" onclick="location.href='write2.jsp?num=<%=dto.getNum()%>'">수정</button>
            <button class="btn btn-secondary" onclick="location.href='delete.jsp?num=<%=dto.getNum()%>'">삭제</button>
        </div>
    </div>
</body>
</html>
