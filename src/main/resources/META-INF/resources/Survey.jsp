<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ page
import = "java.util.HashMap, java.util.ArrayList "%>
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
    <% 
    ArrayList<HashMap> answersAndQuestionsList = (ArrayList<HashMap>)request.getAttribute("answersAndQuestionsList");
    
 %> 
    <main>
      <div class="container" style="margin-top: 120px; margin-bottom: 120px">
        <div class="bg-white p-5 mt-5 mb-5">
          <div class="fs-2 fw-bold">홀리 피트니스 만족도 설문 조사</div>
          <form action="" method="post">
            <% for(int i = 0; i < answersAndQuestionsList.size(); i++){ %>
         <%  HashMap<String, Object> answersAndQuestions = answersAndQuestionsList.get(i); %>
            <div class="mt-5">
              <div class="mb-3">
                <%=  answersAndQuestions.get("QUESTION")  %>
              </div>
              <div>
                <input
                  type="radio"
                  class="form-check-input"
                  name="answer01"
                  id="very_satisfaction_1"
                />
                <label for="very_satisfaction_1">매우만족</label>
              </div>
              <div>
                <input
                  type="radio"
                  class="form-check-input"
                  name="answer01"
                  id="satisfaction_1"
                />
                <label for="satisfaction_1">만족</label>
              </div>
              <div>
                <input
                  type="radio"
                  class="form-check-input"
                  name="answer01"
                  id="common_1"
                />
                <label for="common_1">보통</label>
              </div>
              <div>
                <input
                  type="radio"
                  class="form-check-input"
                  name="answer01"
                  id="dissatisfaction_1"
                />
                <label for="dissatisfaction_1">불만족</label>
              </div>
              <div>
                <input
                  type="radio"
                  class="form-check-input"
                  name="answer01"
                  id="very_dissatisfied_1"
                />
                <label for="very_dissatisfied_1">매우불만족</label>
              </div>
            </div>
            <%  } %>
            
            <div class="mt-5">
              <a
                class="btn btn-secondary fw-bold ps-4 pe-4"
                href="Survey_submit.html"
              >
                제출하기
              </a>
            </div>
          </form>
        </div>
      </div>
    </main>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
