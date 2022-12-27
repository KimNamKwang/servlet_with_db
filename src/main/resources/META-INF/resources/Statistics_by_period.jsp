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
      <!-- ---------여기부터 main부분------------ -->
    <div class="container-fluid text-center" style="margin-top: 120px; margin-bottom: 120px;">
      <div class="row">
        <div class="col-3">
            <div class="dropdown">
                <a
                  class="btn btn-secondary dropdown-toggle btn-sm pe-5 ps-5 pt-2 pb-2"
                  data-bs-toggle="dropdown"
                  >통계</a
                >
                <ul class="dropdown-menu">
                  <a href="Statistics_by_member.html" class="dropdown-item">회원별 통계</a>
                  <a href="Statistics_by_period.html" class="dropdown-item active" >전체 통계</a>
                </ul>
            </div>
        </div>
        <div class="col-9 d-flex justify-content-start">
            <form action="" method="get">
                <span>대상기간</span> 
                <span>
                    <label for="">시작일</label>
                    <input type="date" name="start_date" id="" />
                </span> 
                <span>
                    <label for="">~</label>
                    <input type="date" name="last_date" id="" />
                </span> 
                <button type="submit" class="btn btn-sm btn-secondary">
                    조회  
                </button>
            </form>
        </div>
    </div>
      <div class="row">
       <div class="col-3"></div>
       
        <div class="col-8">
            <table class="table  border-top border-bottom border-secondary border-opacity-75"><!--borderless 는 경계선X-->
                <thead>
                     <tr class="bg-secondary bg-opacity-25">
                         <th scope=></th>
                         <th scope=>문항1</th>
                         <th scope=>문항2</th>
                         <th scope=>문항3</th>
                         <th scope=>문항4</th>
                         <th scope=>문항5</th>
                     </tr>
                 </thead>
                 <tbody>
                     <tr>
                         <th class="bg-secondary bg-opacity-25" scope=>홍길동</th>
                         <td>(1) 매우 만족</td>
                         <td>(1) 매우 만족</td>
                         <td>(1) 매우 만족</td>
                         <td>(1) 매우 만족</td>
                         <td>(1) 매우 만족</td>
                     </tr>
                     <tr>
                        <th class="bg-secondary bg-opacity-25" scope=>강형욱</th>
                        <td>(2) 만족</td>
                        <td>(2) 만족</td>
                        <td>(2) 만족</td>
                        <td>(2) 만족</td>
                        <td>(2) 만족</td>
                     </tr>
                     <tr>
                        <th class="bg-secondary bg-opacity-25" scope=>오은영</th>
                        <td>(3) 보통</td>
                        <td>(3) 보통</td>
                        <td>(3) 보통</td>
                        <td>(3) 보통</td>
                        <td>(3) 보통</td>
                     </tr>
                     <tr>
                         <th class="align-middle bg-secondary bg-opacity-25" scope=>총 합계</th>
                         <td>
                            <div>
                                (1)매우 만족-1개
                            </div>
                            <div>
                                (2) 만족 - 1개
                            </div>
                            <div>
                                (3) 보통 - 1개
                            </div>
                            <div>                               
                                (4) 불만 - 0개
                            </div>
                            <div>                           
                                (5) 매우 불만 - 0개
                            </div>
                        </td>
                         <td>
                            <div>
                            (1)매우 만족-1개
                        </div>
                        <div>
                            (2) 만족 - 1개
                        </div>
                        <div>
                            (3) 보통 - 1개
                        </div>
                        <div>                               
                            (4) 불만 - 0개
                        </div>
                        <div>                           
                            (5) 매우 불만 - 0개
                        </div>
                    </td>
                         <td>
                            <div>
                            (1)매우 만족-1개
                        </div>
                        <div>
                            (2) 만족 - 1개
                        </div>
                        <div>
                            (3) 보통 - 1개
                        </div>
                        <div>                               
                            (4) 불만 - 0개
                        </div>
                        <div>                           
                            (5) 매우 불만 - 0개
                        </div>
                    </td>
                         <td>
                            <div>
                            (1)매우 만족-1개
                        </div>
                        <div>
                            (2) 만족 - 1개
                        </div>
                        <div>
                            (3) 보통 - 1개
                        </div>
                        <div>                               
                            (4) 불만 - 0개
                        </div>
                        <div>                           
                            (5) 매우 불만 - 0개
                        </div>
                    </td>
                         <td>
                            <div>
                            (1)매우 만족-1개
                        </div>
                        <div>
                            (2) 만족 - 1개
                        </div>
                        <div>
                            (3) 보통 - 1개
                        </div>
                        <div>                               
                            (4) 불만 - 0개
                        </div>
                        <div>                           
                            (5) 매우 불만 - 0개
                        </div>
                    </td>
                     </tr>
                 </tbody>
             </table>
        </div>
    </div>
    <div class="row">
        <div class="col-3"></div>
       
        <div class="col-8">
            <table class="align-middle table border-top border-bottom border-secondary border-opacity-75">
            
                <thead>
                    <tr class="bg-secondary bg-opacity-25">
                        <th scope=></th>
                        <th scope=>문항1</th>
                        <th scope=>문항2</th>
                        <th scope=>문항3</th>
                        <th scope=>문항4</th>
                        <th scope=>문항5</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th class="bg-secondary bg-opacity-25" rowspan="2" scope=>통계</th> 
                        <td>(1) 매우 만족</td>
                        <td>(1) 매우 만족</td>
                        <td>(1) 매우 만족</td>
                        <td>(1) 매우 만족</td>
                        <td>(1) 매우 만족</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>5</td>
                        <td>5</td>
                        <td>0</td>
                        <td>0</td>
                      
                    </tr>
                    </tbody>
            </table>
      </div>
    </div>

    <!-------------- 여기까지 main부분입니다 -------------------->
    
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
