<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />

<meta charset="utf-8">
<title>해법</title>
<!-- 파비콘 설정 -->
<!-- 표준 파비콘 -->
<link rel="shortcut icon" type="image/png" href="">
<!-- 애플 계열 모바일 -->
<link rel="apple-touch-icon-precomposed" href="">
<!-- IE 계열 브라우저 -->
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="">
<!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->
<link rel="icon" href="" sizes="64x64">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${path1}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${path1}/resources/css/flaticon.css" />
<link rel="stylesheet" href="${path1}/resources/css/themify-icons.css" />
<link rel="stylesheet" href="${path1}/resources/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet" href="${path1}/resources/vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet" href="${path1}/resources/css/style.css" />


<!-- font awesome -->
<script src="https://kit.fontawesome.com/67fc414e58.js" crossorigin="anonymous"></script>

<script>
    AOS.init({
        easing: "ease-out",
        duration: 800,
    });
</script>