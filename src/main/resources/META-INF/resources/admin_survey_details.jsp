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
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
  </head>
  <body style="font-family: 'IBM Plex Sans KR', cursive"  class="bg-secondary bg-opacity-10">
    <%@ include file= "navbar_login.jsp"  %>
    <div class="container">
      <div class="fs-4 fw-bold pb-3  pt-5 mt-4">📄 설문 관리</div>
      <div class="bg-light ps-4 pe-4 pb-1 mt-2 mb-2">
        <table class="table align-middle">
          <form action="/Admin/surveysServlet" onsubmit="return validateForm()" method="get">
            <% 
            HashMap<String, Object> surveyInfo = (HashMap<String, Object>)request.getAttribute("surveyInfo");
                
                %> 
            <tr>
            <th>설문조사명 *</th>
            <td>
              <input
                type="text"
                class="form-control form-control-sm"
                id=""
                value="홀리 피트니스 만족도 설문 조사"
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
                value="피트니스의 전반적인 부분에 대한 만족도 조사"
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
                value="2022-12-01"
                min="2022-12-29"
              />
              ~ 마감일시
              <input
                type="date"
                name=""
                id=""
                value="2022-12-31"
                min="2022-12-01"
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
                  href=""
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
                    
                    <tr>
                      <td>1. 상담시 친절하게 안내 받으시고 궁금한 사항에 대한 답변이 만족스러우셨습니까?</td>
                      <td>
                        (1)매우만족
                        (2)만족
                        (3)보통
                        (4)불만
                        (5)매우불만
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
                    <tr>
                      <td>2. PT(1:1 퍼스널 트레이닝) 진행시 친절하게 안내 받으시고 궁금한 사항에 대한 답변이 만족스러우셨습니까?</td>
                      <td>
                        (1)매우만족
                        (2)만족
                        (3)보통
                        (4)불만
                        (5)매우불만
                      </td>
                      <td>
                        <div class="row me-2">
                          <div class="col-6">
                            <a
                              href="#collapseTarget2"
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
                   
                    <tr>
                      <td>
                        <div class="collapse" id="collapseTarget2">
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
                        <div class="row collapse" id="collapseTarget2">
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
                    <tr>
                      <td>3. OT(1:1 무료 PT) 진행시 친절하게 안내 받으시고 궁금한 사항에 대한 답변이 만족스러우셨습니까?</td>
                      <td>
                        (1)매우만족
                        (2)만족
                        (3)보통
                        (4)불만
                        (5)매우불만
                      </td>
                      <td>
                        <div class="row me-2">
                          <div class="col-6">
                            <a
                              href="#collapseTarget3"
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
                   
                    <tr>
                      <td>
                        <div class="collapse" id="collapseTarget3">
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
                        <div class="row collapse" id="collapseTarget3">
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
                    <tr>
                      <td>4. 헬스장 오픈, 마감시 시간을 정확히 준수하였습니까?</td>
                      <td>
                        (1)매우만족
                        (2)만족
                        (3)보통
                        (4)불만
                        (5)매우불만
                      </td>
                      <td>
                        <div class="row me-2">
                          <div class="col-6">
                            <a
                              href="#collapseTarget4"
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
                   
                    <tr>
                      <td>
                        <div class="collapse" id="collapseTarget4">
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
                        <div class="row collapse" id="collapseTarget4">
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
                    <tr>
                      <td>5. 전반적인 센터 이용이 만족스러우셨습니까?</td>
                      <td>
                        (1)매우만족
                        (2)만족
                        (3)보통
                        (4)불만
                        (5)매우불만
                      </td>
                      <td>
                        <div class="row me-2">
                          <div class="col-6">
                            <a
                              href="#collapseTarget5"
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
                   
                    <tr>
                      <td>
                        <div class="collapse" id="collapseTarget5">
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
                        <div class="row collapse" id="collapseTarget5">
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
    </div>
    <%@ include file= "footer.jsp" %>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
