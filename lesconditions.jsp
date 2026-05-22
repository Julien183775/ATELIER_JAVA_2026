<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir A : <input type="text" name="valeur1"></p>
    <p>Saisir B : <input type="text" name="valeur2"></p>
    <p>Saisir C : <input type="text" name="valeur3"></p>
    <p><input type="submit" value="Afficher"></p>
</form>

<%-- Récupération des valeurs --%>
<% String valeur1 = request.getParameter("valeur1"); %>
<% String valeur2 = request.getParameter("valeur2"); %>
<% String valeur3 = request.getParameter("valeur3"); %>

<%-- On vérifie que les champs ne sont pas vides (isEmpty évite le plantage si l'utilisateur soumet sans rien saisir) --%>
<% if (valeur1 != null && !valeur1.isEmpty() && valeur2 != null && !valeur2.isEmpty()) { %>
    <% int A = Integer.parseInt(valeur1); %>
    <% int B = Integer.parseInt(valeur2); %>

    <%-- Comparaison de base --%>
    <% if (A > B) { %>
        <p>A est supérieure à B.</p>
    <% } else if (A < B) { %>
        <p>A est inférieure à B.</p>
    <% } else { %>
        <p>A est égale à B.</p>
    <% } %>

    <h2>Exercice 1 : Comparaison</h2>
    <% if (valeur3 != null && !valeur3.isEmpty()) { %>
        <% int C = Integer.parseInt(valeur3); %>
        <%-- Les deux cas : A < C < B  OU  B < C < A  (si l'utilisateur met A > B) --%>
        <% if ((C > A && C < B) || (C > B && C < A)) { %>
            <p>Oui, C est compris entre A et B.</p>
        <% } else { %>
            <p>Non, C n'est pas compris entre A et B.</p>
        <% } %>
    <% } %>

    <h2>Exercice 2 : Pair ou Impair ?</h2>
    <%-- % est le modulo : A % 2 donne le reste de la division par 2 --%>
    <% if (A % 2 == 0) { %>
        <p><%= A %> est pair.</p>
    <% } else { %>
        <p><%= A %> est impair.</p>
    <% } %>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
