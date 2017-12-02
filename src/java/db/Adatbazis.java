/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;
import java.sql.*;

/**
 *
 * @author 212578288
 */
 public class Adatbazis {
            String URL ="jdbc:mysql://sql11.freemysqlhosting.net:3306/sql11207547?zeroDateTimeBehavior=convertToNull";
            String USERNAME= "sql11207547";
            String PASSWORD="MtzG9Ckz7L";
            
            Connection connection = null;
            PreparedStatement lekerdezes=null;
            ResultSet ResultSet = null ;
            
            public Adatbazis(){
                try{ 
                    connection= DriverManager.getConnection(URL,USERNAME,PASSWORD);
                    }
                catch (SQLException e){
                    e.printStackTrace();
                    }
             }
             public void setLekerdezes (String lekerdezes) throws SQLException {
                    this.lekerdezes= connection.prepareStatement(lekerdezes);
             }
             public ResultSet getAdatbazis(){
                try {
                    ResultSet=lekerdezes.executeQuery();
                    }
                catch (SQLException e){
                    }
                 return ResultSet;
                }
                    
            }
            /*Actor actor = new Actor();
            ResultSet actors =actor.getActors();*/