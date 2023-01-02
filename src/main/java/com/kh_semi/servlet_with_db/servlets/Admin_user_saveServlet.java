package com.kh_semi.servlet_with_db.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import org.springframework.cglib.proxy.Dispatcher;

import com.kh_semi.servlet_with_db.dao.Commons;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/Admin/userSavaServlet")
public class Admin_user_saveServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8"); // 응답을 보낼 때 한글이 깨지지 않게 해주는 것. 백엔드를 위한 것

        // parameter로 받은 데이터
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

        String phoneNumber = userPhoneFirst + "-" + userPhoneSecond + "-" + userPhoneThird;
        String email = userEmail1 + "@" + userEmail2;

        Commons commons = new Commons();
        Statement statement = commons.getStatement();

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
