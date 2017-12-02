<%-- 
    Document   : index
    Created on : 2017.11.27., 14:38:25
    Author     : Atee
--%>
<%@page import="java.sql.*" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adatbázis betöltése</title>
    </head>
    <body>
        <h1>Hello World!</h1>
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
                        "SELECT id,nev,email FROM felhasznalok"
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
                        <td>Id</td>
                        <td>Név</td>
                        <td>Email</td>
                    </tr>
                    <% while (actors.next()) { %>
                        <tr>
                            <td><%= actors.getString("id") %></td>
                            <td><%= actors.getString("nev") %></td>
                            <td><%= actors.getString("email") %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

            
    </body>
</html>