<%-- 
    Document   : candidatures
    Created on : 28 avr. 2025, 15:36:05
    Author     : ichou
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.Candidature" %>
<%@ page import="entities.User" %>
<%
    User user = (User) session.getAttribute("currentUser");
    List<Candidature> candidatures = (List<Candidature>) request.getAttribute("candidatures");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mes Candidatures</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <h2 class="mb-4">Mes Candidatures</h2>

            <table class="table table-bordered bg-white">
                <thead>
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
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Supprimer cette candidature ?')">Supprimer</a>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </body>
</html>
