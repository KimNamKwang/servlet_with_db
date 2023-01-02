package com.kh_semi.servlet_with_db.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class UserWithDB {
    /* Question가져오는 Function */
    public HashMap<String, Object> getUser(String USER_ID, String PASSWORD) throws SQLException {

        // DB로그인을 위해 인스턴스화
        Commons commons = new Commons();
        // 쿼리문을 넣기 위해 Statement 가져옴
        Statement statement = commons.getStatement();

        // parameter로 들어오는 name 로 대상을 찾는 쿼리
        String query = "SELECT * FROM USER WHERE USER_ID ='" + USER_ID + "';";

        // 총기 분해
        String email = "hong@naver.com";
        String first = email.substring(0, email.indexOf('@'));
        String second = email.substring(email.indexOf('@') + 1, email.length());

        String number = "010-5041-3846";
        String first_num = number.substring(0, number.indexOf('-'));
        String second_num = number.substring(4, number.indexOf('-', 4));
        String third_num = number.substring(9, number.length());

        System.out.println(first + " " + second);

        System.out.println(first_num + " " + second_num + " " + third_num);
        ResultSet resultSet = statement.executeQuery(query);
        // ResultSet resultSetForAnswersList =
        // statement.executeQuery(queryForAnswersList);

        // DB에서 받아온 결과를 HashMap으로 받음.
        HashMap<String, Object> result = new HashMap<>();

        if (resultSet.isBeforeFirst()) {
            while (resultSet.next()) {
                if (USER_ID.equals(resultSet.getString("USER_ID"))
                        && PASSWORD.equals(resultSet.getString("PASSWORD"))) {
                    result.put("NAME", resultSet.getString("NAME"));
                    result.put("USER_ID", resultSet.getString("USER_ID"));
                    result.put("PASSWORD", resultSet.getString("PASSWORD"));
                    result.put("PHONE_NUMBER", resultSet.getString("PHONE_NUMBER"));
                    result.put("USER_EMAIL", resultSet.getString("USER_EMAIL"));
                    result.put("ADDRESS", resultSet.getString("ADDRESS"));
                    result.put("ADDRESSADD", resultSet.getString("ADDRESSADD"));

                    // 임서 print
                    System.out.println("resultSet이 나오는지 확인");
                    System.out.println(resultSet.getString("NAME"));
                    System.out.println(resultSet.getString("PASSWORD"));
                } else {
                    // 비밀번호가 틀림
                    result = null;
                }

            }
        } else {
            // 입력 값이 틀림
            result = null;
        }

        return result;

    }
}
