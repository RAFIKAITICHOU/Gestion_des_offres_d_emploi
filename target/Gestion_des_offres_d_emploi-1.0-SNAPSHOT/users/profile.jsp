<%-- 
    Document   : profile
    Created on : 28 avr. 2025, 15:37:49
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
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Profil utilisateur</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">

        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-6">

                    <div class="card shadow-sm">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">Mon Profil</h4>
                        </div>
                        <div class="card-body">

                            <div class="mb-3">
                                <label class="form-label">Nom :</label>
                                <div class="form-control"><%= user.getNom()%></div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email :</label>
                                <div class="form-control"><%= user.getEmail()%></div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Mot de passe :</label>
                                <div class="form-control"><%= user.getMotDePasse()%></div>
                            </div>

                            <div class="text-end">
                                <a href="LogoutController" class="btn btn-outline-danger">Se déconnecter</a>
                            </div>

                        </div>
                    </div>

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
