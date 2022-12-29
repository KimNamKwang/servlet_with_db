<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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
  <body>
    <!------------------------ 여기부터 main부분 ------------------------------>
    <main>
      <div
        class="container-fluid text-center"
        style="margin-top: 120px; margin-bottom: 120px"
      >
        <div class="row mt-4">
          <div class="col-2">
            <div class="dropdown">
              <a
                class="btn btn-secondary dropdown-toggle btn-sm pe-5 ps-5 pt-2 pb-2"
                data-bs-toggle="dropdown"
                >통계</a
              >
              <ul class="dropdown-menu">
                <a href="Statistics_by_member.html" class="dropdown-item active"
                  >회원별 통계</a
                >
                <a href="Statistics_by_period.html" class="dropdown-item"
                  >월별 통계</a
                >
              </ul>
            </div>
          </div>

          <div class="col-9">
            <table
              class="align-middle table border-top border-bottom border-secondary border-opacity-75"
            >
              <!--borderless 는 경계선X-->
              <form action="Statistics_by_member.html" method="get">
                <tr>
                  <th class="bg-secondary bg-opacity-25" rowspan="2">설문일</th>
                  <td rowspan="2">2015-03-01</td>
                  <th class="bg-secondary bg-opacity-25" rowspan="4">
                    대상기간
                  </th>
                  <th rowspan="4">
                    <label for="">시작일</label>
                    <input type="date" name="start_date" id="" />
                    <label for="">~</label>
                    <input type="date" name="last_date" id="" />

                    <button type="submit" class="btn btn-sm btn-secondary">
                      조회
                    </button>
                  </th>
                </tr>
                <tr></tr>
                <tr>
                  <th class="bg-secondary bg-opacity-25">설문유형</th>
                  <td>
                    <div>
                      <label for="" class="form-label">설문명</label>
                      <select
                        class="form-select"
                        name="survey_name"
                        aria-label=""
                      >
                        <option selected>원하시는 설문을 골라주세요</option>
                        <option value="M01">
                          홀리몰리 헬스장 설문 만족도 조사
                        </option>
                        <!-- 버튼이 아닌 옵션 선택으로 아래에 collapse를 할 수는 없는지 -->
                        <option value="M02">OT 만족도 조사</option>
                        <option value="M03">PT 만족도 조사</option>
                        <!--selected를 어디다 주느냐에 따라 처음 나오는 선택지가 다름.-->
                      </select>
                    </div>
                  </td>
                </tr>
              </form>
            </table>
          </div>
          <div class="col-2"></div>
          <div class="col-9">
            <table
              class="align-middle table border-top border-bottom border-secondary border-opacity-75"
            >
              <tr class="bg-secondary bg-opacity-25">
                <th colspan="7">설문내용</th>
                <th colspan="2">답문</th>
              </tr>
              <tr class="text-start">
                <th colspan="7">
                  1. 상담시 친절하게 안내 받으시고 궁금한 사항에 대한 답변이
                  만족스러우셨습니까?
                </th>
                <th colspan="2">(1) 매우만족</th>
              </tr>
              <tr class="text-start">
                <th colspan="7">
                  2. PT(1:1 퍼스널 트레이닝) 진행시 친절하게 안내 받으시고
                  궁금한 사항에 대한 답변이 만족스러우셨습니까?
                </th>
                <th colspan="2">(2) 만족</th>
              </tr>
              <tr class="text-start">
                <th colspan="7">
                  3. OT(1:1 무료 PT) 진행시 친절하게 안내 받으시고 궁금한 사항에
                  대한 답변이 만족스러우셨습니까?
                </th>
                <th colspan="2">(3) 보통</th>
              </tr>
              <tr class="text-start">
                <th colspan="7">
                  4. 헬스장 오픈, 마감 시간을 정확히 준수하였습니까?
                </th>
                <th colspan="2">(4) 불만족</th>
              </tr>
              <tr class="text-start">
                <th colspan="7">5. 전반적인 센터 이용이 만족스러우셨습니까?</th>
                <th colspan="2">(5) 매우불만족</th>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </main>
    <!------------------------ 여기까지 main부분 입니다 ------------------------------>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
