<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
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
            max-width: 700px;
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
        }
        td {
            text-align: left;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        textarea {
            resize: vertical;
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
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>글쓰기</h2>
        <form method="post" action="insert.jsp">
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" maxlength="80" required>
            </div>
            <div class="form-group">
                <label for="writer">작성자</label>
                <input type="text" id="writer" name="writer" maxlength="20" required>
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content" rows="10" required></textarea>
            </div>
            <div class="btn-container">
                <button type="submit" class="btn">저장</button>
                <button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
            </div>
        </form>
    </div>
</body>
</html>
