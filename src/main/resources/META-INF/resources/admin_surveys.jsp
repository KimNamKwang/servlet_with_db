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
  </head>
  <body class="bg-secondary bg-opacity-10">
    <main>
      <div class="container">
        <div class="fs-4 fw-bold pb-3">📄 설문 관리</div>
        <div class="text-secondary">총 1건</div>
        <div class="bg-light ps-4 pe-4 pb-1 mt-2 mb-2">
          <table class="table">
            <thead>
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
              <form action="/Admin/surveyDetailServlet" method="get">
                <%
                ArrayList<HashMap> serveyInfo_list = (ArrayList<HashMap>)request.getAttribute("serveyInfo_list");
                %>
                <% for(int i = 0; i < serveyInfo_list.size(); i++){ %>
                  <% HashMap<String, Object> serveyInfo = serveyInfo_list.get(i); %>
                  <tr>
                  <td class="text-center"><%= i+1 %></td>
                  <td>
                    <%= serveyInfo.get("SERVEY_NAME") %></td>
                  <td><%= serveyInfo.get("SERVEY_COMMENT") %></td>
                  <td class="text-center">
                    <span class="text-nowrap"><%= serveyInfo.get("SERVEY_START_DATE") %></span>
                    <span class="text-nowrap">~ <%= serveyInfo.get("SERVEY_END_DATE") %></span>
                  </td>
                  <td class="text-nowrap"><%= serveyInfo.get("SERVEY_UP_DATE") %></td>
                  <td>
                    <div class="text-center">
                      <a class="btn btn-outline-dark btn-sm text-nowrap" href="/Admin/surveyDetailServlet?SERVEY_UID=<%= serveyInfo.get("SERVEY_UID") %>">수정</a>
                      <button
                        class="btn btn-outline-dark btn-sm text-nowrap"
                      >
                        삭제
                      </button>
                    </div>
                  </td>
                </tr>
                <% } %>
              
            </tbody>
          </table>
        </div>

        <div class="text-end">
          <button
            type="submit"
            class="btn btn-secondary btn-sm text-nowrap"
          >
            등록
          </button>
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
