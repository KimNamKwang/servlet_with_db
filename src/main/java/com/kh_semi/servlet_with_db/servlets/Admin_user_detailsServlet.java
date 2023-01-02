package com.kh_semi.servlet_with_db.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh_semi.servlet_with_db.dao.JiyeongDB;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/Admin/userDetailServlet")
public class Admin_user_detailsServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException  {
        String userId = request.getParameter("USER_ID");

        JiyeongDB jiyeongDB = new JiyeongDB();

        HashMap<String, Object> userInfo = null;
        ArrayList<HashMap> userInfo_details_list = null;
        userInfo = jiyeongDB.getUserId(userId);
        System.out.println(userInfo.get("NAME"));
        System.out.println(userInfo.get("USER_ID"));
        System.out.println(userInfo.get("PASSWORD"));
        System.out.println(userInfo.get("PHONE_NUMBER"));
        System.out.println(userInfo.get("USER_EMAIL"));
        System.out.println(userInfo.get("ADDRESS"));
        System.out.println(userInfo.get("ADDRESSADD"));
        userInfo_details_list = jiyeongDB.getUsers(userId);


        request.setAttribute("userInfo", userInfo);

        response.setContentType("text/html;charset=UTF-8"); // 응답을 보낼 때 한글이 깨지지 않게 해주는 것. 백엔드를 위한 것

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin_user_details.jsp");
        requestDispatcher.forward(request, response);
    }
}
