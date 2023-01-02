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

@WebServlet(urlPatterns = "/Admin/usersServlet")
public class Admin_usersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String userId = request.getParameter("USER_ID");

        JiyeongDB jiyeongDB = new JiyeongDB();
        ArrayList<HashMap> user_list = null;
        try {
            user_list = jiyeongDB.getUsers(userId);
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        for (int i = 0; i < user_list.size(); i++) {
            HashMap<String, Object> user = user_list.get(i);
            System.out.println(user.get("NAME"));
            System.out.println(user.get("USER_ID"));
            System.out.println(user.get("PASSWORD"));
            System.out.println(user.get("PHONE_NUMBER"));
            System.out.println(user.get("USER_EMAIL"));
            System.out.println(user.get("ADDRESS"));
            System.out.println(user.get("ADDRESSADD"));
            System.out.println(user.get("SURVEYED"));
            System.out.println(user.get("JOIN_DATE"));
        }
        System.out.println();
        /* 이 부분 추가했을 유. request에 실어보내는게 없어서 */
        request.setAttribute("user_list", user_list);
        // getUsers
        response.setContentType("text/html;charset=UTF-8"); // 응답을 보낼 때 한글이 깨지지 않게 해주는 것. 백엔드를 위한 것

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin_users.jsp");
        requestDispatcher.forward(request, response);

    }
}
