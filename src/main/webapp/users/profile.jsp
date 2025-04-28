<%-- 
    Document   : profile
    Created on : 28 avr. 2025, 15:37:49
    Author     : ichou
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="entities.User" %>
<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Profil utilisateur</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <h2 class="mb-4">Mon Profil</h2>

            <div class="card p-4 shadow-sm">
                <div class="mb-3">
                    <label class="form-label"><strong>Nom</strong></label>
                    <div class="form-control"><%= user.getNom()%></div>
                </div>

                <div class="mb-3">
                    <label class="form-label"><strong>Email</strong></label>
                    <div class="form-control"><%= user.getEmail()%></div>
                </div>

                <div class="mb-3">
                    <label class="form-label"><strong>Mot de passe</strong></label>
                    <div class="form-control"><%= user.getMotDePasse()%></div>
                </div>

                <a href="LogoutController" class="btn btn-outline-danger">Se déconnecter</a>
            </div>
        </div>
    </body>
</html>
