package com.kh_semi.servlet_with_db.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh_semi.servlet_with_db.dao.DatasWithDB;
import com.kh_semi.servlet_with_db.dao.SurveyWithDB;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/survey/Servlet")
public class SurveyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String question_id = request.getParameter("QUESTION_ID");

        SurveyWithDB surveyWithDB = new SurveyWithDB();

        DatasWithDB datasWithDB = new DatasWithDB();
        HashMap<String, Object> question = null;
        ArrayList<HashMap> answer_list = null;

        try {
            question = surveyWithDB.getQuestion(question_id);
            System.out.println(question.get("QUESTION"));
            System.out.println(question.get("QUESTION_ID"));
            System.out.println(question.get("ORDERS"));
            answer_list = surveyWithDB.getAnswerList(question_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

           
     
        for(int i = 0; i < answer_list.size(); i++) {
            HashMap<String,Object> answer =  answer_list.get(i);
            System.out.println(answer.get("ORDERS"));
            System.out.println(answer.get("ANSWER"));

        

            answer = answer_list.get(i);

            System.out.println(answer.get("QUESTION"));
            System.out.println(answer.get("ANSWER"));

            System.out.println(answer.get("ORDERS"));
            System.out.println(answer.get("ANSWER"));
           
        } System.out.println("으악");

        request.setAttribute("question", question);
        request.setAttribute("answer_list", answer_list);

        response.setContentType("text/html;charset=UTF-8"); // 응답을 보낼 때 한글이 깨지지 않게 해주는 것. 백엔드를 위한 것

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/survey.jsp");
        requestDispatcher.forward(request, response);

    }

}
