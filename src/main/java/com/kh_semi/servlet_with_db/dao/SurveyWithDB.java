package com.kh_semi.servlet_with_db.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class SurveyWithDB {
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
}