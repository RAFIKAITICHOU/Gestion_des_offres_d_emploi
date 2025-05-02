<%-- 
    Document   : login
    Created on : 17 avr. 2025, 13:57:15
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
<%
    session = request.getSession(false);
    User user = (session != null) ? (User) session.getAttribute("currentUser") : null;

    if (user != null) {
        response.sendRedirect(request.getContextPath() + "/users/users.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Connexion</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light d-flex align-items-center justify-content-center" style="min-height: 100vh;">

        <div class="card shadow p-4" style="width: 100%; max-width: 400px;">
            <div class="card-body">
                <h3 class="card-title text-center mb-3">Connexion</h3>
                <p class="text-center text-muted">Veuillez vous connecter pour accéder à votre compte</p>

                <%
                    String error = (String) request.getAttribute("errorMessage");
                    if (error != null) {
                %>
                <div class="alert alert-danger text-center py-2">
                    <%= error%>
                </div>
                <%
                    }
                %>

                <form method="POST" action="${pageContext.request.contextPath}/LoginController">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email :</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Entrez votre email" required>
                    </div>

                    <div class="mb-3">
                        <label for="mdp" class="form-label">Mot de passe :</label>
                        <input type="password" class="form-control" id="mdp" name="mdp" placeholder="Entrez votre mot de passe" required>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Se connecter</button>
                    </div>
                </form>

                <div class="mt-4 text-center">
                    <span class="text-muted">Vous n'avez pas de compte ?</span>
                    <a href="${pageContext.request.contextPath}/users/register.jsp" class="text-decoration-none">S'inscrire</a>
                </div>
            </div>
        </div>


        <footer class="bg-primary text-white text-center py-3 mt-5">
            <div class="container">
                <small>&copy; 2025 ichou_emploi • Tous droits réservés</small>
            </div>
        </footer>
    </body>
</html>
