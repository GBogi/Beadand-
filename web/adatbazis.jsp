<%-- 
    Document   : adatbazis
    Created on : Nov 28, 2017, 7:34:53 PM
    Author     : 212578288
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <sql:setDataSource
                    var="Users"
                    driver="org.apache.derby.jdbc.ClientDriver"
                    url="jdbc:derby://localhost:1527/Users"
                    scope="session"
                    dataSource="Users"
                    user="admiin"
                    password="admin"
         />
         <sql:query var="lekerdezes" dataSource="${Users}">
            SELECT * FROM users
        </sql:query>
            
        
    </body>
</html>
