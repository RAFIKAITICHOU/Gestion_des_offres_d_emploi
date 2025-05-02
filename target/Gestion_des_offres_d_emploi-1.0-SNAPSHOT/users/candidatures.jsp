<%-- 
    Document   : candidatures
    Created on : 28 avr. 2025, 15:36:05
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
<%@ page import="entities.Candidature" %>
<%@ page import="entities.User" %>
<%
    User user = (User) session.getAttribute("currentUser");
    List<Candidature> candidatures = (List<Candidature>) request.getAttribute("candidatures");
%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Mes Candidatures</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">

        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10">

                    <div class="card shadow-sm">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">Mes Candidatures</h4>
                        </div>
                        <div class="card-body bg-white">

                            <div class="table-responsive">
                                <table class="table table-bordered align-middle mb-0">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Offre</th>
                                            <th>Date</th>
                                            <th>CV</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (Candidature c : candidatures) {%>
                                        <tr>
                                            <td><%= c.getOffre().getTitre()%></td>
                                            <td><%= new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm").format(c.getDate())%></td>
                                            <td>
                                                <a href="<%= c.getCvPath()%>" target="_blank" class="btn btn-outline-primary btn-sm">Voir le CV</a>
                                            </td>
                                            <td>
                                                <a href="CandidatureController?op=delete&candidat_id=<%= user.getId()%>&offre_id=<%= c.getOffre().getId()%>&date=<%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(c.getDate())%>"
                                                   class="btn btn-sm btn-danger"
                                                   onclick="return confirm('Supprimer cette candidature ?')">
                                                    Supprimer
                                                </a>
                                            </td>
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
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

