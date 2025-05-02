<%-- 
    Document   : users
    Created on : 17 avr. 2025, 13:59:38
    Author     : ichou
--%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="users.jsp">Accueil</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="offres.jsp">Offres</a></li>
                <li class="nav-item"><a class="nav-link" href="addOffre.jsp">Nouvelle Offre</a></li>
                <li class="nav-item"><a class="nav-link" href="candidatures.jsp">Candidatures</a></li>
                <li class="nav-item"><a class="nav-link" href="profile.jsp">Profil</a></li>
                <li class="nav-item"><a class="nav-link" href="statistiques.jsp">Statistiques</a></li>
                <li class="nav-item"><a class="nav-link text-warning" href="LogoutController">Déconnexion</a></li>
            </ul>
        </div>
    </div>
</nav>


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
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Bienvenue</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light d-flex justify-content-center align-items-center" style="min-height: 100vh;">

        <div class="card shadow p-4 text-center" style="max-width: 400px; width: 100%;">
            <h4 class="text-primary mb-3">Bienvenue, <%= user.getEmail()%> 👋</h4>
            <p class="text-muted">Vous êtes connecté avec succès.</p>
            <a href="<%= request.getContextPath()%>/LogoutController" class="btn btn-danger mt-3">Se déconnecter</a>
        </div>


        <footer class="bg-primary text-white text-center py-3 mt-5">
            <div class="container">
                <small>&copy; 2025 ichou_emploi • Tous droits réservés</small>
            </div>
        </footer>
    </body>
</html>
