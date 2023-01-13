package com.kh_semi.servlet_with_db.dao;

import java.sql.SQLException;
import java.sql.Statement;

public class InsertSurvey{

    //DB삽입
    public void insertSurvey(String user_id, String question_id, String answer_id){
    Commons commons = new Commons();
    Statement statement = commons.getStatement();

    //삽입하기
    String query = "INSERT INTO survey(USER_ID, QUESTION_ID,ANSWER_ID)"+
                    "VALUES('" + user_id + "','" + question_id + "','" + answer_id+"');";
    
    try{
        statement.execute(query);
    }catch(SQLException e) {
        e.printStackTrace();
    }finally {
        try {
            statement.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
}
}





    
    



    