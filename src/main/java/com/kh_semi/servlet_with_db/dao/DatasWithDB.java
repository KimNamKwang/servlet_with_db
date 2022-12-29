package com.kh_semi.servlet_with_db.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.mysql.cj.protocol.Resultset;

public class DatasWithDB {
    /* Question가져오는 Function */
    public HashMap<String, Object> getQuestion(String questionsId) throws SQLException {

        // DB로그인을 위해 인스턴스화
        Commons commons = new Commons();
        // 쿼리문을 넣기 위해 Statement 가져옴
        Statement statement = commons.getStatement();

        // parameter로 들어오는 questionsId 로 QUESTIONS_ID를 찾는 쿼리
        String query = "select * from question where QUESTION_ID ='" + questionsId + "'";

        ResultSet resultSet = statement.executeQuery(query);

        // DB에서 받아온 결과를 HashMap으로 받음.
        HashMap<String, Object> result = null;

        while (resultSet.next()) {
            result = new HashMap<>();
            result.put("QUESTION_ID", resultSet.getString("QUESTION_ID"));
            result.put("QUESTION", resultSet.getString("QUESTION"));
        }
        return result;
    }

    /* 강사님 버전 답항 출력 */
    public ArrayList<HashMap<String, Object>> getAnswersList(String questionsId) throws SQLException {
        // DB로그인을 위해 인스턴스화
        Commons commons = new Commons();
        // 쿼리문을 넣기 위해 Statement 가져옴
        Statement statement = commons.getStatement();

        String query = "SELECT ANSWERS.QUESTIONS_UID, EXAMPLE_LIST.ORDERS," +
                " EXAMPLE_LIST.EXAMPLE FROM ANSWERS INNER JOIN EXAMPLE_LIST " +
                " ON ANSWERS.EXAMPLE_UID = EXAMPLE_LIST.EXAMPLE_UID" +
                " WHERE QUESTIONS_UID = '" + questionsId + "' ORDER BY QUESTIONS_UID ";

        ResultSet resultSet = statement.executeQuery(query);
        HashMap<String, Object> answer = new HashMap<String, Object>();
        ArrayList<HashMap<String, Object>> answer_list = new ArrayList<HashMap<String, Object>>();

        // Row가 하나여도 while문은 돌려야한다
        while (resultSet.next()) {
            answer.put("QUESTIONS_UID", resultSet.getString("QUESTIONS_UID"));
            answer.put("ORDERS", resultSet.getInt("ORDERS"));
            answer.put("EXAMPLE", resultSet.getString("EXAMPLE"));

            answer_list.add(answer);
        }
        return answer_list;
    }

    public void Join_completion(Statement statement, Connection connection, HashMap hashMap) {
        System.out.println(hashMap.get("userName"));
        System.out.println(hashMap.get("userId"));
        System.out.println(hashMap.get("userPassword"));
        System.out.println(hashMap.get("userPasswordCheck"));
        System.out.println(hashMap.get("emailId"));
        System.out.println(hashMap.get("emailPlatform"));
        System.out.println(hashMap.get("emailPlatform_s"));
        System.out.println(hashMap.get("phoneFirst"));
        System.out.println(hashMap.get("phoneSecond"));
        System.out.println(hashMap.get("phoneThird"));
        System.out.println(hashMap.get("addressId"));
        System.out.println(hashMap.get("addressAddId"));

        String userName = (String) hashMap.get("userName");
        String userId = (String) hashMap.get("userId");
        String userPassword = (String) hashMap.get("userPassword");
        String userPasswordCheck = (String) hashMap.get("userPasswordCheck");
        String email = (String) hashMap.get("emailId") + (String) hashMap.get("emailPlatform")
                + (String) hashMap.get("emailPlatform_s");
        String phoneNumber = (String) hashMap.get("phoneFirst") + "-" + (String) hashMap.get("phoneSecond")
                + "-" + (String) hashMap.get("phoneThird");
        String addressId = (String) hashMap.get("addressId");
        String addressAddId = (String) hashMap.get("addressAddId");

        // 인서트문
        String query = "INSERT INTO USER (NAME, USER_ID, PASSWORD, " +
                " PHONE_NUMBER, USER_EMAIL, ADDRESS, ADDRESSADD) " +
                " VALUES('" + userName + "','" + userId + "','" + userPassword + "','" + phoneNumber + "', " +
                " '" + email + "','" + addressId + "','" + addressAddId + "'); ";

        Commons commons = new Commons();
        Statement statement2 = commons.getStatement();
        try {
            statement2.executeUpdate(query);
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }
}
