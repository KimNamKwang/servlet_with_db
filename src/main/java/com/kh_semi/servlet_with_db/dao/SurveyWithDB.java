package com.kh_semi.servlet_with_db.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import ch.qos.logback.core.net.ssl.SSL;

public class SurveyWithDB {
    //답항 출력
    public static ArrayList<HashMap> getAnswersList() throws SQLException {
        Commons commons = new Commons();
        Statement statement = commons.getStatement();
        String query = "SELECT * FROM ANSWER";
        ResultSet resultSet = statement.executeQuery(query);
        ArrayList<HashMap> answerList = new ArrayList<HashMap>();
        while (resultSet.next()) {
            HashMap<String, Object> answer = new HashMap<String, Object>();
            answer.put("ANSWER_ID", resultSet.getString("ANSWER_ID"));
            answer.put("ORDERS", resultSet.getInt("ORDERS"));
            answer.put("ANSWER", resultSet.getString("ANSWER"));
            answerList.add(answer);
        }
        return answerList;
    }
    //질문 출력
    public static ArrayList<HashMap> getQuestion() throws SQLException {
        Commons commons = new Commons();
        Statement statement = commons.getStatement();
        String query = "SELECT * FROM QUESTION";
        ResultSet resultSet = statement.executeQuery(query);
        ArrayList<HashMap> result = new ArrayList<HashMap>();
        while (resultSet.next()) {
            HashMap<String, Object> question = new HashMap<String, Object>();
            question.put("QUESTION_ID", resultSet.getString("QUESTION_ID"));
            question.put("ORDERS", resultSet.getString("ORDERS"));
            question.put("QUESTION", resultSet.getString("QUESTION"));
            result.add(question);
        }
        return result;
    }
    
    //설문 결과를 DB에 추가
    public void insertSurvey(
        String user_id, //user테이블
        String QUESTION1,
        String QUESTION2,
        String QUESTION3,
        String QUESTION4,
        String QUESTION5
        ) throws SQLException{
        Commons commons = new Commons();
        Statement statement = commons.getStatement();

        String query =
        "INSERT INTO survey(USER_ID, QUESTION_UID, ANSWER_UID) " +
        "VALUES ('"+user_id+"', 'QUESTION1', '" +
                QUESTION1 + "'),('" +
                
                user_id + "', 'QUESTION2', '" +
                QUESTION2 + "'), ('" +
                
                user_id + "', 'QUESTION3', '" +
                QUESTION3 + "'), ('" +
        
                user_id + "', 'QUESTION4', '" +
                QUESTION4 + "'), ('" +
        
                user_id + "', 'QUESTION5', '" +
                QUESTION5 + "')";
        
            statement.executeQuery(query);
   
    }

}