<%-- 
    Document   : offres
    Created on : 28 avr. 2025, 15:32:05
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


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.Offre" %>
<%
    List<Offre> offres = (List<Offre>) request.getAttribute("offres");
%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Offres d'emploi</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">

        <div class="container py-5">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="mb-0">Liste des offres d'emploi</h3>
                <a href="addOffre.jsp" class="btn btn-primary">+ Nouvelle offre</a>
            </div>

            <div class="card shadow-sm">
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Titre</th>
                                    <th>Description</th>
                                    <th>Salaire</th>
                                    <th>Type Contrat</th>
                                    <th>Entreprise</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Offre o : offres) {%>
                                <tr>
                                    <td><%= o.getId()%></td>
                                    <td><%= o.getTitre()%></td>
                                    <td><%= o.getDescription()%></td>
                                    <td><%= o.getSalaire()%> MAD</td>
                                    <td><%= o.getTypeContrat()%></td>
                                    <td><%= o.getEntreprise().getNom()%></td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <a href="OffreController?op=update&id=<%= o.getId()%>" class="btn btn-sm btn-warning">Modifier</a>
                                            <a href="OffreController?op=delete&id=<%= o.getId()%>" class="btn btn-sm btn-danger"
                                               onclick="return confirm('Supprimer cette offre ?')">Supprimer</a>
                                        </div>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
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
