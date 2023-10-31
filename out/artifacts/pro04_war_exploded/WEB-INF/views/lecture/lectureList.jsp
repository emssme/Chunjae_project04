<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>강의 목록</title>
  <jsp:include page="../setting/head.jsp"/>
  <style>
    .section {
      padding: 100px 0;
      position: relative;
    }
    .gray-bg {
      background-color: #ebf4fa;
    }
    /* Blog
    ---------------------*/
    .blog-grid {
      margin-top: 15px;
      margin-bottom: 15px;
    }
    .blog-grid .blog-img {
      position: relative;
      border-radius: 5px;
      overflow: hidden;
    }
    .blog-grid .blog-img .date {
      position: absolute;
      background: #3a3973;
      color: #ffffff;
      padding: 8px 15px;
      left: 0;
      top: 10px;
      font-size: 14px;
    }
    .blog-grid .blog-info {
      box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
      border-radius: 5px;
      background: #ffffff;
      padding: 20px;
      margin: -30px 20px 0;
      position: relative;
    }
    .blog-grid .blog-info h5 {
      font-size: 22px;
      font-weight: 500;
      margin: 0 0 10px;
    }
    .blog-grid .blog-info h5 a {
      color: #3a3973;
    }
    .blog-grid .blog-info p {
      margin: 0;
    }
    .blog-grid .blog-info .btn-bar {
      margin-top: 20px;
    }

    .px-btn-arrow {
      padding: 0 50px 0 0;
      line-height: 20px;
      position: relative;
      display: inline-block;
      color: #fe4f6c;
      -moz-transition: ease all 0.3s;
      -o-transition: ease all 0.3s;
      -webkit-transition: ease all 0.3s;
      transition: ease all 0.3s;
    }


    .px-btn-arrow .arrow {
      width: 13px;
      height: 2px;
      background: currentColor;
      display: inline-block;
      position: absolute;
      top: 0;
      bottom: 0;
      margin: auto;
      right: 25px;
      -moz-transition: ease right 0.3s;
      -o-transition: ease right 0.3s;
      -webkit-transition: ease right 0.3s;
      transition: ease right 0.3s;
    }

    .px-btn-arrow .arrow:after {
      width: 8px;
      height: 8px;
      border-right: 2px solid currentColor;
      border-top: 2px solid currentColor;
      content: "";
      position: absolute;
      top: -3px;
      right: 0;
      display: inline-block;
      -moz-transform: rotate(45deg);
      -o-transform: rotate(45deg);
      -ms-transform: rotate(45deg);
      -webkit-transform: rotate(45deg);
      transform: rotate(45deg);
    }
  </style>
</head>
<body>
<!-- 헤더 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 끝 -->
<!-- 배너 시작 -->
<section class="banner_area">
  <div class="banner_inner d-flex align-items-center">
    <div class="overlay"></div>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-6">
          <div class="banner_content text-center">
            <h2>강의 목록</h2>
            <div class="page_link">
              <a href="${path}">Home</a>
              <a href="${path}/lecture/list">강의</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- 배너 끝 -->
<!-- 마감임박 강의 & 오픈 예정 강의 -->
<section class="container mb-100">
  <div class="row">
    <div class="col-lg-6 col-md-12">
      <h2>인기 강의</h2>
      <table class="table" id="notice-table">
        <thead>
        <tr>
          <th width="200">제목</th>
          <th>기간</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${popLectureList}" var="pop" varStatus="status">
          <tr class="table-row">
            <td class="text-center">
              <a href="${path}/lecture/detail?lno=${pop.lno}">${pop.lname}</a>
            </td>
            <td class="text-center">~${pop.edate}</td>
          </tr>
        </c:forEach>
        <!-- 추가 데이터 행 -->
        <c:if test="${empty popLectureList}">
          <tr>
            <td colspan="2" class="text-center"><span
                    style=" font-size: 20px;">마감임박 강의가 없습니다.</span></td>
          </tr>
        </c:if>
        </tbody>
      </table>
    </div>
    <div class="col-lg-6 col-md-12 mt-lg-0 mt-md-4">
      <h2>오픈예정 강의</h2>
      <table class="table" id="new-table">
        <thead>
        <tr>
          <th width="200">제목</th>
          <th>기간</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${newLectureListt}" var="new" varStatus="status">
          <tr class="table-row">
            <td class="text-center">
              <a href="${path}/lecture/detail?lno=${new.lno}">${new.lname}</a>
            </td>
            <td class="text-center">${new.sdate}~</td>
          </tr>
        </c:forEach>
        <!-- 오픈 예정 강의가 없을때 -->
        <c:if test="${empty newLectureListt}">
          <tr>
            <td colspan="2" class="text-center"><span
                    style=" font-size: 20px;">오픈예정 강의가 없습니다.</span></td>
          </tr>
        </c:if>
        </tbody>
      </table>
    </div>
  </div>
</section>
</div>
</section>
<!-- 강좌 목록 시작 -->
<section class="section gray-bg" id="blog">
  <div class="course_details_area mb-5 mt-5">
    <div class="container">
      <!-- 과목 목록 -->
      <div class="row justify-content-center">
        <div class="col-lg-9 text-center">
          <div class="section-title">
            <h2>강좌 목록</h2>
            <p>최고의 강사진과 함께하세요!</p>
          </div>
        </div>
        <div class="col-lg-10 text-center">
          <div class="btn-group">
            <c:if test="${sub.scode eq curSubject}">
              <a href="${path}/lecture/list" class="btn primary-btn2">전체</a>
            </c:if>
            <c:if test="${sub.scode ne curSubject}">
              <a href="${path}/lecture/list" class="btn primary-btn">전체</a>
            </c:if>
            <c:forEach var="sub" items="${subjects}">
              <c:if test="${sub.scode eq curSubject}">
                <a href="${path}/lecture/list?scode=${sub.scode}" class="btn primary-btn2">${sub.sname}</a>
              </c:if>
              <c:if test="${sub.scode ne curSubject}">
                <a href="${path}/lecture/list?scode=${sub.scode}" class="btn primary-btn">${sub.sname}</a>
              </c:if>
            </c:forEach>
          </div>
        </div>
        <div class="col-lg-12 mt-4">
          <div class="row">
            <!-- 강좌 목록-->
            <c:forEach items="${lectureList }" var="list" varStatus="status">
              <div class="col-lg-4">
                <div class="blog-grid">
                  <div class="blog-img" style="width: 350px; height: 280px;">
                    <div class="date">${list.sname}</div>
                    <a href="${path}/lecture/detail?lno=${list.lno}">
                      <img src="${path}/resources/upload/lecture/${list.saveFile}" title alt="강의 이미지">
                    </a>
                  </div>
                  <div class="blog-info">
                    <h5>
                      <a href="${path}/lecture/detail?lno=${list.lno}">${list.lname}</a>
                    </h5>
                    <p>${list.tname} 선생님</p>
                    <p>${list.sdate} ~ ${list.edate}</p>
                    <p>#{list.lprice}원</p>
                    <a href="${path}/lecture/detail?lno=${list.lno}" class="btn-bar" style="color: #fe4f6c;">강좌 상세보기<i class="fa-solid fa-arrow-right"></i></a>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
          <!-- 페이지 시작 -->
          <div class="pt-3">
            <ul class="blog-pagination justify-content-center d-flex">
              <c:if test="${curPage > 5}">
                <li class="page-item">
                  <a href="${path}/lecture/list?page=${page.blockStartNum - 1}<c:if test="${!empty scode}">&cate=${scode}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                     class="page-link"><i class="fa-solid fa-arrow-left"></i></a>
                </li>
              </c:if>
              <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                <c:choose>
                  <c:when test="${i == curPage}">
                    <li class="page-item">
                      <a href="${path}/lecture/list?page=${i}<c:if test="${!empty curSubject}">&scode=${curSubject}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                         class="page-link active" aria-label="Page ${i}"
                         aria-current="page" style="    background-color: #fdc632;">${i}</a>
                    </li>
                  </c:when>
                  <c:otherwise>
                    <li  class="page-item">
                      <a href="${path}/lecture/list?page=${i}<c:if test="${!empty curSubject}">&scode=${curSubject}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                         class="page-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                    </li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
              <c:if test="${page.blockLastNum < page.totalPageCount}">
                <li class="page-item">
                  <a href="${path}/lecture/list?page=${page.blockLastNum + 1}<c:if test="${!empty scode}">&scode=${scode}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                     class="page-link">
                    <i class="fa-solid fa-arrow-right"></i>
                  </a>
                </li>
              </c:if>
            </ul>
          </div>
          <!-- 페이지 끝 -->
        </div>
      </div>
    </div>
  </div>
</section>
<!-- 공지사항 목록 끝 -->
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>