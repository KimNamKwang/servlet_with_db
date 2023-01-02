// package com.kh_semi.servlet_with_db.servlets;

// import java.io.IOException;
// import java.lang.reflect.Member;

// import com.kh_semi.servlet_with_db.dao.PollWithDB;
// import com.kh_semi.servlet_with_db.dao.SurveyWithDB;

// import jakarta.servlet.RequestDispatcher;
// import jakarta.servlet.ServletException;
// import jakarta.servlet.annotation.WebServlet;
// import jakarta.servlet.http.HttpServlet;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;
// import java.io.IOException;
// import java.sql.SQLException;
// import java.util.ArrayList;
// import java.util.HashMap;

// @WebServlet(urlPatterns = "/survey/SubmitServlet")
// public class Survey_submitServlet extends HttpServlet {
    
//     @Override
//     protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException {
        
//         String user_id = "U1";

//         PollWithDB pollWithDB = new PollWithDB();

//         ArrayList<HashMap> question_list = null;
//         ArrayList<HashMap> answers_list = null;
//         HashMap<String, Object> userName = null;

    
//         try {
//             question_list = pollWithDB.getQuestion();
//             answers_list = pollWithDB.getAnswer(user_id);
//             userName = pollWithDB.getUserName(user_id);
//           } catch (SQLException e) {
//             e.printStackTrace();
//           }

//           String msg = "설문을 제출해주세요.";

//           if (answers_list.size() != 0) {
//             request.setAttribute("question_list", question_list);
//             request.setAttribute("answers_list", answers_list);
//             request.setAttribute("user_id", user_id);
//             request.setAttribute("userName", userName);
//             RequestDispatcher requestDispatcher = request.getRequestDispatcher("/survey_submit.jsp");
//             requestDispatcher.forward(request, response);
//           } else {
//             request.setAttribute("msg", msg);
           
//           }
//         }
      
//         @Override
//         protected void doPost(HttpServletRequest req, HttpServletResponse resp)
//           throws ServletException, IOException {
//           this.doGet(req, resp);
//         }
//       }





//         // RequestDispatcher requestDispatcher = request.getRequestDispatcher("survey_submit.jsp");
//         // requestDispatcher.forward(request, response);
//     }

// }
