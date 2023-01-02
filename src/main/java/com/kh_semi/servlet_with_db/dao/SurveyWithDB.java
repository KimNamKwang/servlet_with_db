package com.kh_semi.servlet_with_db.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;


public class SurveyWithDB {

    
  
   
    public ArrayList<HashMap> getAnswerList(String servey_id) throws SQLException{
        
        Commons commons = new Commons();

        Statement statement = commons.getStatement();

        String query = " SELECT ANSWER_LIST.QUESTION_ID, ANSWER.ORDERS," +
                       " ANSWER.ANSWER FROM ANSWER_LIST INNER JOIN ANSWER " +
                        " ON ANSWER_LIST.ANSWER_ID = ANSWER.ANSWER_ID " +
                        " WHERE QUESTION_ID = ' "+servey_id+ "' " +
                        " ORDER BY QUESTION_ID " ;
                        
        ResultSet resultSet = statement.executeQuery(query);
               
        // DB에서 받아온 결과를 HashMap으로 받음.
        ArrayList<HashMap> answer_list = new ArrayList<HashMap>();

        while(resultSet.next()){      
            HashMap<String, Object> answer = new HashMap<String,Object>();    
            answer.put("QUESTION_ID", resultSet.getString("QUESTION_ID"));
            answer.put("ORDERS", resultSet.getInt("ORDERS"));
            answer.put("ANSWER", resultSet.getString("ANSWER"));
        
            answer_list.add(answer);
        }
        return answer_list;
    }

    public HashMap<String, Object> getQuestion(String question_id) throws SQLException {

        Commons commons = new Commons();
        Statement statement = commons.getStatement();

        String query = " SELECT * FROM QUESTION " +
                        " WHERE QUESTION_ID = '" +question_id+ "'";
                

        ResultSet resultSet = statement.executeQuery(query);
       
        HashMap<String, Object> result = new HashMap<String, Object>();
        ArrayList<HashMap<String, Object>> answer_list = new ArrayList<HashMap<String, Object>>();

        while (resultSet.next()) {
           
            result.put("QUESTION", resultSet.getString("QUESTION"));
            result.put("QUESTION_ID", resultSet.getString("QUESTION_ID"));
            result.put("ORDERS", resultSet.getInt("ORDERS"));
            
            answer_list.add(result);
        }
         return result;
    }


}
