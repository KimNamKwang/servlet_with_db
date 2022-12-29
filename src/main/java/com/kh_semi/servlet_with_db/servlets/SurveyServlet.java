package com.kh_semi.servlet_with_db.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.cglib.proxy.Dispatcher;

import com.kh_semi.servlet_with_db.dao.DatasWithDB;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/SurveyServlet")
public class SurveyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8"); // 응답을 보낼 때 한글이 깨지지 않게 해주는 것. 백엔드를 위한 것

        DatasWithDB datasWithDB = new DatasWithDB();

        ArrayList<HashMap<String, Object>> answersAndQuestionsList = null;
        HashMap<String, Object> answersAndQuestions = null;
        try {
            answersAndQuestionsList = datasWithDB.getAnswersAndQuestions();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

        for (int i = 0; i < answersAndQuestionsList.size(); i++) {
            answersAndQuestions = answersAndQuestionsList.get(i);
            System.out.println(answersAndQuestions.get("QUESTION_ID"));
            System.out.println(answersAndQuestions.get("QUESTION"));
        }

        request.setAttribute("answersAndQuestionsList", answersAndQuestionsList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Survey.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /* super가 아니라 this를 쓰면 doGet이 실행되게 된다. */
        this.doGet(req, resp);
    }

}
