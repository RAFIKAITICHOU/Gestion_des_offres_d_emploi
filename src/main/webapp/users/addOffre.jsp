<%-- 
    Document   : addOffre
    Created on : 28 avr. 2025, 15:32:58
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
<%@ page import="entities.Entreprise" %>
<%
    List<Entreprise> entreprises = (List<Entreprise>) request.getAttribute("entreprises");
%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Ajouter une offre</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">

        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">

                    <div class="card shadow-sm">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">Ajouter ou modifier une offre</h4>
                        </div>
                        <div class="card-body bg-white">

                            <form method="post" action="OffreController">
                                <input type="hidden" name="id" value="<%= request.getParameter("id") != null ? request.getParameter("id") : ""%>">

                                <div class="mb-3">
                                    <label class="form-label">Titre</label>
                                    <input type="text" class="form-control" name="titre" required value="<%= request.getParameter("titre") != null ? request.getParameter("titre") : ""%>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Description</label>
                                    <textarea class="form-control" name="description" rows="4" required><%= request.getParameter("description") != null ? request.getParameter("description") : ""%></textarea>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Salaire (MAD)</label>
                                    <input type="number" class="form-control" name="salaire" required value="<%= request.getParameter("salaire") != null ? request.getParameter("salaire") : ""%>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Type de contrat</label>
                                    <select name="typeContrat" class="form-select" required>
                                        <option value="">-- Choisir --</option>
                                        <option value="CDI" <%= "CDI".equals(request.getParameter("typeContrat")) ? "selected" : ""%>>CDI</option>
                                        <option value="CDD" <%= "CDD".equals(request.getParameter("typeContrat")) ? "selected" : ""%>>CDD</option>
                                        <option value="Stage" <%= "Stage".equals(request.getParameter("typeContrat")) ? "selected" : ""%>>Stage</option>
                                    </select>
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Entreprise</label>
                                    <select name="entreprise_id" class="form-select" required>
                                        <option value="">-- Sélectionner --</option>
                                        <% for (Entreprise e : entreprises) {%>
                                        <option value="<%= e.getId()%>" <%= (request.getParameter("entreprise_id") != null && request.getParameter("entreprise_id").equals(String.valueOf(e.getId()))) ? "selected" : ""%>>
                                            <%= e.getNom()%>
                                        </option>
                                        <% }%>
                                    </select>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <a href="OffreController" class="btn btn-outline-secondary">Retour</a>
                                    <button type="submit" class="btn btn-success">Enregistrer</button>
                                </div>
                            </form>

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

