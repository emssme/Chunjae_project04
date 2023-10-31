<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 글쓰기</title>
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
        <form action="${path}/notice/insert" method="post">
            <div class="col-12">
                <div class="card w-100">
                    <div class="card-body">
                        <div class="table-responsive project-list">
                            <table class="table project-table table-centered table-nowrap">
                                <tbody>
                                <tr>
                                    <th class="text-center">제목</th>
                                    <td><input type="text" id="title" name="title" placeholder="제목을 입력하세요" style="border: 1px solid #cbcbcb; width: 100%" required></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="font-size: 15px;">
                                        <textarea name="content" id="content" cols="100" rows="8" maxlength="800" class="single-textarea" style="height: 400px; border: 1px solid #cbcbcb"></textarea>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="btn-group float-right">
                                <a href="${path}/notice/list" class="btn btn-outline-info">목록</a>
                                <input type="submit" class="btn btn-outline-info" value="등록">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- 테이블 영역 끝 -->
</div>
<!-- 공지사항 목록 끝 -->
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>
