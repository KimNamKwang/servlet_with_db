<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.HashMap" %>
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
  <body style="font-family: 'IBM Plex Sans KR', cursive" >

   <%
      HashMap<String, Object> userDB = (HashMap<String, Object>) session.getAttribute("userDB");
      
      String name = (String) userDB.get("NAME");
      String user_id = (String) userDB.get("USER_ID");
      String password = (String) userDB.get("PASSWORD");
      String phone_number = (String) userDB.get("PHONE_NUMBER");
      String user_email = (String) userDB.get("USER_EMAIL");
      String addressId = (String) userDB.get("ADDRESS");
      String addressAddId = (String) userDB.get("ADDRESSADD");

      //이메일 분리
      String emailId = user_email.substring(0, user_email.indexOf('@'));
      String emailPlatform = user_email.substring(user_email.indexOf('@') + 1, user_email.length());

      //전화번호 분리
        String phoneFirst = phone_number.substring(0, phone_number.indexOf('-'));
        String phoneSecond = phone_number.substring(4, phone_number.indexOf('-', 4));
        String phoneThird = phone_number.substring(9, phone_number.length());
        
    %>
    <%@ include file= "navbar_login.jsp"  %>
    <main>
      <div class="container" style="margin-top: 50px; margin-bottom: 120px">
        <div
          class="d-flex justify-content-center p-5 border-bottom border-2 border-dark"
        >
          <div class="row">
            <div
              class="col fw-bold bg-dark bg-opacity-50 text-white p-1 ps-5 pe-5 me-2"
            >
              회원정보 수정
            </div>
          </div>
        </div>

        <div>
          <form action="/myPageServlet" class="form" method="post">
          <table class="table align-middle">
            <tr>
              <th>이름</th>
              <td>
                <input
                  type="text"
                  class="form-control w-50 bg-dark bg-opacity-25 text-white fw-bold"
                  name="userName"
                  id="userName"
                  value="<%= name %>"
                />
              </td>
            </tr>
            <tr>
              <th>아이디</th>
              <td>
                <input
                  type="text"
                  class="form-control w-50 bg-dark bg-opacity-25 text-white fw-bold"
                  name="userId"
                  id="userId"
                  value="<%= user_id %>"
                  readonly
                />
              </td>
            </tr>
            <tr>
              <th>비밀번호</th>
              <td>
                <input
                  type="password"
                  class="form-control w-50 bg-dark bg-opacity-25 text-white fw-bold"
                  name="userPassword"
                  id="userPassword"
                  value="<%= password %>"
                />
              </td>
            </tr>
            <tr>
              <th>이메일</th>
              <td class="row d-flex align-items-center">
                <div class="col">
                  <input
                    type="text"
                    class="form-control w-50 bg-dark bg-opacity-25 text-white fw-bold"
                    name="emailId"
                    id="emailId"
                    value="<%= emailId %>"
                  />
                </div>
                @
                <div class="col">
                  <input
                    type="text"
                    class="form-control w-50 bg-dark bg-opacity-25 text-white fw-bold"
                    name="emailPlatform"
                    id="emailPlatform"
                    value="<%= emailPlatform %>"
                  />
                </div>
              </td>
            </tr>
            <tr>
              <th>연락처 *</th>
              <td class="row">
                <div class="col-auto">
                  <select
                    class="form-select bg-dark bg-opacity-25 text-white fw-bold"
                    name="phoneFirst"
                    id="phoneFirst"
                  >
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                  </select>
                </div>
                <div class="col-auto">-</div>
                <div class="col-auto">
                  <input
                    type="text"
                    class="form-control bg-dark bg-opacity-25 text-white fw-bold"
                    id="phoneSecond"
                    name="phoneSecond"
                    value="<%= phoneSecond %>"
                  />
                </div>
                <div class="col-auto">-</div>
                <div class="col-auto">
                  <input
                    type="text"
                    class="form-control bg-dark bg-opacity-25 text-white fw-bold"
                    id="phoneThird"
                    name="phoneThird"
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
                  class="form-control bg-dark bg-opacity-25 text-white fw-bold mb-1"
                  id="addressId"
                  name="addressId"
                  value="<%= addressId %>"
                />
                <div class="row d-flex flex-row align-items-center">
                  <div class="col">
                    <input
                      type="text"
                      class="col form-control bg-dark bg-opacity-25 text-white fw-bold"
                      id="addressAddId"
                      name="addressAddId"
                      value="<%= addressAddId %>"
                    />
                  </div>
                  <div class="col-auto">[나머지주소입력]</div>
                </div>
              </td>
            </tr>
          </table>
        </div>
        <div class="text-center">
          <button type="submit" class="btn btn-lg btn-outline-dark fw-bold w-25 m-4"">정보 수정</button>
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
