<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : check
    Created on : Nov 28, 2017, 8:18:40 PM
    Author     : 212578288
--%>
<%@page import="java.sql.*" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bejelentkeztető rendszer - ellenőrzés</title>
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
                        "SELECT felhasznalonev,jelszo FROM users where "
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
        
    <sql:query var="lekerdezes" dataSource="${Users}">
        SELECT * FROM users where username='${param.username}' and jelszo='${param.password}'
    </sql:query>

    <c:choose>
        <c:when test="${lekerdezes.rowCount ne 0}">
            <jsp:forward page="main.jsp"/>
        </c:when>
        <c:otherwise>
            <jsp:forward page="szavaz.jsp">
                <jsp:param name="errormsg" value="Hibás jelszó/vagy felhasználói név"/>
            </jsp:forward>
        </c:otherwise>
    </c:choose>
    </body>
</html>

