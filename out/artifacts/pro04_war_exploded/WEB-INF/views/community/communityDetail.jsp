<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 상세보기</title>
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
                        <h2>커뮤니티</h2>
                        <div class="page_link">
                            <a href="${path}">Home</a>
                            <a href="${path}/community/list">커뮤니티</a>
                            <a href="${path}/community/detail?articleno=${community.articleno}">상세보기</a>
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
                                <th class="text-center">카테고리</th>
                                <td>${detail.cateName}</td>
                            </tr>
                            <tr>
                                <th class="text-center">제목</th>
                                <td>${detail.title}</td>
                            </tr>
                            <tr>
                                <th class="text-center">작성자</th>
                                <td>${detail.author}</td>
                            </tr>
                            <tr>
                                <th class="text-center">작성일</th>
                                <td>${detail.resdate}</td>
                                <th class="text-center">조회수</th>
                                <td>${detail.cnt}</td>
                            </tr>
                            <tr>
                                <td colspan="6" style="font-size: 15px;">${detail.content}</td>
                            </tr>
                            </tbody>
                        </table>
                        <c:if test="${(sid eq 'admin') or (sid eq detail.author)}">
                            <div class="btn-group float-right">
                                <a href="${path}/community/list" class="btn btn-outline-info">목록</a>
                                <a href="${path}/community/edit?cno=${detail.cno}" class="btn btn-outline-info">수정</a>
                                <a href="${path}/community/delete?cno=${detail.cno}" class="btn btn-outline-info">삭제</a>
                            </div>
                        </c:if>
                        <!-- 댓글 영역 시작 -->
                        <div class="comments-area">
                            <!-- 로그인 한 사람만 댓글 입력창 보이게 -->
                            <c:if test="${!empty sid}">
                                <div class="comment-form">
                                    <form action="${path}/comment/insert" method="post">
                                        <div class="form-group">
                                            <div class="form-group form-inline">
                                                <input type="hidden" id="cno" name="cno" value="${detail.cno}">
                                                <input type="hidden" id="page" name="page" value="${curPage}">
                                                <c:if test="${!empty cate}">
                                                    <input type="hidden" id="cate" name="cate" value="${cate}">
                                                </c:if>
                                                <c:if test="${!empty keyword}">
                                                    <input type="hidden" id="type" name="type" value="${type}">
                                                    <input type="hidden" id="keyword" name="keyword" value="${keyword}">
                                                </c:if>
                                                <textarea name="content" id="content" cols="30" rows="100" maxlength="800" class="col-11 form-control" placeholder="댓글을 입력해주세요"></textarea>
                                                <input type="submit" value="등록" class="btn btn-info col-1" style="height: 140px;">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </c:if>
                            <!-- 댓글 목록 -->
                            <div class="comment-list pl-5 pr-5">
                                <c:forEach items="${commentList}" var="comment">
                                    <div class="single-comment justify-content-between pb-4">
                                        <div class="d-flex justify-content-between user">
                                            <div class="col-xl-11">
                                                <h5>${comment.author}</h5>
                                                <p class="date">${comment.resdate}</p>
                                                <p class="comment">${comment.content}</p>
                                            </div>
                                            <c:if test="${(sid eq 'admin') or (sid eq comment.author)}">
                                                <div class="reply-btn">
                                                    <a href="${path}/comment/delete?comNo=${comment.comNo}&cno=${detail.cno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>" class="btn-reply text-uppercase"> 삭제 </a>
                                                </div>
                                            </c:if>
                                            <hr>
                                        </div>
                                    </div>
                                </c:forEach>
                                <c:if test="${empty commentList}">
                                    <div class="text-center">
                                        <p>등록된 댓글이 없습니다.</p>
                                    </div>
                                </c:if>
                            </div>
                            <!-- 댓글 페이지 -->
                            <div class="pt-3">
                                <ul class="pagination justify-content-center mb-0">
                                    <c:if test="${commentPage > 5}">
                                        <li class="mr-2">
                                            <a href="${path}/community/detail?cno=${detail.cno}&page=${curPage}&commentPage=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-item">
                                                <i class="fa-solid fa-arrow-left"></i>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                        <c:choose>
                                            <c:when test="${i == commentPage}">
                                                <li class="mr-2">
                                                    <a href="${path}/community/detail?cno=${detail.cno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                       class="page-item active"
                                                       aria-label="Page ${i}"
                                                       aria-current="page">
                                                            ${i}
                                                    </a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li  class="mr-2">
                                                    <a href="${path}/community/detail?cno=${detail.cno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                       class="page-item"
                                                       aria-label="Page ${i}"
                                                       aria-current="page">
                                                            ${i}
                                                    </a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <c:if test="${page.blockLastNum < page.totalPageCount}">
                                        <li class="mr-2">
                                            <a href="${path}/community/detail?cno=${detail.cno}&page=${curPage}&commentPage=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-item">
                                                <i class="fa-solid fa-arrow-right"></i></a>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                            <!-- 댓글 페이지 끝 -->
                            <!-- 댓글영역 끝 -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 테이블 영역 끝 -->
</div>
<!-- 커뮤니티 상세보기 끝 -->
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>
