<%-- 
    Document   : register
    Created on : 17 avr. 2025, 14:09:23
    Author     : ichou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Créer un compte</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Styles identiques à ton exemple */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        fieldset {
            border: none;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 100%;
            max-width: 500px;
        }

        legend {
            font-size: 24px;
            font-weight: 600;
            color: #333;
            padding: 0 10px;
            margin-bottom: 20px;
            position: relative;
        }

        legend::after {
            content: '';
            display: block;
            width: 50px;
            height: 3px;
            background-color: #4a6fdc;
            margin-top: 8px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 12px 0;
            vertical-align: top;
        }

        td:first-child {
            width: 120px;
            font-weight: 500;
            color: #555;
            padding-top: 20px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #4a6fdc;
            box-shadow: 0 0 0 3px rgba(74, 111, 220, 0.2);
            outline: none;
        }

        input[type="submit"] {
            background-color: #4a6fdc;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 12px 25px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 10px;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #3a5fc8;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #666;
        }

        .login-link a {
            color: #4a6fdc;
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .message {
            text-align: center;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .message.success {
            color: green;
        }

        .message.error {
            color: red;
        }

        @media (max-width: 600px) {
            fieldset {
                padding: 20px;
            }

            td:first-child {
                display: block;
                width: 100%;
                padding-top: 0;
                padding-bottom: 5px;
            }

            td {
                display: block;
                padding: 5px 0;
            }
        }
    </style>
</head>
<body>
    <fieldset>
        <legend>Créer un compte</legend>

        <%-- succès ou d’erreur --%>
        <%
            String success = request.getParameter("success");
            String error = request.getParameter("error");
            if ("1".equals(success)) {
        %>
            <div class="message success">Inscription réussie !</div>
        <% } else if ("1".equals(error)) { %>
            <div class="message error">Une erreur est survenue lors de l'inscription.</div>
        <% } %>

        <form method="POST" action="../UserController">
            <table>
                <tr>
                    <td><label for="nom">Nom :</label></td>
                    <td><input type="text" id="nom" name="nom" placeholder="Entrez votre nom" required /></td>
                </tr>

                <tr>
                    <td><label for="prenom">Prénom :</label></td>
                    <td><input type="text" id="prenom" name="prenom" placeholder="Entrez votre prénom" required /></td>
                </tr>

                <tr>
                    <td><label for="email">Email :</label></td>
                    <td><input type="text" id="email" name="email" placeholder="Entrez votre email" required /></td>
                </tr>

                <tr>
                    <td><label for="mdp">Mot de passe :</label></td>
                    <td><input type="password" id="mdp" name="motDePasse" placeholder="Entrez votre mot de passe" required /></td>
                </tr>

                <tr>
                    <td></td>
                    <td><input type="submit" value="S'inscrire" /></td>
                </tr>
            </table>
        </form>

        <div class="login-link">
            Déjà inscrit ? <a href="login.jsp">Se connecter</a>
        </div>
    </fieldset>
</body>
</html>


