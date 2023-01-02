package com.kh_semi.servlet_with_db.servlets;

import java.sql.Statement;

import com.kh_semi.servlet_with_db.dao.Commons;


public class InsertSurvey {
    
    public void insertSurvey(String user_id, String question_id, String answer_id) {
        Commons commons = new Commons();
        Statement statement = commons.getStatement();

        //삽입칸
    }
  
    }

}
