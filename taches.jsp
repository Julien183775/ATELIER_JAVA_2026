<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mypackage.Task"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
    <title>Gestion des tâches</title>
</head>
<body bgcolor="white">

<h1>Gestionnaire de tâches</h1>

<%-- Récupération de la liste stockée en session par TaskServlet --%>
<%
    ArrayList<Task> taches = (ArrayList<Task>) session.getAttribute("taches");
    if (taches == null) {
        taches = new ArrayList<Task>();
    }
%>

<h2>Ajouter une tâche</h2>
<form action="tasks" method="post">
    <input type="hidden" name="action" value="ajouter">
    <p>Titre : <input type="text" name="titre" required></p>
    <p>Description : <input type="text" name="description" required></p>
    <p>Date d'échéance : <input type="date" name="dateEcheance" required></p>
    <p><input type="submit" value="Ajouter"></p>
</form>

<h2>Liste des tâches (<%= taches.size() %> tâche(s))</h2>

<% if (taches.isEmpty()) { %>
    <p>Aucune tâche pour le moment.</p>
<% } else { %>
    <% for (int i = 0; i < taches.size(); i++) {
           Task t = taches.get(i); %>
        <p>
            <strong><%= t.getTitre() %></strong>
            — <%= t.getDescription() %>
            | Échéance : <%= t.getDateEcheance() %>
            | Statut : <%= t.isTerminee() ? "✅ Terminée" : "⏳ En cours" %>

            <form action="tasks" method="post" style="display:inline">
                <input type="hidden" name="action" value="supprimer">
                <input type="hidden" name="index" value="<%= i %>">
                <input type="submit" value="Supprimer">
            </form>

            <% if (!t.isTerminee()) { %>
                <form action="tasks" method="post" style="display:inline">
                    <input type="hidden" name="action" value="terminer">
                    <input type="hidden" name="index" value="<%= i %>">
                    <input type="submit" value="Marquer terminée">
                </form>
            <% } %>
        </p>
    <% } %>
<% } %>

<p><a href="index.html">Retour au sommaire</a></p>

</body>
</html>
