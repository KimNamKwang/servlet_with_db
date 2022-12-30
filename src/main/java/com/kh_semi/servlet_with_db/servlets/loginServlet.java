package com.kh_semi.servlet_with_db.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;

import org.springframework.cglib.proxy.Dispatcher;

import com.kh_semi.servlet_with_db.dao.UserWithDB;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/loginServlet")
public class loginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8"); // 응답을 보낼 때 한글이 깨지지 않게 해주는 것. 백엔드를 위한 것

        // login.jsp 의 파라미터 값 받기
        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");
        String logout = request.getParameter("logout");

        System.out.println(userId);
        System.out.println(userPassword);

        UserWithDB userWithDB = new UserWithDB();
        try {
            HashMap<String, Object> userDB = userWithDB.getUser(userId, userPassword);

            // 경로 지정
            String path;
            if (userDB == null) {

                if ("yes".equals(logout)) {
                    // 로그아웃
                    path = "/index.jsp";
                    HttpSession httpSession = request.getSession();
                    httpSession.invalidate();
                } else {
                    // userDB의 입력 값이 없어서 NULL 이면 Login.jsp로 보내줌
                    PrintWriter writer = response.getWriter();
                    path = "/Login.jsp";
                    writer.println("<script>alert('로그인 정보가 일치하지 않습니다.'); location.href='" + path + "';</script>");
                    writer.close();
                }
            } else {
                // 정보가 들어있는 userDB면 index.jsp로 감
                path = "/index.jsp";
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("userDB", userDB);
            }

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(path);
            requestDispatcher.forward(request, response);
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
