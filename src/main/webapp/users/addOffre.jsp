<%-- 
    Document   : addOffre
    Created on : 28 avr. 2025, 15:32:58
    Author     : ichou
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.Entreprise" %>
<%
    List<Entreprise> entreprises = (List<Entreprise>) request.getAttribute("entreprises");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ajouter une offre</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <h2 class="mb-4">Ajouter ou modifier une offre</h2>

            <form method="post" action="OffreController" class="bg-white p-4 rounded shadow-sm">
                <input type="hidden" name="id" value="<%= request.getParameter("id") != null ? request.getParameter("id") : ""%>">

                <div class="mb-3">
                    <label class="form-label">Titre</label>
                    <input type="text" class="form-control" name="titre" required value="<%= request.getParameter("titre") != null ? request.getParameter("titre") : ""%>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <textarea class="form-control" name="description" required><%= request.getParameter("description") != null ? request.getParameter("description") : ""%></textarea>
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

                <div class="mb-3">
                    <label class="form-label">Entreprise</label>
                    <select name="entreprise_id" class="form-select" required>
                        <option value="">-- Sélectionner --</option>
                        <% for (Entreprise e : entreprises) {%>
                        <option value="<%= e.getId()%>"
                                <%= (request.getParameter("entreprise_id") != null
                                        && request.getParameter("entreprise_id").equals(String.valueOf(e.getId()))) ? "selected" : ""%>>
                            <%= e.getNom()%>
                        </option>
                        <% }%>
                    </select>
                </div>

                <button type="submit" class="btn btn-success">Enregistrer</button>
                <a href="OffreController" class="btn btn-secondary">Retour</a>
            </form>
        </div>
    </body>
</html>
