package com.kh_semi.servlet_with_db.filters;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// @WebFilter("/survey/*")
public class FilterForSurveys implements Filter {

    @Override
    public void destroy() {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        System.out.println(request.getRemoteHost());
        System.out.println(request.getRemoteAddr());

        /* url을 빼내기 위해 HttpServletRequest으로 선언 */
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;

        /* 세션을 체크하기 위해 세션 추가 */
        HttpSession httpSession = httpServletRequest.getSession();

        httpSession.getAttribute("userId");

        String uri = httpServletRequest.getRequestURI();

        if (uri.endsWith("Servlets")) {
            /* index.html로 보내줬다가 */
            httpServletResponse.sendRedirect("index.jsp");
        } else {
            /* chain이 url 서블릿으로 넘겨주는 역할. 곧 Dispatcher */
            chain.doFilter(request, response);
        }

    }

    public void init(FilterConfig filterConfig) throws ServletException {

    }

}
