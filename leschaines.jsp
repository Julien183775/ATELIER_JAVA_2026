<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les chaines</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les chaines de charactères</h1>
<form action="#" method="post">
    <p>Saisir une chaine (Du texte avec 6 caractères minimum) : <input type="text" name="chaine"></p>
    <p><input type="submit" value="Afficher"></p>
</form>

<% String chaine = request.getParameter("chaine"); %>
<% if (chaine != null && !chaine.isEmpty()) { %>
    <% int longueurChaine = chaine.length(); %>
    <p>La longueur de votre chaîne est de <%= longueurChaine %> caractères</p>
    <% char caractereExtrait = chaine.charAt(2); %>
    <p>Le 3° caractère de votre chaine est la lettre <%= caractereExtrait %></p>
    <% String sousChaine = chaine.substring(2, 6); %>
    <p>Une sous chaine de votre texte : <%= sousChaine %></p>
    <% int position = chaine.indexOf('e'); %>
    <p>Votre premier "e" est en : <%= position %></p>

    <h2>Exercice 1 : Combien de 'e' ?</h2>
    <% int compteurE = 0;
       for (int i = 0; i < longueurChaine; i++) {
           if (chaine.charAt(i) == 'e') compteurE++;
       } %>
    <p>Nombre de 'e' : <%= compteurE %></p>

    <h2>Exercice 2 : Affichage vertical</h2>
    <% for (int i = 0; i < longueurChaine; i++) { %>
        <%= chaine.charAt(i) %><br/>
    <% } %>

    <h2>Exercice 3 : Retour à la ligne</h2>
    <%-- split(" ") découpe la chaîne à chaque espace et retourne un tableau de mots --%>
    <% String[] mots = chaine.split(" ");
       for (String mot : mots) { %>
        <%= mot %><br/>
    <% } %>

    <h2>Exercice 4 : Une lettre sur deux</h2>
    <%-- i += 2 : on saute un caractère sur deux (indices 0, 2, 4...) --%>
    <% for (int i = 0; i < longueurChaine; i += 2) { %>
        <%= chaine.charAt(i) %>
    <% } %>

    <h2>Exercice 5 : En verlan</h2>
    <%-- On construit le résultat dans un StringBuilder puis on l'affiche d'un coup --%>
    <% String[] motsVerlan = chaine.split(" ");
       StringBuilder resultat = new StringBuilder();
       for (int i = motsVerlan.length - 1; i >= 0; i--) {
           resultat.append(new StringBuilder(motsVerlan[i]).reverse().toString());
           if (i > 0) resultat.append(" ");
       } %>
    <p><%= resultat.toString() %></p>

    <h2>Exercice 6 : Consonnes et voyelles</h2>
    <%-- Character.isLetter() ignore les espaces et la ponctuation --%>
    <% String voyelles = "aeiouyAEIOUY";
       int nbVoyelles = 0, nbConsonnes = 0;
       for (int i = 0; i < longueurChaine; i++) {
           char c = chaine.charAt(i);
           if (Character.isLetter(c)) {
               if (voyelles.indexOf(c) >= 0) nbVoyelles++;
               else nbConsonnes++;
           }
       } %>
    <p>Voyelles : <%= nbVoyelles %></p>
    <p>Consonnes : <%= nbConsonnes %></p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
