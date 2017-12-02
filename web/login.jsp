<%-- 
Document   : login
Created on : 2017.11.23., 14:24:10
Author     : Emeske
--%>
<%@page import="java.sql.*" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <html>
        <head>
            <title>Bejelentkezés</title>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href= "style.css" type="text/css">

        </head>

        <body>
            <%! 
    public class Actor {
        String URL ="jdbc:mysql://sql11.freemysqlhosting.net:3306/sql11207547?zeroDateTimeBehavior=convertToNull";
        String USERNAME= "sql11207547";
        String PASSWORD="MtzG9Ckz7L";

        Connection connection = null;
        PreparedStatement lekerdezes=null;
        ResultSet ResultSet = null ;

        public Actor(){
            try{ 
                connection= DriverManager.getConnection(URL,USERNAME,PASSWORD);
                lekerdezes= connection.prepareStatement(
                    "SELECT felhasznalonev,jelszo FROM users"
                    );
                }
            catch (SQLException e){
                e.printStackTrace();
                }
         }
         public ResultSet getActors(){
            try {
                ResultSet=lekerdezes.executeQuery();
                }
            catch (SQLException e){
                e.printStackTrace();
                }
             return ResultSet;
            }

        }
        %>
        <%
        Actor actor = new Actor();
        ResultSet actors =actor.getActors();
        %>
        <table border="1">
            <tbody>
                <tr>
                    <td>Felhasznal</td>
                    <td>Jelszo</td>
                </tr>
                <% while (actors.next()) { %>
                    <tr>
                        <td><%= actors.getString("felhasznalonev") %></td>
                        <td><%= actors.getString("jelszo") %></td>
                 if (${param.felhasznalonev} )
                {



                        }%>
                    </tr>
                <% } %>
            </tbody>
        </table>    


            <div class="login2">
            <div class="login">
                <h1>Bejelentkezés </h1>
                 <c:if test="${!empty param.errormsg}">
                        <font color="red">${errormsg}</font>
                </c:if>
                <form action="check.jsp" method="post">
                    <input class="logbe" name="username" type="text" placeholder="Felhasználónév" id="username" size="35">
                    <br><br>
                    <input class="logbe" name="password" type="password" placeholder="Jelszó" id="password" size="35">
                    <br><br>
                    <input class="gomb" type="submit" value="Bejelentkezés" id="button" size="35">
                    <br>

                </form>
                <br>
                <p class="reggelj"> Ha még nem regisztráltál, itt megteheted!<br> <br>  <a href="regi.jsp">Regisztráció</a></p>
            </div>	
            </div>   
        </body>
    </html>
