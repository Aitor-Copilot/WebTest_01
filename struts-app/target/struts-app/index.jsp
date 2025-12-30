<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Struts 2 Application - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            border-bottom: 3px solid #4CAF50;
            padding-bottom: 10px;
        }
        .menu {
            margin-top: 30px;
        }
        .menu a {
            display: inline-block;
            margin: 10px 15px 10px 0;
            padding: 12px 24px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .menu a:hover {
            background-color: #45a049;
        }
        .info {
            background-color: #e7f3ff;
            padding: 15px;
            border-left: 4px solid #2196F3;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Struts 2 Application</h1>
        <p>This is a simple Struts 2 web application built with Maven.</p>
        
        <div class="info">
            <strong>Application Information:</strong><br>
            <ul>
                <li>Framework: Apache Struts 7.1.1</li>
                <li>Build Tool: Maven 3.9.12</li>
                <li>Java Version: 25.0.1</li>
                <li>Servlet API: Jakarta EE 6.0</li>
            </ul>
        </div>
        
        <div class="menu">
            <h2>Available Actions:</h2>
            <a href="welcome.action">Welcome Page</a>
            <a href="hello.action">Hello Action</a>
            <a href="hello.action?name=Struts">Hello with Name</a>
        </div>
    </div>
</body>
</html>

