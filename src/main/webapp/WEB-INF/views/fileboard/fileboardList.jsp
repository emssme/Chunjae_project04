<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자료실</title>
    <jsp:include page="../setting/head.jsp"/>
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
                            <a href="${path}/fileboard/list">자료실</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 배너 끝 -->
<!-- 자료실 목록 시작 -->
<div class="course_details_area mb-5 mt-5">
    <!-- 검색 엔진 시작 -->
    <div class="container">
        <div class="col-xl-4 col-md-6 float-right mb-20"  style="z-index: 10">
            <form action="${path}/fileboard/list" method="get" class="ml-4">
                <div class="form-group mb-0">
                    <div class="input-group-append">
                        <div class="control mb-0" style="border: 1px solid #ced4da; border-radius: 0.25rem;">
                            <select id="type" name="type">
                                <option value="T"> 제목 </option>
                                <option value="C"> 내용 </option>
                            </select>
                        </div>
                        <input type="text" name="keyword" class="form-control" placeholder="검색하기" aria-describedby="project-search-addon" />
                        <input class="btn btn-info" type="submit" id="project-search-addon" value="검색"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- 검색 엔진 끝 -->
    <div class="container">
        <!-- 테이블 영역 시작 -->
        <div class="col-12">
            <div class="card w-100">
                <div class="card-body">
                    <div class="table-responsive project-list">
                        <table class="table project-table table-centered table-nowrap">
                            <thead>
                            <tr>
                                <th scope="col" class="text-center" style="width: 10%">#</th>
                                <th scope="col" class="text-center">제목</th>
                                <th scope="col" class="text-center" style="width: 10%">작성자</th>
                                <th scope="col" class="text-center" style="width: 15%">작성일</th>
                                <th scope="col" class="text-center" style="width: 10%">조회수</th>
                                <th scope="col" class="text-center" style="width: 10%">추천수</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${fileList }" var="file" varStatus="status">
                                <tr class="table-hover">
                                    <th class="text-center">${file.articleno}</th>
                                    <th>
                                        <!-- 로그인 하지 않았을 때 -->
                                        <c:if test="${sid eq null}">
                                            ${file.title}
                                        </c:if>
                                        <!-- 로그인 했을 때 -->
                                        <c:if test="${sid ne null}">
                                            <a href="${path}/fileboard/detail?articleno=${file.articleno}">${file.title}</a>
                                        </c:if>
                                    </th>
                                    <th class="text-center">${file.id}</th>
                                    <th class="text-center">
                                        <fmt:parseDate value="${file.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                                    </th>
                                    <th class="text-center">${file.visited}</th>
                                    <th class="text-center">${file.rec}</th>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty fileList}">
                                <tr>
                                    <td colspan="6" class="text-center"> 공지사항이 없습니다.</td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                        <!-- 페이지 시작 -->
                        <!-- pagnation -->
                        <div class="pt-3">
                            <ul class="pagination justify-content-center mb-0">
                                <c:if test="${curPage > 5}">
                                    <li class="mr-2">
                                        <a href="${path}/fileboard/list?page=${page.blockStartNum - 1}"
                                           class="page-item"><i class="fa-solid fa-arrow-left"></i></a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                    <c:choose>
                                        <c:when test="${i == curPage}">
                                            <li class="mr-2">
                                                <a href="${path}/fileboard/list?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                   class="page-item active" aria-label="Page ${i}"
                                                   aria-current="page">${i}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li  class="mr-2">
                                                <a href="${path}/fileboard/list?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                   class="page-item" aria-label="Page ${i}" aria-current="page">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${page.blockLastNum < page.totalPageCount}">
                                    <li class="mr-2">
                                        <a href="${path}/fileboard/list?page=${page.blockLastNum + 1}" class="page-item"><i class="fa-solid fa-arrow-right"></i></a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                        <!-- 페이지 끝 -->
                        <!-- 관리자 글쓰기 -->
                        <c:if test="${sid eq 'admin'}">
                        <div class="btn float-right mt-10">
                            <a href="${path}/fileboard/insert" class="primary-btn">글쓰기</a>
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
