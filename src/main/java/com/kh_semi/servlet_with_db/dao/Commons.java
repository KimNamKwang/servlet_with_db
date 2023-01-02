package com.kh_semi.servlet_with_db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Commons {
    public Statement getStatement() {
        String url = "jdbc:mysql://localhost:3306/health_club";
        String user = "root";        
        //String password = "1q2w3e4r!@#";
        String password = "*khacademy!";

        Statement statement = null;
        try {
            Connection connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();
            } catch (SQLException e) {
            e.printStackTrace();
            
        }
        return statement;
    }

    public String getGeneratorID() {
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyyhh:mm:ss");
        String strDate = formatter.format(date);
        return strDate;
    }
}
