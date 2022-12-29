package com.kh_semi.servlet_with_db.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class UserWithDB {
    /* Question가져오는 Function */
    public HashMap<String, Object> getUser(String USER_ID) throws SQLException {

        // DB로그인을 위해 인스턴스화
        Commons commons = new Commons();
        // 쿼리문을 넣기 위해 Statement 가져옴
        Statement statement = commons.getStatement();

        // parameter로 들어오는 name 로 대상을 찾는 쿼리
        String query = "SELECT * FROM USER WHERE USER_ID ='" + USER_ID + "';";

        // String queryForAnswersList = "SELECT * FROM EXAMPLE_LIST WHERE EXAMPLE_UID IN
        // (SELECT EXAMPLE_UID FROM ANSWERS WHERE QUESTIONS_UID = 'Q1')";

        ResultSet resultSet = statement.executeQuery(query);
        // ResultSet resultSetForAnswersList =
        // statement.executeQuery(queryForAnswersList);

        // DB에서 받아온 결과를 HashMap으로 받음.
        HashMap<String, Object> result = null;

        while (resultSet.next()) {
            result = new HashMap<>();
            result.put("NAME", resultSet.getString("QUESTIONS_UID"));
            result.put("USER_ID", resultSet.getString("USER_ID"));
            result.put("PASSWORD", resultSet.getInt("PASSWORD"));
            result.put("PHONE_NUMBER", resultSet.getInt("PHONE_NUMBER"));
            result.put("USER_EMAIL", resultSet.getInt("USER_EMAIL"));
            result.put("ADDRESS", resultSet.getInt("ADDRESS"));
            result.put("ADDRESSADD", resultSet.getInt("ADDRESSADD"));
        }
        return result;
    }
}
