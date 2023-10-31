<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자료실 상세보기</title>
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
                        <h2>자료실</h2>
                        <div class="page_link">
                            <a href="${path}">Home</a>
                            <a href="${path}/fileboard/list">공지사항</a>
                            <a href="${path}/fileboard/detail?articleno=${fileboard.articleno}">상세보기</a>
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
                                <td>${fileboard.title}</td>
                            </tr>
                            <tr>
                                <th class="text-center">작성자</th>
                                <td>${fileboard.id}</td>
                            </tr>
                            <tr>
                                <th class="text-center">작성일</th>
                                <td>${fileboard.regdate}</td>
                                <th class="text-center">조회수</th>
                                <td>${fileboard.visited}</td>
                                <th class="text-center">추천수</th>
                                <td>${fileboard.rec}</td>
                            </tr>
                            <tr>
                                <td colspan="6" style="font-size: 15px;">${fileboard.content}</td>
                            </tr>
                            <tr>
                                <th colspan="6" style="font-size: 15px;">학습자료(클릭하여 다운로드)</th>
                            </tr>
                            <tr>
                                <td colspan="6" style="font-size: 15px;">
                                    <c:forEach var="item" items="${fileboard2}">
                                        <a href="${pageContext.request.contextPath}/resources/upload/${item.saveFolder}/${item.saveFile}" download="${item.originFile }" style="margin-right: 20px"><i class="fa-solid fa-file"></i> ${item.originFile } </a>
                                    </c:forEach>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <c:if test="${! empty sid && sid eq 'admin'}">
                            <div class="btn-group float-right">
                                <a href="${path}/fileboard/list" class="btn btn-outline-info">목록</a>
                                <a href="${path}/fileboard/edit?articleno=${fileboard.articleno}" class="btn btn-outline-info">수정</a>
                                <a href="${path}/fileboard/delete?articleno=${fileboard.articleno}" class="btn btn-outline-info">삭제</a>
                            </div>
                        </c:if>
                        <c:if test="${! empty sid && sid ne 'admin'}">
                            <div class="btn-group float-right">
                                <a href="${path}/fileboard/list" class="btn btn-outline-info">목록</a>
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
