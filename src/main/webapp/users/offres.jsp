<%-- 
    Document   : offres
    Created on : 28 avr. 2025, 15:32:05
    Author     : ichou
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.Offre" %>
<%
    List<Offre> offres = (List<Offre>) request.getAttribute("offres");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Offres d'emploi</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4">Liste des offres d'emploi</h2>
    <a href="addOffre.jsp" class="btn btn-primary mb-3">+ Nouvelle offre</a>

    <table class="table table-bordered bg-white">
        <thead>
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
        <% for (Offre o : offres) { %>
            <tr>
                <td><%= o.getId() %></td>
                <td><%= o.getTitre() %></td>
                <td><%= o.getDescription() %></td>
                <td><%= o.getSalaire() %> MAD</td>
                <td><%= o.getTypeContrat() %></td>
                <td><%= o.getEntreprise().getNom() %></td>
                <td>
                    <a href="OffreController?op=update&id=<%= o.getId() %>" class="btn btn-sm btn-warning">Modifier</a>
                    <a href="OffreController?op=delete&id=<%= o.getId() %>" class="btn btn-sm btn-danger"
                       onclick="return confirm('Supprimer cette offre ?')">Supprimer</a>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>

