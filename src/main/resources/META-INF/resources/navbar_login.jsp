<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- ----------여기부터 header------------ -->
<nav class="navbar bg-dark navbar-dark fixed-top navbar-expand-sm">
  <div class="container-fluid">
    <a href="/index.jsp" class="navbar-brand ms-5">
      <div style="font-family: 'Zen Dots', cursive" class="text-white">
        Holy Fitness
      </div>
    </a>
    <!--collapse의 경우에는 토글이 아니라 토글러. navbar-toggler -->
    <a href="#collapseID" class="navbar-toggler" data-bs-toggle="collapse"
      ><span class="navbar-toggler-icon"></span
    ></a>
    <div class="navbar-nav">
      <div class="collapse navbar-collapse me-5" id="collapseID">
        <a href="Survey.html" class="nav-link">설문하기</a>
        <div class="nav-item dropdown">
          <a
            href="#dropdownTarget"
            class="nav-link dropdown-toggle"
            data-bs-toggle="dropdown"
            >통계보기</a
          >
          <div id="dropdownTarget" class="dropdown-menu">
            <a
              href="Statistics_by_member.html"
              class="dropdown-item nav-link text-dark"
              >개인 설문 조회</a
            >
            <a
              href="Statistics_by_period.html"
              class="dropdown-item nav-link text-dark"
              >전체 설문 조회</a
            >
          </div>
        </div>
        <a href="Login.html" class="nav-link">Login</a>
        <a href="/join/agreementServlet" class="nav-link">Join</a>
        <a href="index.html" class="nav-link">마이페이지</a>
      </div>
    </div>
  </div>
</nav>
