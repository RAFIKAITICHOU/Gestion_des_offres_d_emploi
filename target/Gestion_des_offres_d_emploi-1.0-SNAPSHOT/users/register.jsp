<%-- 
    Document   : register
    Created on : 17 avr. 2025, 14:09:23
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
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Créer un compte</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light d-flex align-items-center justify-content-center" style="min-height: 100vh;">

        <div class="card shadow p-4" style="width: 100%; max-width: 500px;">
            <h3 class="card-title text-center mb-3">Créer un compte</h3>

            <%
                String success = request.getParameter("success");
                String error = request.getParameter("error");
                if ("1".equals(success)) {
            %>
            <div class="alert alert-success text-center py-2">Inscription réussie !</div>
            <% } else if ("1".equals(error)) { %>
            <div class="alert alert-danger text-center py-2">Une erreur est survenue lors de l'inscription.</div>
            <% }%>

            <form method="POST" action="../UserController">
                <div class="mb-3">
                    <label for="nom" class="form-label">Nom :</label>
                    <input type="text" class="form-control" id="nom" name="nom" placeholder="Entrez votre nom" required>
                </div>

                <div class="mb-3">
                    <label for="prenom" class="form-label">Prénom :</label>
                    <input type="text" class="form-control" id="prenom" name="prenom" placeholder="Entrez votre prénom" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email :</label>
                    <input type="text" class="form-control" id="email" name="email" placeholder="Entrez votre email" required>
                </div>

                <div class="mb-4">
                    <label for="mdp" class="form-label">Mot de passe :</label>
                    <input type="password" class="form-control" id="mdp" name="motDePasse" placeholder="Entrez votre mot de passe" required>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">S'inscrire</button>
                </div>
            </form>

            <div class="text-center mt-3">
                <small class="text-muted">Déjà inscrit ?</small>
                <a href="login.jsp" class="text-decoration-none">Se connecter</a>
            </div>
        </div>


        <footer class="bg-primary text-white text-center py-3 mt-5">
            <div class="container">
                <small>&copy; 2025 ichou_emploi • Tous droits réservés</small>
            </div>
        </footer>
    </body>
</html>


