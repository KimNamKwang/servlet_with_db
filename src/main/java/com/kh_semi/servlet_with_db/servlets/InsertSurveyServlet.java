package com.kh_semi.servlet_with_db.servlets;

import java.io.IOException;

import com.kh_semi.servlet_with_db.dao.InsertSurvey;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(urlPatterns = "/insertServlet")
public class InsertSurveyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        request.getParameter("QUESTION1");
        String ID = (String) httpSession.getAttribute("user_Id");

        //dao에 있음
        InsertSurvey insertSurvey = new InsertSurvey();
        

        for (int i = 1; i < 7; i++) {
            String question = "Q" + i;
            String answer = request.getParameter("Q" + i);
            insertSurvey.insertSurvey(ID,question, answer);
        }

        response.sendRedirect("/index.jsp");
    }
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
    }
}