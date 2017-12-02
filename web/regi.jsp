<%-- 
    Document   : regi
    Created on : 2017.11.23., 15:56:07
    Author     : Emeske
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <html>
            <head>
                <title>Bejelentkezés</title>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="stylesheet" href= "style.css" type="text/css">
            </head>
            <body>
                <div class="login2">
                <div class="login">
                    <h1>Regisztráció</h1>
                    <form action="login.jsp" method="post">
                        <input class="logbe" name="username" type="text" placeholder="Felhasználónév" id="username" size="35">
                        <br/>
                        <input class="logbe" name="password" type="password" placeholder="Jelszó" id="password" size="35">
                        <br><br>
                        <input class="gomb" type="submit" value="Regisztráció" id="button" size="35">
                        <br>
                         <% if (request.getParameter("error")!=null) {%><%= request.getParameter("error") %><%}%>
                    </form>
                    <br>
                </div>	
                </div>   
            </body>
        </html>