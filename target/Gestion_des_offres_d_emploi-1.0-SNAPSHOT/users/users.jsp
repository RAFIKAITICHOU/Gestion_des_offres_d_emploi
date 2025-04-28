<%-- 
    Document   : users
    Created on : 17 avr. 2025, 13:59:38
    Author     : ichou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.User"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%
     session = request.getSession(false);
    User user = null;

    if (session != null) {
        user = (User) session.getAttribute("currentUser");
    }

    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/users/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bienvenue</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e8f0fe;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .welcome-box {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            text-align: center;
        }

        .welcome-box h2 {
            margin-bottom: 20px;
            color: #4a6fdc;
        }

        .logout-link {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #4a6fdc;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .logout-link:hover {
            background-color: #3a5fc8;
        }
    </style>
</head>
<body>
    <div class="welcome-box">
        <h2>Bienvenue, <%= user.getEmail() %> 👋</h2>
        <p>Vous êtes connecté avec succès.</p>
        <a href="<%= request.getContextPath() %>/LogoutController" class="logout-link">Se déconnecter</a>
    </div>
</body>
</html>
