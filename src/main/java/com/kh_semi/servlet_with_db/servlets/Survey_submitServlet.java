package com.kh_semi.servlet_with_db.servlets;

import java.io.IOException;
import java.lang.reflect.Member;

import com.kh_semi.servlet_with_db.dao.SurveyWithDB;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/survey/SubmitServlet")
public class Survey_submitServlet extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException {
        
    //     SurveyWithDB db = new SurveyWithDB();
    //     HttpSession httpSession = request.getSession();        
    //     Member loginUser = (Member)httpSession.getAttribute("loginUser");
    //     int result;

    //     String userUid = loginUser.getUsersUid();
    //     String Q1 = request.getParameter("QUESTION1");
    //     String Q2 = request.getParameter("QUESTION2");
    //     String Q3 = request.getParameter("QUESTION3");
    //     String Q4 = request.getParameter("QUESTION4");
    //     String Q5 = request.getParameter("QUESTION5");
    //     try {
    //         System.out.println();
    //         db.insertSurvey(userUid, Q1, Q2, Q3, Q4, Q5);


        
    //     RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Survey_submit.jsp");
    //     requestDispatcher.forward(request, response);

    // } catch (Exception e) {
    //     e.printStackTrace();
    // }

    // RequestDispatcher requestDispatcher = request.getRequestDispatcher("survey_submit.jsp");
    // requestDispatcher.forward(request, response);
    }

}
