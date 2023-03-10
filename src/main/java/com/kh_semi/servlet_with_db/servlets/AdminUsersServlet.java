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

@WebServlet(urlPatterns = "/Admin/usersServlet")
public class AdminUsersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String userId = request.getParameter("USER_ID");

        AdminWithDB adminWithDB = new AdminWithDB();
        ArrayList<HashMap> user_list = null;
        try {
            user_list = adminWithDB.getUsers(userId);
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
        
        request.setAttribute("user_list", user_list);
        
        response.setContentType("text/html;charset=UTF-8"); // 한글 깨짐 방지

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin_users.jsp");
        requestDispatcher.forward(request, response);

    }
}
