package com.kh_semi.servlet_with_db.servlets;

import java.io.IOException;

import com.kh_semi.servlet_with_db.dao.InsertSurvey;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/Insertsurvey/Servlet")
public class InsertSurveyServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request , HttpServletResponse response)
        throws ServletException, IOException {
        
        HttpSession httpSession = request.getSession();
        request.getParameter("Q1");
        String ID = (String) httpSession.getAttribute("userId");
    
        InsertSurvey insertSurvey = new InsertSurvey();

        for(int i=1; i<7; i++){
            String question = "Q" + i;
            String answer = request.getParameter("Q"+i);
            insertSurvey.insertSurvey(ID, question, answer);
        }
        response.sendRedirect("/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          super.doPost(req, resp);
    }
}
