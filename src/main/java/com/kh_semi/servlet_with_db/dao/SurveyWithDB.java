package com.kh_semi.servlet_with_db.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;


public class SurveyWithDB {

    public HashMap<String, Object>getQuestion(String question_id) throws SQLException {

        Commons commons = new Commons();
        Statement statement = commons.getStatement();

        String query = "SELECT * FROM QUESTION" +
                " WHERE QUESTION_ID = '" + question_id + "'";

        ResultSet resultSet = statement.executeQuery(query);
        HashMap<String, Object> result = null;
        while (resultSet.next()) {
            result = new HashMap<>();
                result.put("QUESTION", resultSet.getString("QUESTION"));
                result.put("QUESTION_ID", resultSet.getString("QUESTION_ID"));
                result.put("ORDERS", resultSet.getInt("ORDERS"));
            }

        return result;
    }

  
    public ArrayList<HashMap> getAnswerList(String servey_id) throws SQLException{
        
        Commons commons = new Commons();
        Statement statement = commons.getStatement();
        String query = "SELECT ANSWER_LIST.QUESTION_ID, ANSWER.ORDERS, ANSWER.ANSWER" +
                        "FROM ANSWER_LIST" +
                        "INNER JOIN ANSWER" +
                        "ON ANSWER_LIST.ANSWER_ID = ANSWER.ANSWER_ID " +
                        "WHERE QUESTION_ID = '"+servey_id+"' "+
                         "ORDER BY QUESTION_ID";
        ResultSet resultSet = statement.executeQuery(query);

        ArrayList<HashMap> answer_list = new ArrayList<HashMap>();
        while(resultSet.next()){
            HashMap<String, Object> answer = new HashMap<String, Object>();
            answer.put("ANSWER_ID", resultSet.getString("ANSWER_ID"));
            answer.put("ANSWER", resultSet.getString("ANSWER"));
            answer.put("ORDERS", resultSet.getInt("ORDERS"));

            answer_list.add(answer);
        }
        return answer_list;
    }

    // question 테이블 전체를 가져오는 function
    public ArrayList<HashMap> getQuestionInfo(String questionInfo_id) throws SQLException{
        
        Commons commons = new Commons();
        Statement statement = commons.getStatement();
        String query = "SELECT * FROM QUESTION ";
        ResultSet resultSet = statement.executeQuery(query);

        ArrayList<HashMap> questionInfo_list = new ArrayList<HashMap>();
 
        while(resultSet.next()) {
            HashMap<String, Object> questionInfo = new HashMap<String, Object>();
            questionInfo.put("QUESTION", resultSet.getString("QUESTION"));
            questionInfo.put("QUESTION_ID", resultSet.getString("QUESTION_ID"));
            questionInfo.put("ORDERS", resultSet.getString("ORDERS"));
           
       
            questionInfo_list.add(questionInfo);
        }
        return questionInfo_list;
    }
        
}
