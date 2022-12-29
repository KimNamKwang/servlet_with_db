package com.kh_semi.servlet_with_db.servlets;

@WebServlet(urlPatterns = "/Admin/users")
public class Admin_users extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8"); // 응답을 보낼 때 한글이 깨지지 않게 해주는 것. 백엔드를 위한 것

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
        requestDispatcher.forward(request, response);

    }
}
