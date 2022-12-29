package com.kh_semi.servlet_with_db.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class JiyeongDB {
    /**
     * User테이블의 모든것을 가져오는 Function
     * 
     * @param getUser
     * @return
     * @throws SQLException
     */
    public ArrayList<HashMap> getUsers(String getUser) throws SQLException {

        Commons commons = new Commons();
        Statement statement = commons.getStatement();
        String query = "SELECT * FROM USER ";
        ResultSet resultSet = statement.executeQuery(query);

        ArrayList<HashMap> user_list = new ArrayList<HashMap>();

        while (resultSet.next()) {
            HashMap<String, Object> user = new HashMap<String, Object>();
            user.put("NAME", resultSet.getString("NAME"));
            user.put("USER_ID", resultSet.getString("USER_ID"));
            user.put("PASSWORD", resultSet.getString("PASSWORD"));
            user.put("PHONE_NUMBER", resultSet.getString("PHONE_NUMBER"));
            user.put("USER_EMAIL", resultSet.getString("USER_EMAIL"));
            user.put("ADDRESS", resultSet.getString("ADDRESS"));
            user.put("ADDRESSADD", resultSet.getString("ADDRESSADD"));

            user_list.add(user);

        }
        return user_list;

    }

}
