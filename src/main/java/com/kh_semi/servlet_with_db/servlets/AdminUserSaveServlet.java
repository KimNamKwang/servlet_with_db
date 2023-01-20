package com.kh_semi.servlet_with_db.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;

import com.kh_semi.servlet_with_db.dao.Commons;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/Admin/userSaveServlet")
public class AdminUserSaveServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8"); // 한글 깨짐 방지

        // parameter로 받은 데이터 변수에 담기
        String userName = request.getParameter("userName");
        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");
        String userEmail1 = request.getParameter("userEmail1");
        String userEmail2 = request.getParameter("userEmail2");
        String userPhoneFirst = request.getParameter("userPhoneFirst");
        String userPhoneSecond = request.getParameter("userPhoneSecond");
        String userPhoneThird = request.getParameter("userPhoneThird");
        String userAddress = request.getParameter("userAddress");
        String userAddressAdd = request.getParameter("userAddressAdd");

        // DB email을 '@'를 기준으로 나눠서 변수에 담음
        String phoneNumber = userPhoneFirst + "-" + userPhoneSecond + "-" + userPhoneThird;
        String email = userEmail1 + "@" + userEmail2;

        Commons commons = new Commons();
        Statement statement = commons.getStatement();

        // 들어온 parameter 데이터대로 DB값 수정하는 SQL문
        String query = "UPDATE USER SET name='" + userName + "' , PASSWORD = '"
                + userPassword + "', PHONE_NUMBER = '" + phoneNumber + "', USER_EMAIL = '" + email
                + "', ADDRESS = '" + userAddress + "', ADDRESSADD = '" + userAddressAdd + "' WHERE USER_ID = '" + userId
                + "' ";
        try {
            statement.execute(query);
            PrintWriter writer = response.getWriter();
            String path = "/Admin/usersServlet";
            writer.println("<script>alert('저장되었습니다.'); location.href='" + path + "';</script>");
            writer.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /* super가 아니라 this를 쓰면 doGet이 실행되게 된다. */
        this.doGet(req, resp);
    }

}
