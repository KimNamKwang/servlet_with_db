package com.kh_semi.servlet_with_db.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh_semi.servlet_with_db.dao.JiyeongDB;
import com.kh_semi.servlet_with_db.dao.PollWithDB;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/Admin/users")
public class Admin_users extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
        String userId = request.getParameter("USER_ID");

       JiyeongDB jiyeongDB = new JiyeongDB();
        ArrayList<HashMap> user_list = null;
        try {
            user_list = jiyeongDB.getUsers(userId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for(int i = 0; i < user_list.size(); i++){
            HashMap<String, Object> user = user_list.get(i);
            System.out.println(user.get("NAME"));
            System.out.println(user.get("USER_ID"));
            System.out.println(user.get("PASSWORD"));
            System.out.println(user.get("PHONE_NUMBER"));
            System.out.println(user.get("USER_EMAIL"));
            System.out.println(user.get("ADDRESS"));
            System.out.println(user.get("ADDRESSADD"));
        }

        response.setContentType("text/html;charset=UTF-8"); // 응답을 보낼 때 한글이 깨지지 않게 해주는 것. 백엔드를 위한 것

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin_users.jsp");
        requestDispatcher.forward(request, response);

    }
}
