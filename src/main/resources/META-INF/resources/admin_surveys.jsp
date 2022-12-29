<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
              <tr>
                <td class="text-center">1</td>
                <td>홀리 피트니스 만족도 설문 조사</td>
                <td>피트니스의 전반적인 부분에 대한 만족도 조사</td>
                <td class="text-center">
                  <span class="text-nowrap">2022-12-01</span>
                  <span class="text-nowrap">~ 2022-12-31</span>
                </td>
                <td class="text-nowrap">2022-12-01</td>
                <td>
                  <div class="text-center">
                    <button
                      class="btn btn-outline-dark btn-sm text-nowrap"
                      onclick="location.href='./admin_suvey.html'"
                    >
                      수정
                    </button>
                    <button
                      class="btn btn-outline-dark btn-sm text-nowrap"
                      onclick="location.href='./admin_suvey.html'"
                    >
                      삭제
                    </button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="text-end">
          <button
            class="btn btn-secondary btn-sm text-nowrap"
            onclick="location.href='./admin_suvey.html'"
          >
            등록
          </button>
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
