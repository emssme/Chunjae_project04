<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자료실 글쓰기</title>
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
                            <a href="${path}/fileboard/list">자료실</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 배너 끝 -->
<!-- 자료실 글쓰기 시작 -->
<div class="course_details_area mb-5 mt-5">
    <div class="container">
        <!-- 테이블 영역 시작 -->
        <form action="${path}/fileboard/insert" method="post" enctype="multipart/form-data">
            <div class="col-12">
                <div class="card w-100">
                    <div class="card-body">
                        <div class="table-responsive project-list">
                            <table class="table project-table table-centered table-nowrap">
                                <tbody>
                                <tr>
                                    <th class="text-center">제목</th>
                                    <td><input type="text" id="title" name="title" placeholder="제목을 입력하세요" style="border: 1px solid #cbcbcb; width: 100%; border-radius: 5px;" required></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="font-size: 15px;">
                                        <textarea name="content" id="content" cols="100" rows="8" maxlength="800" class="single-textarea" placeholder="내용을 입력하세요" style="height: 400px; border: 1px solid #cbcbcb; border-radius: 5px;"></textarea>
                                    </td>
                                </tr>
                                <!-- 파일 선택 부분 시작 -->
                                <tr>
                                    <th>파일 첨부</th>
                                    <td>
                                        <input type="file" class="file-input" name="upfile" multiple="multiple">
                                        <span class="file-cta">
                                            <span class="file-icon mb-0">
                                                <i class="fas fa-upload mb-0"></i>
                                            </span>
                                            <span class="file-label mb-0">
                                                파일 선택
                                            </span>
                                        </span>
                                        <span class="file-name">선택된 파일이 없습니다.</span>
                                    </td>
                                </tr>
                                <!-- 파일 선택 부분 끝 -->
                                </tbody>
                            </table>
                            <div class="btn-group float-right">
                                <a href="${path}/fileboard/list" class="btn btn-outline-info">목록</a>
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
<!-- 자료실 글쓰기 끝 -->
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
<!-- 파일 입력 요소 변경 시 파일 이름 표시 -->
<script>
    $(".file-input").on("change", () => {
        let fileName = '';
        let fileLength = $(".file-input")[0].files.length;
        if(fileLength > 1) {
            fileName = fileLength + "개의 파일";
        } else {
            fileName = $(".file-input").val().split("\\").pop();
        }
        $(".file-name").text("\t 선택한 파일 : " + fileName);
    });
</script>
</body>
</html>
