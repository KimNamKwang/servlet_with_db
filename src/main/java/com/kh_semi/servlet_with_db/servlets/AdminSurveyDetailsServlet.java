package com.kh_semi.servlet_with_db.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh_semi.servlet_with_db.dao.AdminWithDB;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/Admin/surveyDetailsServlet")
public class AdminSurveyDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String surveyInfo_Uid = request.getParameter("SURVEY_UID");
        AdminWithDB jiyeongDB = new AdminWithDB();

        HashMap<String, Object> surveyInfo = null;

        try {
            surveyInfo = jiyeongDB.getSurveyInfoUid(surveyInfo_Uid);
            System.out.println(surveyInfo.get("SURVEY_NAME"));
            System.out.println(surveyInfo.get("SURVEY_COMMENT"));
            System.out.println(surveyInfo.get("SURVEY_START_DATE"));
            System.out.println(surveyInfo.get("SURVEY_END_DATE"));
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

        request.setAttribute("surveyInfo", surveyInfo);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin_survey_details.jsp");
        requestDispatcher.forward(request, response);
    }

}
