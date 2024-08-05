<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
    <title>j\Join Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .join-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .join-container h2 {
            margin-bottom: 20px;
        }
        .join-container input {
            width: 95%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .join-container button {
            width: 100%;
            padding: 10px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
 <div class="join-container">
        <h2>회원가입</h2>

<form action="member_join.jsp" method="post">
    <input type="text" name="id" placeholder="Id" required>
    <input type="password" name="password" placeholder="Password" required>
    <input type="text" name="name" placeholder="Name" required>
    <input type="text" name="tel" placeholder="Tel" required>
    <input type="text" name="team" placeholder="Team" required>
    <button type="submit">Join</button>
</body>
</html>
