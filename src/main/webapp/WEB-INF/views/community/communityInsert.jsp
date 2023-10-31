<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 글쓰기</title>
    <jsp:include page="../setting/head.jsp"/>
    <style>
        table tr {border-bottom: 1px solid #dee2e6; border-top: 1px solid #dee2e6;}
        table th {width: 15%;vertical-align: middle;}
    </style>
    <script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>
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
        <form action="${path}/community/insert" method="post" enctype="multipart/form-data">
            <div class="col-12">
                <div class="card w-100">
                    <div class="card-body">
                        <div class="table-responsive project-list">
                            <table class="table project-table table-centered table-nowrap">
                                <tbody>
                                <tr>
                                    <th class="text-center">카테고리</th>
                                    <td>
                                        <select name="cate" id="cate" class="input">
                                            <c:forEach var="category" items="${categories}">
                                                <option value="${category.cate}">${category.cateName}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="text-center">제목</th>
                                    <td><input type="text" id="title" name="title" placeholder="제목을 입력하세요" style="border: 1px solid #cbcbcb; width: 100%; border-radius: 5px;" required></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="font-size: 15px;">
                                        <textarea name="content" id="content" cols="100" rows="8" maxlength="1400" class="single-textarea" placeholder="내용을 입력하세요" style="height: 400px; border: 1px solid #cbcbcb; border-radius: 5px;"></textarea>
                                        <script>
                                            CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path}/community/imageUpload'});
                                        </script>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="btn-group float-right">
                                <a href="${path}/community/list" class="btn btn-outline-info">목록</a>
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
