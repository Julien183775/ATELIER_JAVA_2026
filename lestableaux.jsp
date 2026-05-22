<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les tableaux</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les tableaux</h1>
<form action="#" method="post">
    <p>Saisir au minimu 3 chiffres à la suite, exemple : 6 78 15 <input type="text" name="chaine"></p>
    <p><input type="submit" value="Afficher"></p>
</form>

<% String chaine = request.getParameter("chaine"); %>
<% if (chaine != null && !chaine.isEmpty()) { %>
    <% String[] tableauDeChiffres = chaine.split("\\s+"); %>

    <%-- Conversion String[] -> int[] une seule fois pour tous les exercices --%>
    <% int[] nombres = new int[tableauDeChiffres.length];
       for (int i = 0; i < tableauDeChiffres.length; i++) {
           nombres[i] = Integer.parseInt(tableauDeChiffres[i]);
       } %>

    <p>Le tableau contient <%= nombres.length %> valeurs<br/>
    Chiffre 1 : <%= nombres[0] %><br/>
    Chiffre 2 : <%= nombres[1] %><br/>
    Chiffre 3 : <%= nombres[2] %></p>

    <h2>Exercice 1 : Le carré de la première valeur</h2>
    <p><%= nombres[0] %>² = <%= nombres[0] * nombres[0] %></p>

    <h2>Exercice 2 : La somme des 2 premières valeurs</h2>
    <p>Somme : <%= nombres[0] + nombres[1] %></p>

    <h2>Exercice 3 : La somme de toutes les valeurs</h2>
    <% int somme = 0;
       for (int i = 0; i < nombres.length; i++) {
           somme += nombres[i];
       } %>
    <p>Somme totale : <%= somme %></p>

    <h2>Exercice 4 : La valeur maximum</h2>
    <%-- On part du principe que le premier élément est le max, puis on vérifie les suivants --%>
    <% int max = nombres[0];
       for (int i = 1; i < nombres.length; i++) {
           if (nombres[i] > max) max = nombres[i];
       } %>
    <p>Valeur maximum : <%= max %></p>

    <h2>Exercice 5 : La valeur minimale</h2>
    <% int min = nombres[0];
       for (int i = 1; i < nombres.length; i++) {
           if (nombres[i] < min) min = nombres[i];
       } %>
    <p>Valeur minimum : <%= min %></p>

    <h2>Exercice 6 : La valeur la plus proche de 0</h2>
    <%-- Math.abs() donne la valeur absolue : Math.abs(-5) = 5, Math.abs(3) = 3 --%>
    <% int plusProche = nombres[0];
       for (int i = 1; i < nombres.length; i++) {
           if (Math.abs(nombres[i]) < Math.abs(plusProche)) {
               plusProche = nombres[i];
           }
       } %>
    <p>Valeur la plus proche de 0 : <%= plusProche %></p>

    <h2>Exercice 7 : La valeur la plus proche de 0 (2° version)</h2>
    <%-- En cas d'égalité (ex: -3 et 3), on garde le positif --%>
    <% int plusProche2 = nombres[0];
       for (int i = 1; i < nombres.length; i++) {
           int absActuel = Math.abs(nombres[i]);
           int absProche = Math.abs(plusProche2);
           if (absActuel < absProche || (absActuel == absProche && nombres[i] > 0)) {
               plusProche2 = nombres[i];
           }
       } %>
    <p>Valeur la plus proche de 0 (v2) : <%= plusProche2 %></p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
