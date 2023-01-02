package com.kh_semi.servlet_with_db.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh_semi.servlet_with_db.dao.SurveyWithDB;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/survey/Servlet")
public class SurveyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        SurveyWithDB surveyWithDB = new SurveyWithDB();
        ArrayList<HashMap> answer = null;
        ArrayList<HashMap> question = null;
        
        try {
            question = SurveyWithDB.getQuestion();
            answer = SurveyWithDB.getAnswersList();
            for (int i = 0; i < question.size(); i++) {
                HashMap<String, Object> questions_list = question.get(i);
            }
            answer = SurveyWithDB.getAnswersList();
        } catch (SQLException e) {         
            e.printStackTrace();
        }
        for (int i = 0; i < answer.size(); i++) {
            HashMap<String, Object> answers_list = answer.get(i);
        }

        request.setAttribute("question", question);
        request.setAttribute("answer", answer);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/survey.jsp");
        requestDispatcher.forward(request, response);
    }
}