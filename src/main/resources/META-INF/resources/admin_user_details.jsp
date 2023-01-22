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
  <body style="font-family: 'IBM Plex Sans KR', cursive"  class="bg-secondary bg-opacity-10">
    <%@ include file= "navbar_login.jsp"  %>
    <main>
      <div class="container">
        <div class="fs-4 fw-bold pb-3 pt-5 mt-4">👤 회원 정보 조회 / 수정</div>
        <div
          class="bg-light ps-4 pe-4 pb-1 mt-2"
          style="margin-top: 50px; margin-bottom: 120px"
        >
          <div>
            <table class="table align-middle">
              <form action="/Admin/userSaveServlet" class="form" method="post">
                <% 
              HashMap<String, Object> userInfo = (HashMap<String, Object>)request.getAttribute("userInfo");
                  
                  %> 
                <tr>
                  <th>이름 *</th>
                  <td>
                    <input
                      type="text"
                      class="form-control w-50"
                      name="userName"
                      value="<%= userInfo.get("NAME") %>"
                    />
                  </td>
                </tr>
                <tr>
                  <th>아이디 *</th>
                  <td>
                    <input
                      type="text"
                      class="form-control w-50"
                      name="userId"
                      value="<%= userInfo.get("USER_ID") %>"
                      readonly
                    />
                  </td>
                </tr>
                <tr>
                  <th class="text-nowrap">비밀번호 *</th>
                  <td>
                    <input
                      type="text"
                      class="form-control w-50"
                      name="userPassword"
                      value="<%= userInfo.get("PASSWORD") %>"
                    />
                  </td>
                </tr>
                <tr>
                  <th>이메일</th>
                  <td class="row d-flex align-items-center">
                    <%
                        String userEmail = (String) userInfo.get("USER_EMAIL");
                        String userEmail1 = userEmail.substring(0, userEmail.indexOf('@'));
                        String userEmail2 = userEmail.substring(userEmail.indexOf('@') + 1, userEmail.length());
                      %>
                    <div class="col">
                      <input
                        type="text"
                        class="form-control"
                        name="userEmail1"
                        value="<%= userEmail1 %>"
                      />
                    </div>
                    @
                    <div class="col">
                      <input
                        type="text"
                        class="form-control"
                        name="userEmail2"
                        value="<%= userEmail2 %>"
                      />
                    </div>
                    <div class="col-auto">
                      <select class="form-select" name="userEmailSelect">
                        <option value="choice_email">직접입력</option>
                        <option value="@naver.com">naver.com</option>
                        <option value="@gmail.com">gmail.com</option>
                        <option value="@daum.net">daum.net</option>
                      </select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th>연락처 *</th>
                  <td class="row">
                    <%
                    String phone_number = (String) userInfo.get("PHONE_NUMBER");
                    String phoneFirst = phone_number.substring(0, phone_number.indexOf('-'));
                    String phoneSecond = phone_number.substring(4, phone_number.indexOf('-', 4));
                    String phoneThird = phone_number.substring(9, phone_number.length());          
                    %>
                    <div class="col">
                      <select class="form-select" name="userPhoneFirst">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                      </select>
                    </div>
                    <div class="col-auto">-</div>
                    <div class="col">
                      <input
                        type="text"
                        class="form-control"
                        name="userPhoneSecond"
                        value="<%= phoneSecond %>"
                      />
                    </div>
                    <div class="col-auto">-</div>
                    <div class="col">
                      <input
                        type="text"
                        class="form-control"
                        name="userPhoneThird"
                        value="<%= phoneThird %>"
                      />
                    </div>
                  </td>
                </tr>
                <tr>
                  <th>주소</th>
                  <td>
                    <input
                      type="text"
                      class="form-control"
                      name="userAddress"
                      value="<%= userInfo.get("ADDRESS") %>"
                    />
                    <div class="row d-flex flex-row align-items-center mt-1">
                      <div class="col">
                        <input
                          type="text"
                          class="col form-control"
                          name="userAddressAdd"
                          value="<%= userInfo.get("ADDRESSADD") %>"
                        />
                      </div>
                      <div class="col-auto">[나머지주소입력]</div>
                    </div>
                  </td>
                </tr>
              </table>
            </div>
            <div class="text-center">
              <button class="btn btn-lg btn-outline-dark fw-bold w-25 m-4" type="submit">저장</button>
            </div>
          </div>
        </div>
      </form>
    </main>
    <%@ include file= "footer.jsp" %>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
