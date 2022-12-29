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
  <body class="bg-secondary bg-opacity-10">
    <main>
      <div class="container">
        <div class="fs-4 fw-bold pb-3">👥 회원 관리</div>
        <div class="text-secondary">총 3명</div>
        <div class="bg-light ps-4 pe-4 pb-1 mt-2">
          <table class="table text-center border-none">
            <thead class="border-bottom border-3">
              <tr>
                <th>이름</th>
                <th>아이디</th>
                <th>가입일</th>
                <th>설문여부</th>
                <th>관리</th>
              </tr>
            </thead>
            <% 
    ArrayList<HashMap> user_list = (ArrayList<HashMap>)request.getAttribute("user_list");
    
 %> 
            <tbody class="">
             
             <% for(int i = 0; i < user_list.size(); i++){ %>
              <%  HashMap<String, Object> user = user_list.get(i); %>
                <tr>
                  <td>
                    <a href="#modalRead" data-bs-toggle="modal" class="text-dark"
                    ><%=  user.get("NAME")  %></a>
                  </td>
                  <td><%=  user.get("USER_ID")  %></td>
                  <td>2022-12-28 12:00:00</td>
                  <td>O</td>
                  <td>
                    <a
                    href="#modalUpdate"
                    data-bs-toggle="modal"
                    class="btn btn btn-outline-dark btn-sm"
                    >수정</a
                    >
                    <button class="btn btn btn-outline-dark btn-sm">탈퇴</button>
                  </td>
                </tr>
                <%  } %>
            </tbody>
          </table>
        </div>

        <!-- 회원 상세 정보 modal -->
        <% for(int i = 0; i < user_list.size(); i++){ %>
          <%  HashMap<String, Object> user = user_list.get(i); %>
        <div class="modal fade" id="modalRead">
          <div class="modal-dialog">
            <div class="modal-content ps-3 pe-3">
              <div class="modal-header">
                <div class="fs-5 fw-bold"><%=  user.get("NAME")  %>님의 회원 정보</div>
              </div>
              <div class="modal-body">
                <table class="table">
                  <tr>
                    <th>이름</th>
                    <td><%=  user.get("NAME")  %></td>
                  </tr>
                  <tr>
                    <th>아이디</th>
                    <td><%=  user.get("USER_ID")  %></td>
                  </tr>
                  <tr>
                    <th>연락처</th>
                    <td><%=  user.get("PHONE_NUMBER")  %></td>
                  </tr>
                  <tr>
                    <th>이메일</th>
                    <td><%=  user.get("USER_EMAIL")  %></td>
                  </tr>
                  <tr>
                    <th style="border-bottom: none">주소</th>
                    <td style="border-bottom: none">
                      <div><%=  user.get("ADDRESS")  %></div>
                      <div><%=  user.get("ADDRESSADD")  %></div>
                    </td>
                  </tr>
                </table>
              </div>
              <div class="modal-footer">
                <button class="btn btn-secondary" data-bs-dismiss="modal">
                  닫기
                </button>
              </div>
            </div>
          </div>
        </div>
        <%  } %>

        <!-- 회원 정보 수정 -->
        <div class="modal fade" id="modalUpdate">
          <div class="modal-dialog">
            <div class="modal-content ps-3 pe-3">
              <div class="modal-header">
                <div class="fs-5 fw-bold">회원 정보 수정</div>
              </div>
              <div class="modal-body">
                <table class="table align-middle">
                  <tr>
                    <th>이름 *</th>
                    <td>
                      <input
                        type="text"
                        class="form-control form-control-sm w-50"
                        id="userName"
                        value="userName"
                      />
                    </td>
                  </tr>
                  <tr>
                    <th class="text-nowrap">아이디 *</th>
                    <td>
                      <input
                        type="text"
                        class="form-control form-control-sm w-50"
                        id="userId"
                        disabled
                        placeholder="userId"
                      />
                    </td>
                  </tr>
                  <tr>
                    <th class="text-nowrap">비밀번호 *</th>
                    <td>
                      <input
                        type="text"
                        class="form-control form-control-sm w-50"
                        id="userPassword"
                        value="userPassword"
                      />
                    </td>
                  </tr>
                  <tr>
                    <th>이메일</th>
                    <td class="row d-flex align-items-center">
                      <div class="col">
                        <input
                          type="text"
                          class="form-control form-control-sm"
                          id="emailId"
                          value="aaa"
                        />
                      </div>
                      @
                      <div class="col">
                        <input
                          type="text"
                          class="form-control form-control-sm"
                          id="emailPlatform"
                          value="email"
                        />
                      </div>
                      <div class="col-auto">
                        <select
                          class="form-select form-select-sm"
                          name=""
                          id="emailPlatform_s"
                        >
                          <option value="choice_email">직접입력</option>
                          <option value="@naver.com">naver.com</option>
                          <option value="@gmail.com">gmail.com</option>
                          <option value="@daum.net">daum.net</option>
                        </select>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th class="text-nowrap">연락처 *</th>
                    <td class="row">
                      <div class="col">
                        <select
                          class="form-select form-select-sm"
                          name=""
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
                      <div class="col">
                        <input
                          type="text"
                          class="form-control form-control-sm"
                          id="phoneSecond"
                          value="1234"
                        />
                      </div>
                      <div class="col-auto">-</div>
                      <div class="col">
                        <input
                          type="text"
                          class="form-control form-control-sm"
                          id="phoneThird"
                          value="5678"
                        />
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th style="border-bottom: none">주소</th>
                    <td style="border-bottom: none">
                      <input
                        type="text"
                        class="form-control form-control-sm mb-2"
                        id="addressId"
                        value="address"
                      />
                      <div class="row d-flex flex-row align-items-center">
                        <div class="col">
                          <input
                            type="text"
                            class="col form-control form-control-sm"
                            id="addressAddId"
                            value="addressAdd"
                          />
                        </div>
                        <div class="col-auto">[나머지주소입력]</div>
                      </div>
                    </td>
                  </tr>
                </table>
              </div>
              <div class="modal-footer">
                <button class="btn btn-secondary" data-bs-dismiss="modal">
                  저장
                </button>
              </div>
            </div>
          </div>
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
