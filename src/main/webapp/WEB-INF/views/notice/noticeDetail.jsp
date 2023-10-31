<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세보기</title>
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
                        <h2>공지사항</h2>
                        <div class="page_link">
                            <a href="${path}">Home</a>
                            <a href="${path}/notice/list">공지사항</a>
                            <a href="${path}/notice/detail?seq=${detail.seq}">상세보기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 배너 끝 -->
<!-- 공지사항 목록 시작 -->
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
                                <td>${detail.regdate}</td>
                                <th class="text-center">조회수</th>
                                <td>${detail.visited}</td>
                            </tr>
                            <tr>
                                <td colspan="6" style="font-size: 15px;">${detail.content}</td>
                            </tr>
                            </tbody>
                        </table>
                        <c:if test="${! empty sid && sid eq 'admin'}">
                        <div class="btn-group float-right">
                            <a href="${path}/notice/list" class="btn btn-outline-info">목록</a>
                            <a href="${path}/notice/edit?seq=${detail.seq}" class="btn btn-outline-info">수정</a>
                            <a href="${path}/notice/delete?seq=${detail.seq}" class="btn btn-outline-info">삭제</a>
                        </div>
                        </c:if>
                        <c:if test="${! empty sid && sid ne 'admin'}">
                            <div class="btn-group float-right">
                                <a href="${path}/notice/list" class="btn btn-outline-info">목록</a>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 테이블 영역 끝 -->
</div>
<!-- 공지사항 목록 끝 -->
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>
