<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
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
                        <h2>로그인</h2>
                        <div class="page_link">
                            <a href="${path}">Home</a>
                            <a href="${path}/user/login">login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 배너 끝 -->
<!-- 로그인 영역 시작 -->
<div class="popular_courses">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 offset-md-3">
                <div class="register_form">
                    <h3>로그인</h3>
                    <form class="form_area" id="login" action="${path}/user/login" method="post">
                        <div class="row">
                            <div class="col-lg-12 form_group">
                                <input name="id" placeholder="아이디" type="text" required/>
                                <input name="pw" placeholder="비밀번호" type="password" required/>
                            </div>
                            <div class="col-lg-12 text-center">
                                <button class="primary-btn">로그인</button>
                                <p>회원이 아니신가요? <a href="${path}/user/term"><strong>회원가입</strong></a></p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 로그인 영역 끝 -->
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>
