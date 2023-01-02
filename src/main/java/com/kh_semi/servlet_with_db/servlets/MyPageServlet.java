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

@WebServlet(urlPatterns = "/myPageServlet")
public class MyPageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8"); // 응답을 보낼 때 한글이 깨지지 않게 해주는 것. 백엔드를 위한 것

        // parameter로 받은 데이터
        String userName = request.getParameter("userName");
        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");
        String emailId = request.getParameter("emailId");
        String emailPlatform = request.getParameter("emailPlatform");
        String phoneFirst = request.getParameter("phoneFirst");
        String phoneSecond = request.getParameter("phoneSecond");
        String phoneThird = request.getParameter("phoneThird");
        String addressId = request.getParameter("addressId");
        String addressAddId = request.getParameter("addressAddId");

        String phoneNumber = phoneFirst + "-" + phoneSecond + "-" + phoneThird;
        String email = emailId + "@" + emailPlatform;

        Commons commons = new Commons();
        Statement statement = commons.getStatement();

        String query = "UPDATE USER SET name='" + userName + "' , PASSWORD = '"
                + userPassword + "', PHONE_NUMBER = '" + phoneNumber + "', USER_EMAIL = '" + email
                + "', ADDRESS = '" + addressId + "', ADDRESSADD = '" + addressAddId + "' WHERE USER_ID = '" + userId
                + "';";
        try {
            statement.execute(query);
            HttpSession httpSession = request.getSession();
            httpSession.invalidate();
            PrintWriter writer = response.getWriter();
            String path = "/Login.jsp";
            writer.println("<script>alert('수정이 완료되었습니다. 다시 로그인해주세요.'); location.href='" + path + "';</script>");
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
