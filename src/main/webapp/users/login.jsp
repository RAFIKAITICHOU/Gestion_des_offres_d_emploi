<%-- 
    Document   : login
    Created on : 17 avr. 2025, 13:57:15
    Author     : ichou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.User"%>
<%
    session = request.getSession(false);
    User user = (session != null) ? (User) session.getAttribute("currentUser") : null;

    if (user != null) {
        response.sendRedirect(request.getContextPath() + "/users/users.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            background-color: #f5f5f5; display: flex; justify-content: center;
            align-items: center; min-height: 100vh; padding: 20px;
        }
        .login-container {
            background-color: white; border-radius: 10px; padding: 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1); width: 100%; max-width: 400px;
        }
        .login-header { text-align: center; margin-bottom: 30px; }
        .login-header h1 { font-size: 24px; color: #333; margin-bottom: 10px; }
        .login-header p { color: #666; font-size: 14px; }
        .login-header::after {
            content: ''; width: 50px; height: 3px; background-color: #4a6fdc;
            display: block; margin: 15px auto 0;
        }
        form, table { width: 100%; }
        td { padding: 8px 0; }
        label { margin-bottom: 6px; font-weight: 500; color: #555; font-size: 15px; }
        input[type="email"], input[type="password"] {
            width: 100%; padding: 12px 15px; border: 1px solid #ddd;
            border-radius: 6px; font-size: 16px; margin-bottom: 15px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        input[type="email"]:focus, input[type="password"]:focus {
            border-color: #4a6fdc; box-shadow: 0 0 0 3px rgba(74,111,220,0.2); outline: none;
        }
        input[type="submit"] {
            background-color: #4a6fdc; color: white; border: none; border-radius: 6px;
            padding: 14px 20px; font-size: 16px; cursor: pointer; width: 100%;
            transition: background-color 0.3s; margin-top: 10px;
        }
        input[type="submit"]:hover { background-color: #3a5fc8; }
        .register-link { text-align: center; margin-top: 20px; font-size: 14px; color: #666; }
        .register-link a { color: #4a6fdc; text-decoration: none; }
        .register-link a:hover { text-decoration: underline; }
        .error-message { color: red; text-align: center; margin-bottom: 15px; font-size: 14px; }
        @media (max-width:480px) { .login-container { padding: 20px; } }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h1>Connexion</h1>
            <p>Veuillez vous connecter pour accéder à votre compte</p>
        </div>

        <% 
            String error = (String) request.getAttribute("errorMessage");
            if (error != null) {
        %>
            <div class="error-message"><%= error %></div>
        <%
            }
        %>

        <form method="POST" action="${pageContext.request.contextPath}/LoginController">
            <table>
                <tr>
                    <td>
                        <label for="email">Email :</label>
                        <input type="email" id="email" name="email" placeholder="Entrez votre email" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="mdp">Mot de passe :</label>
                        <input type="password" id="mdp" name="mdp" placeholder="Entrez votre mot de passe" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Se connecter"/>
                    </td>
                </tr>
            </table>
        </form>

        <div class="register-link">
            Vous n'avez pas de compte ? <a href="${pageContext.request.contextPath}/users/register.jsp">S'inscrire</a>
        </div>
    </div>
</body>
</html>
