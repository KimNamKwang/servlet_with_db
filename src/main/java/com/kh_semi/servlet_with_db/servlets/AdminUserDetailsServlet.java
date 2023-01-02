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

@WebServlet(urlPatterns = "/Admin/userDetailsServlet")
public class AdminUserDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("USER_ID");
        AdminWithDB jiyeongDB = new AdminWithDB();

        HashMap<String, Object> userInfo = null;
        ArrayList<HashMap> userInfo_details_list = null;
        try {
            userInfo_details_list = jiyeongDB.getUsers(userId);
            userInfo = jiyeongDB.getUserId(userId);
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        System.out.println(userInfo.get("NAME"));
        System.out.println(userInfo.get("USER_ID"));
        System.out.println(userInfo.get("PASSWORD"));
        System.out.println(userInfo.get("PHONE_NUMBER"));
        System.out.println(userInfo.get("USER_EMAIL"));
        System.out.println(userInfo.get("ADDRESS"));
        System.out.println(userInfo.get("ADDRESSADD"));

        String userEmail = (String) userInfo.get("USER_EMAIL");
        String userEmail1 = userEmail.substring(0, userEmail.indexOf('@'));
        String userEmail2 = userEmail.substring(userEmail.indexOf('@') + 1, userEmail.length());
        System.out.println(userEmail1);
        System.out.println(userEmail2);

        String phone_number = (String) userInfo.get("PHONE_NUMBER");
        String phoneFirst = phone_number.substring(0, phone_number.indexOf('-'));
        String phoneSecond = phone_number.substring(4, phone_number.indexOf('-', 4));
        String phoneThird = phone_number.substring(9, phone_number.length());
        System.out.println(phoneFirst);
        System.out.println(phoneSecond);
        System.out.println(phoneThird);




       

        request.setAttribute("userInfo", userInfo);

        response.setContentType("text/html;charset=UTF-8"); // 응답을 보낼 때 한글이 깨지지 않게 해주는 것. 백엔드를 위한 것

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin_user_details.jsp");
        requestDispatcher.forward(request, response);
    }
}
