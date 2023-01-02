<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ page import="java.util.HashMap,java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>홀리피트니스</title>
        <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous"
        />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
          href="https://fonts.googleapis.com/css2?family=Zen+Dots&display=swap"
          rel="stylesheet"
        />
      </head>

    <body class="bg-secondary bg-opacity-25">                       
    <% ArrayList<HashMap> question = (ArrayList<HashMap>)request.getAttribute("question");
      ArrayList<HashMap> answer = (ArrayList<HashMap>) request.getAttribute("answer");%>
   
    <main>
    <main class="d-flex align-items-center mt-10" >
        <div class="container" style="margin-top: 120px; margin-bottom: 120px">
        <div class="bg-white p-5 mt-5 mb-5">
        <div class="fs-2 fw-bold mb-3">홀리 피트니스 만족도 설문 조사</div>
        <form action="" method="post">
       
          <div>
            <% for(int i=0;i<question.size();i++){  
              HashMap<String, Object> questions_list = question.get(i);%>
              <div><%= (i+1) %>. <%= questions_list.get("QUESTION") %></div>
                <div class="row">
                    <div class="row mb-3 ">
                        <% for(int j=0;j<answer.size();j++){ 
                        HashMap<String, Object> answers_list = answer.get(j);%>
                        <div>    
                        <input type="radio" class="form-check-input" name="radioname<%= (i+1) %>" id="radioid<%= (i+1) %>-<%= (j+1) %>" value="radiovalue<%= (j+1) %>" />
                        <label for="radio<%= (i+1) %>-<%= (j+1) %>" class="form-check-label"> <%= answers_list.get("ANSWER") %></label>  
                        </div>
                        <% } %>
                    </div>
                </div>
            <% } %>
            <div class="mt-5">
                <a
                  class="btn btn-secondary fw-bold ps-4 pe-4"
                  href="Survey_submit.html"
                >
                  제출하기
                </a>
              </div>
          </div>
        </form>
      </div>
    </main>



    <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"
  ></script>
</body>
</html>