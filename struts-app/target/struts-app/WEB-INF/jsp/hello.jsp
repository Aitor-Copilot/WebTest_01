<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello Action - Struts 2</title>
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
            color: #4CAF50;
        }
        .message {
            background-color: #e8f5e9;
            padding: 20px;
            border-left: 4px solid #4CAF50;
            margin: 20px 0;
            font-size: 18px;
        }
        .form-container {
            margin-top: 30px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 4px;
        }
        input[type="text"] {
            padding: 10px;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin-left: 10px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
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
        <h1>Hello Action</h1>
        
        <div class="message">
            <s:property value="message"/>
        </div>
        
        <div class="form-container">
            <h3>Enter your name:</h3>
            <s:form action="hello" method="post">
                <s:textfield name="name" label="Name" placeholder="Enter your name"/>
                <s:submit value="Submit"/>
            </s:form>
        </div>
        
        <div class="back-link">
            <a href="index.action">← Back to Home</a>
        </div>
    </div>
</body>
</html>

