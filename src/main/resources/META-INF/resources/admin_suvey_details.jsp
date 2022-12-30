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
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
  </head>
  <body class="bg-secondary bg-opacity-10">
    <div class="container">
      <div class="fs-4 fw-bold pb-3">📄 설문 관리</div>
      <div class="bg-light ps-4 pe-4 pb-1 mt-2 mb-2">
        <table class="table align-middle">
          <form action="/Admin/surveysServlet" onsubmit="return validateForm()" method="get">
            <% HashMap<String, Object> serveyInfo = (HashMap<String, Object>)request.getAttribute("serveyInfo"); %>
            <tr>
            <th>설문조사명 *</th>
            <td>
              <input
                type="text"
                class="form-control form-control-sm"
                id=""
                value="<%= serveyInfo.get("SERVEY_NAME") %>"
                required
              />
            </td>
          </tr>
          <tr>
            <th class="text-nowrap">설문내용</th>
            <td>
              <input
                type="text"
                class="form-control form-control-sm"
                id=""
                value="<%= serveyInfo.get("SERVEY_COMMENT") %>"
              />
            </td>
          </tr>
          <tr>
            <th class="text-nowrap">설문기간 *</th>
            <td>
              시작일시
              <input
                type="date"
                name=""
                id=""
                value="<%= serveyInfo.get("SERVEY_START_DATE") %>"
                min="2022-12-29"
              />
              ~ 마감일시
              <input
                type="date"
                name=""
                id=""
                value="<%= serveyInfo.get("SERVEY_END_DATE") %>"
                min="<%= serveyInfo.get("SERVEY_START_DATE") %>"
              />
            </td>
          </tr>
          <tr>
            <th
              class="text-nowrap d-flex align-items-center"
              style="border-bottom: none"
            >
              설문항목관리 *
            </th>
            <td>
              <div class="text-end">
                <a
                  href="#modalContent"
                  data-bs-toggle="modal"
                  class="btn btn-secondary btn-sm"
                  >새 항목 추가</a
                >
              </div>
              <div class="mt-2" style="width: 100%">
                <table class="table table-bordered">
                  <thead>
                    <tr class="text-center" col="4">
                      <th class="text-nowrap">문항내용</th>
                      <th class="text-nowrap">답항내용</th>
                      <th class="text-nowrap">수정/삭제</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% 
                      ArrayList<HashMap> question_answer_list = (ArrayList<HashMap>)request.getAttribute("question_answer_list"); 
                    %>
                    <% 
                        for(int i = 0; i < question_answer_list.size(); i++) { 
                          HashMap<String, Object> question_answer = question_answer_list.get(i);
                        %>
                    <tr>
                      <td><%= question_answer.get("QUESTION") %></td>
                      <td>
                        
                        답항<%= question_answer.get("ORDERS") %>:
                        <%= question_answer.get("ANSWER") %>
                    
                      </td>
                      <td>
                        <div class="row me-2">
                          <div class="col-6">
                            <a
                              href="#collapseTarget"
                              data-bs-toggle="collapse"
                              class="btn btn-outline-dark btn-sm"
                            >
                              <i class="material-icons">edit</i>
                            </a>
                          </div>
                          <div class="col-6">
                            <button class="btn btn-outline-dark btn-sm">
                              <i class="material-icons">close</i>
                            </button>
                          </div>
                        </div>
                      </td>
                    </tr>
                    <% } %>
                    <tr>
                      <td>
                        <div class="collapse" id="collapseTarget">
                          <textarea
                            name=""
                            id=""
                            class="form-control"
                            cols=""
                            rows="5"
                            placeholder="수정하실 문항 내용을 입력하세요"
                          ></textarea>
                        </div>
                      </td>
                      <td colspan="6">
                        <div class="row collapse" id="collapseTarget">
                          <div class="col">
                            <input
                              type="text"
                              class="form-control m-0"
                              placeholder="답변항목"
                            />
                          </div>
                          <div class="col-auto">
                            <button class="btn btn-outline-dark btn-sm">
                              <i class="material-icons">close</i>
                            </button>
                          </div>
                          <div class="col-auto">
                            <button class="btn btn-outline-dark btn-sm">
                              <i class="material-icons">add</i>
                            </button>
                          </div>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </td>
          </tr>
        </table>
      </div>
      <div class="text-end">
        <button type="submit" class="btn btn-secondary">완료</button>
      </div>
    </form>

      <!-- 새 항목 추가 modal -->
      <div class="modal fade" id="modalContent">
        <div class="modal-dialog">
          <div class="modal-content ps-3 pe-3">
            <div class="modal-header">
              <div class="fs-5 fw-bold">설문조사 항목 추가</div>
            </div>
            <div class="modal-body">
              <table class="table">
                <tr>
                  <th>문항내용</th>
                  <td>
                    <textarea
                      class="form-control"
                      name=""
                      id=""
                      cols="30"
                      rows="3"
                    ></textarea>
                  </td>
                </tr>
                <tr>
                  <th>답항목록</th>
                  <div>
                    <td>
                      <div class="row">
                        <div class="col">
                          <input
                            type="text"
                            class="form-control m-0"
                            placeholder="답변항목"
                          />
                        </div>
                        <div class="col-auto">
                          <button class="btn btn-outline-dark btn-sm">
                            <i class="material-icons">close</i>
                          </button>
                        </div>
                        <div class="col-auto">
                          <button class="btn btn-outline-dark btn-sm">
                            <i class="material-icons">add</i>
                          </button>
                        </div>
                      </div>
                    </td>
                  </div>
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

      <!-- 항목 수정 modal -->
      <div class="modal fade" id="modalUpdate">
        <div class="modal-dialog">
          <div class="modal-content ps-3 pe-3">
            <div class="modal-header">
              <div class="fs-5 fw-bold">설문조사 항목 수정</div>
            </div>
            <div class="modal-body">
              <table class="table">
                <tr>
                  <th>문항내용</th>
                  <td>
                    <textarea
                      class="form-control"
                      name=""
                      id=""
                      cols="30"
                      rows="3"
                    >
1. 문항내용문항내용문항내용문항내용문항내용?</textarea
                    >
                  </td>
                </tr>
                <tr>
                  <th>답항목록</th>
                  <div>
                    <td>
                      <div class="row">
                        <div class="col">
                          <input
                            type="text"
                            class="form-control m-0"
                            value="매우만족"
                          />
                        </div>
                        <div class="col-auto">
                          <button class="btn btn-outline-dark btn-sm">
                            <i class="material-icons">close</i>
                          </button>
                        </div>
                        <div class="col-auto">
                          <button class="btn btn-outline-dark btn-sm">
                            <i class="material-icons">add</i>
                          </button>
                        </div>
                      </div>
                    </td>
                  </div>
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
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
