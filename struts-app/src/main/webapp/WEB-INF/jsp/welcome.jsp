<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - Struts 2</title>
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
            color: #2196F3;
        }
        .message {
            background-color: #e3f2fd;
            padding: 20px;
            border-left: 4px solid #2196F3;
            margin: 20px 0;
            font-size: 18px;
        }
        .back-link {
            margin-top: 20px;
        }
        .back-link a {
            color: #2196F3;
            text-decoration: none;
        }
        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome Page</h1>
        
        <div class="message">
            <s:property value="welcomeMessage"/>
        </div>
        
        <p>This page demonstrates a simple Struts 2 action that displays a welcome message.</p>
        
        <div class="back-link">
            <a href="<s:url action=''/>">← Back to Home</a>
        </div>
    </div>
</body>
</html>

