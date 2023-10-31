<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강의 상세보기</title>
    <jsp:include page="../setting/head.jsp"/>
    <style>
        table tr {border-bottom: 1px solid #dee2e6; border-top: 1px solid #dee2e6;}
        table th {width: 20%}
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
                        <h2>강좌 상세보기</h2>
                        <div class="page_link">
                            <a href="${path}">Home</a>
                            <a href="${path}/listture/list">강의 목록</a>
                            <a href="${path}/listture/detail?lcode=${detail.lcode}">상세보기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 배너 끝 -->
<!-- 강좌 목록 시작 -->
<section class="course_details_area section_gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 course_details_left">
                <div class="content_wrapper">
                    <!-- 강좌 소개 영역 시작 -->
                    <h4 class="title mt-0">${detail.lname}</h4>
                    <div class="content">
                        ${detail.lcontent}
                    </div>
                    <!-- 강좌 소개 영역 끝 -->
                    <!-- 강의 목차 영역 -->
                    <h4 class="title">강의 목차</h4>
                    <div class="content">
                        <ul class="course_list">
                            <c:forEach items="${curriList}" var="list" varStatus="status">
                                <c:if test="${status.count eq 1}">
                                    <li class="justify-content-between d-flex">
                                        <input type="hidden" id="${list.ccode}" name="${list.ccode}">
                                        <p>${status.count}. ${list.cname}</p>
                                        <a href="${path}/curriculum/" class="btn btn-warning">1강 무료보기</a>
                                    </li>
                                </c:if>
                                <c:if test="${status.count ne 1}">
                                    <li class="justify-content-between d-flex">
                                        <input type="hidden" id="${list.ccode}" name="${list.ccode}">
                                        <p>${status.count}. ${list.cname}</p>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${empty curriList}">
                                <div class="content text-center">
                                    강의가 준비중입니다.
                                </div>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 강좌 세부사항 -->
            <div class="col-lg-4 right-contents">
                <ul>
                    <li>
                        <a class="justify-content-between d-flex" href="#">
                            <p>강사명</p>
                            <span class="or">${detail.sname} - ${detail.tname} 선생님</span>
                        </a>
                    </li>
                    <li>
                        <a class="justify-content-between d-flex" href="#">
                            <p>강의 가격 </p>
                            <span>${detail.lprice} <i class="fa-solid fa-won-sign"></i></span>
                        </a>
                    </li>
                    <li>
                        <a class="justify-content-between d-flex" href="#">
                            <p>수강 가능 인원</p>
                            <span>${detail.maxStudent} 명</span>
                        </a>
                    </li>
                    <li>
                        <a class="justify-content-between d-flex" href="#">
                            <p>수강 기간</p>
                            <span>${detail.sdate} ~ ${detail.edate}</span>
                        </a>
                    </li>
                </ul>
                <a href="${path}/payment/payment?lcode=${lecture.lcode}&bcode=${lecture.bcode}" class="primary-btn2 text-uppercase enroll rounded-0 text-white">수강신청 하기</a>
                <!-- 강좌 리뷰 -->
                <h4 class="title">Reviews</h4>
                <div class="content">
                    <div class="feedeback">
                        <h6>후기 남기기</h6>
                        <div class="star-wrap">
                            <span class="my-star on" value="1">⭐</span>
                            <span class="my-star" value="2">⭐</span>
                            <span class="my-star" value="3">⭐</span>
                            <span class="my-star" value="4">⭐</span>
                            <span class="my-star" value="5">⭐</span>
                            <input type="hidden" id="star2" name="star" value="1">
                        </div>
                        <input type="hidden" name="lcode" id="lcode3" value="${detail.lcode}">
                        <textarea name="content" id="content3" class="form-control" cols="10" rows="3" maxlength="1000"></textarea>
                        <div class="mt-10 text-right">

                            <button type="submit" onclick="insertReview()" class="primary-btn2 text-right rounded-0 text-white">등록</button>
                        </div>
                    </div>
                    <div class="comments-area mb-30">
                        <div class="comment-list">
                            <div class="single-comment single-reviews justify-content-between d-flex">
                                <div class="user justify-content-between d-flex">
                                    <div class="desc">
                                        <c:if test="${empty reviewList}">
                                            <div class="container-fluid mt-5 text-center">
                                                <p> 등록된 리뷰가 없습니다. </p>
                                            </div>
                                        </c:if>
                                        <c:if test="${!empty reviewList}">
                                            <c:forEach items="reviewList" var="list" varStatus="status">
                                                <h5>${list.id}
                                                    <div class="star">
                                                        <c:if test="${list.star eq 1}">
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-regular fa-star"></i>
                                                            <i class="fa-regular fa-star"></i>
                                                            <i class="fa-regular fa-star"></i>
                                                            <i class="fa-regular fa-star"></i>
                                                        </c:if>
                                                        <c:if test="${list.star eq 2}">
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-regular fa-star"></i>
                                                            <i class="fa-regular fa-star"></i>
                                                            <i class="fa-regular fa-star"></i>
                                                        </c:if>
                                                        <c:if test="${list.star eq 3}">
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-regular fa-star"></i>
                                                            <i class="fa-regular fa-star"></i>
                                                        </c:if>
                                                        <c:if test="${list.star eq 4}">
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-regular fa-star"></i>
                                                        </c:if>
                                                        <c:if test="${list.star eq 5}">
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                        </c:if>
                                                    </div>
                                                </h5>
                                                <p class="comment">${list.resdate}</p>
                                                <p class="comment">
                                                        ${list.content}
                                                </p>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 테이블 영역 끝 -->
<script>
    // 리뷰 별점 작성
    $(".my-star").click(function () {
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
        $("#star2").attr("value", $(this).attr("value"));
        return false;
    });

    function insertReview() {
        // 사용자 입력을 가져옵니다.
        var content = $("#content3").val();
        var star = $("#star2").val();
        var lcode = $("#lcode3").val();

        $.ajax({
            url: "${path}/lecture/reviewInsert", // URL을 고정 경로로 지정
            type: "POST",
            data: {
                lcode: lcode,
                star: star,
                content: content
            },
            success: function (data) {
                console.log("성공");
                reviewPage();
                // 성공적으로 요청을 처리한 후 할 작업을 여기에 추가하세요.

                // $("#intro").addClass("show active");
                // $("#board").removeClass("show active");
                // $("#intro-tab").addClass("active");
                // $("#board-tab").removeClass("active");
            },
            error: function (error) {
                console.log("에러다에러", error.responseText);
            }
        });
    }
</script>
<!-- 강좌 상세보기 끝 -->
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>