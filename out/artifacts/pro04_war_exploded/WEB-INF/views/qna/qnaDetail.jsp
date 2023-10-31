<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>질문 및 답변 상세보기</title>
  <jsp:include page="../setting/head.jsp"/>
  <style>
    table tr {border-bottom: 1px solid #dee2e6; border-top: 1px solid #dee2e6;}
    table th {width: 10%}
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
            <h2>질문 및 답변</h2>
            <div class="page_link">
              <a href="${path}">Home</a>
              <a href="${path}/qna/list">질문 및 답변</a>
              <a href="${path}/qna/detail?qno=${detail.qno}">상세보기</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- 배너 끝 -->
<!-- 질문 및 답변 목록 시작 -->
<div class="course_details_area mb-5 mt-5">
  <div class="container">
    <!-- 테이블 영역 시작 -->
    <div class="col-12">
      <div class="card w-100">
        <div class="card-body">
          <div class="table-responsive project-list">
            <table class="table project-table table-centered table-nowrap">
              <tbody>
              <tr>
                <th class="text-center">제목</th>
                <td>${detail.title}</td>
              </tr>
              <tr>
                <th class="text-center">작성일</th>
                <td>${detail.resdate}</td>
                <th class="text-center">작성자</th>
                <td>${detail.author}</td>
              </tr>
              <tr>
                <td colspan="6" style="font-size: 15px;">${detail.content}</td>
              </tr>
              </tbody>
            </table>
            <div class="btn-group float-right">
              <c:if test="${sid eq 'admin' && detail.lev eq 0}">
                <a href="${path}/qna/answerInsert?qno=${detail.qno}" class="btn btn-outline-info">답변등록</a>
                <a href="${path}/qna/list?page=${curPage}" class="btn btn-outline-info">목록</a>
                <a href="${path}/qna/edit?qno=${detail.qno}" class="btn btn-outline-info">수정</a>
                <a href="${path}/qna/delete?qno=${detail.qno}" class="btn btn-outline-info">삭제</a>
              </c:if>
              <c:if test="${sid eq 'admin' && detail.lev eq 1}">
                <a href="${path}/qna/list?page=${curPage}" class="btn btn-outline-info">목록</a>
                <a href="${path}/qna/edit?qno=${detail.qno}" class="btn btn-outline-info">수정</a>
                <a href="${path}/qna/delete?qno=${detail.qno}" class="btn btn-outline-info">삭제</a>
              </c:if>
              <c:if test="${sid ne 'admin' && sid ne detail.author}">
                <a href="${path}/qna/list?page=${curPage}" class="btn btn-outline-info">목록</a>
              </c:if>
              <c:if test="${sid eq detail.author && sid ne 'admin'}">
                <a href="${path}/qna/list?page=${curPage}" class="btn btn-outline-info">목록</a>
                <a href="${path}/qna/edit?qno=${detail.qno}" class="btn btn-outline-info">수정</a>
                <a href="${path}/qna/delete?qno=${detail.qno}" class="btn btn-outline-info">삭제</a>
              </c:if>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 테이블 영역 끝 -->
</div>
<!-- 질문 및 답변 목록 끝 -->
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>
