package com.kh_semi.servlet_with_db.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.cglib.proxy.Dispatcher;

import com.kh_semi.servlet_with_db.dao.Commons;
import com.kh_semi.servlet_with_db.dao.DatasWithDB;
import com.mysql.cj.xdevapi.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/join/completionServlet")
public class join_completionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8"); // 응답을 보낼 때 한글이 깨지지 않게 해주는 것. 백엔드를 위한 것

        String userName = request.getParameter("userName");
        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");
        String userPasswordCheck = request.getParameter("userPasswordCheck");
        String emailId = request.getParameter("emailId");
        String emailPlatform = request.getParameter("emailPlatform");
        String emailPlatform_s = request.getParameter("emailPlatform_s");
        String phoneFirst = request.getParameter("phoneFirst");
        String phoneSecond = request.getParameter("phoneSecond");
        String phoneThird = request.getParameter("phoneThird");
        String addressId = request.getParameter("addressId");
        String addressAddId = request.getParameter("addressAddId");

        HashMap<String, Object> joindata = new HashMap<>();

        joindata.put("userName", userName);
        joindata.put("userId", userId);
        joindata.put("userPassword", userPassword);
        joindata.put("userPasswordCheck", userPasswordCheck);
        joindata.put("emailId", emailId);
        joindata.put("emailPlatform", emailPlatform);
        joindata.put("emailPlatform_s", emailPlatform_s);
        joindata.put("phoneFirst", phoneFirst);
        joindata.put("phoneSecond", phoneSecond);
        joindata.put("phoneThird", phoneThird);
        joindata.put("addressId", addressId);
        joindata.put("addressAddId", addressAddId);

        DatasWithDB Join_completion = new DatasWithDB();
        Join_completion.Join_completion(null, null, joindata);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Join_completion.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /* super가 아니라 this를 쓰면 doGet이 실행되게 된다. */
        this.doGet(req, resp);
    }

}
