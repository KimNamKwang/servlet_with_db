<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>

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
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
  </head>
  <body style="font-family: 'IBM Plex Sans KR', cursive" class="bg-secondary bg-opacity-10">
    <%@ include file= "navbar_login.jsp"  %>
    <main>
      <div class="container">
        <% 
        ArrayList<HashMap> surveyInfo_list = (ArrayList<HashMap>)request.getAttribute("surveyInfo_list");
          %>
        <div class="fs-4 fw-bold pb-3 pt-5 mt-4">📄 설문 관리</div>
        <div class="text-secondary">총 <%= surveyInfo_list.size() %>건</div>
        <div class="bg-light ps-4 pe-4 pb-1 mt-2 mb-2">
          <table class="table">
            <thead class="border-bottom border-3">
              <tr class="text-center">
                <th class="text-nowrap">번호</th>
                <th class="text-nowrap">설문명</th>
                <th class="text-nowrap">설문내용</th>
                <th class="text-nowrap">기간</th>
                <th class="text-nowrap">등록일</th>
                <th class="text-nowrap">관리</th>
              </tr>
            </thead>
            <tbody>
                <% for(int i = 0; i < surveyInfo_list.size(); i++) { %>
                  <%  HashMap<String, Object> surveyInfo = surveyInfo_list.get(i); %>
                    <tr>
                      <td class="text-center"><%= i + 1 %></td>
                      <td><%=  surveyInfo.get("SURVEY_NAME")  %></td>
                      <td><%=  surveyInfo.get("SURVEY_COMMENT")  %></td>
                      <td class="text-center">
                        <span class="text-nowrap"><%=  surveyInfo.get("SURVEY_START_DATE")  %></span>
                        <span class="text-nowrap">~ <%=  surveyInfo.get("SURVEY_END_DATE")  %></span>
                      </td>
                      <td class="text-nowrap"><%=  surveyInfo.get("SURVEY_UP_DATE")  %></td>
                      <td>
                    <form action="/Admin/surveyDetailServlet" method="get">
                    <div class="text-center">
                      <a class="btn btn-outline-dark btn-sm text-nowrap" href="/Admin/surveyDetailsServlet?Survey_UID=<%= surveyInfo.get("SURVEY_UID")  %></a>">수정</a>
                      <button
                        class="btn btn-outline-dark btn-sm text-nowrap"
                      >
                        삭제
                      </button>
                    </div>
                  </td>
                </tr>
                <%  } %>
              
            </tbody>
          </table>
         </div>

          <div class="text-end">
          <button
            type="submit"
            class="btn btn-secondary btn-sm text-nowrap"
          >
            설문 등록
          </button>
        </form>
        </div>
      </div>
    </main>
    <%@ include file= "footer.jsp" %>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
