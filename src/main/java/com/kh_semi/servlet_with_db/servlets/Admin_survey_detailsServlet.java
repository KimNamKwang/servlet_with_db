package com.kh_semi.servlet_with_db.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh_semi.servlet_with_db.dao.JiyeongDB;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/Admin/surveyDetailServlet")
public class Admin_survey_detailsServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String serveyInfo_Uid = request.getParameter("SERVEY_UID");
        
        JiyeongDB jiyeongDB = new JiyeongDB();
        
        HashMap<String, Object> serveyInfo = null;
        ArrayList<HashMap> question_answer_list = null;
        try {
            serveyInfo = jiyeongDB.getServeyInfoUid(serveyInfo_Uid);
            System.out.println(serveyInfo.get("SERVEY_NAME"));
            System.out.println(serveyInfo.get("SERVEY_COMMENT"));
            System.out.println(serveyInfo.get("SERVEY_START_DATE"));
            System.out.println(serveyInfo.get("SERVEY_END_DATE"));
            question_answer_list = jiyeongDB.getQuestion_Answer(serveyInfo_Uid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for(int i = 0; i < question_answer_list.size(); i++) {
            HashMap<String, Object> question_answer = question_answer_list.get(i);
            System.out.println(question_answer.get("QUESTION"));
            System.out.println(question_answer.get("ANSWER"));
            System.out.println(question_answer.get("ORDERS"));
        }

       request.setAttribute("serveyInfo", serveyInfo);
       request.setAttribute("question_answer_list", question_answer_list);

        response.setContentType("text/html;charset=UTF-8"); // 응답을 보낼 때 한글이 깨지지 않게 해주는 것. 백엔드를 위한 것

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin_suvey_details.jsp");
        requestDispatcher.forward(request, response);

    }

}
