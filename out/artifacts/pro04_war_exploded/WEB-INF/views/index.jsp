<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <title> 해법 </title>
    <jsp:include page="./setting/head.jsp"/>
    <style>
        button.player_btn {border: none;background-color: #ffffff;}
        .contents {
            clear: both;
            height: 300px;
        }

        .contents::after {
            content:"";
            clear:both;
            display:block;
            width:100%;
        }

        .vs {
            clear: both;
            width: 100%;
            min-height: 300px;
            background-color: rgb(255, 255, 255);
            position: relative;
            overflow: hidden;
        }

        .img_box {
            position: relative;
            width: 100%;
            height: 300px;
            overflow: hidden;
        }

        .img_box li {
            visibility:hidden;
            opacity:0;
            transition-duration:0.7s;
            transition-delay:0.1s;
            width:100%;
            height:300px;
        }

        .img_box li .bg_box {
            width:100%;
            height:300px;
            background-repeat: no-repeat;
            background-position:center center;
            background-size:cover;
            position:absolute;
            left: 0;
            top: 0;
            z-index:5;
        }

        .img_box li.active .bg_box {
            z-index:6;
        }

        .img_box li.item1 .bg_box {
            background-image: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)), url("${path}/resources/images/education01.jpg");
            border-radius: 20px;
        }

        .img_box li.item2 .bg_box {
            background-image: url("${path}/resources/images/education02.jpg");
            border-radius: 20px;
        }

        .img_box li .vs_tit {
            position:absolute;
            top:150px; left:100px;
            z-index:10;
            font-weight: 100;
            font-size: 40px;
            line-height: 1.3;
            color: #ffd500;
        }
        .img_box li.active {
            visibility: visible;
            opacity: 1;
        }
        .btn_box li .vs_btn {
            display:block;
            width: 15px;
            height: 15px;
            background-color:rgba(255,255,255,0.8);
            border:2px solid #fff;
            position:absolute;
            top:10%;
            left: 3%;
            z-index:14;
            cursor:pointer;
            border-radius:50%;
        }

        .btn_box li.item2 .vs_btn {
            left: 4.5%;
        }

        .btn_box li.active .vs_btn {
            background-color: #fff;
            border:2px solid #333;
        }

        .vs_ra {
            display: none;
        }

        .play_btn {
            display:block;
            width: 12px;
            height: 12px;
            position:absolute;
            top:98px;
            left: 164px;
            z-index:14;
            cursor:pointer;
            color: #fff;
            border:0;
            background-color: transparent;
            font-weight: 900; }

        /*게시글 목록*/
        .table caption {
            margin-bottom: 10px;
        }
        .table caption a {
            color: #333333;
            font-size: 20px;
            font-weight: bold;
        }
        .table a {
            color: #333333;
        }

    </style>
</head>
<body>
<!-- Header 시작 -->
    <jsp:include page="./layout/header.jsp"/>
<!-- Header 끝 -->

<!--================ Start Home Banner Area =================-->
<section class="home_banner_area">
    <div class="container">
        <div class="columns is-multiline">
            <div class="column is-12">
                <article class="columns is-multiline is-justify-content-center mb-6">
                    <div class="column is-12">
                        <figure class="vs">
                            <ul class="img_box">
                                <li class="item1 active">
                                    <input type="radio" name="vs_ra" id="vs_ra1" class="vs_ra" checked>
                                    <div class="bg_box"></div>
                                </li>
                                <li class="item2">
                                    <input type="radio" name="vs_ra" id="vs_ra2" class="vs_ra">
                                    <div class="bg_box"></div>
                                </li>
                            </ul>
                            <ul class="btn_box">
                                <li class="item1 active"><label for="vs_ra1" class="vs_btn"></label></li>
                                <li class="item2"><label for="vs_ra2" class="vs_btn"></label></li>
                            </ul>
                            <button type="button" class="play_btn"></button>
                        </figure>
                        <script>
                            $(function(){
                                $(".btn_box li .vs_btn").click(function(){
                                    var par = $(this).parents("li").index();
                                    $(".img_box li").removeClass("active");
                                    $(".img_box li").eq(par).addClass("active");
                                    $(".btn_box li").removeClass("active");
                                    $(".btn_box li").eq(par).addClass("active");
                                });
                                var sw = 1;
                                var int1 = setInterval(function(){
                                    if(sw==1){
                                        autoplay(1);
                                        sw = 0;
                                    } else {
                                        autoplay(0);
                                        sw = 1;
                                    }
                                }, 5000);

                                function autoplay(n){
                                    $(".img_box li").removeClass("active");
                                    $(".img_box li").eq(n).addClass("active");
                                    $(".btn_box li").removeClass("active");
                                    $(".btn_box li").eq(n).addClass("active");
                                }

                                $(".play_btn").click(function(){
                                    if($(this).hasClass("active")){
                                        $(this).removeClass("active");
                                        sw = 1;
                                        int1 = setInterval(function(){
                                            if(sw==1){
                                                autoplay(1);
                                                sw = 0;
                                            } else {
                                                autoplay(0);
                                                sw = 1;
                                            }
                                        }, 3500);
                                    } else {
                                        $(this).addClass("active");
                                        sw = 0;
                                        clearInterval(int1);
                                    }
                                });
                            });
                        </script>
                    </div>
                </article>
            </div>
        </div>
    </div>
</section>
<!--================ End Home Banner Area =================-->

<!--================ Start Feature Area =================-->
<section class="feature_area section_gap_top">
    <div class="columns is-desktop is-multiline">
        <!-- 커뮤니티 -->
        <div class="column is-one-third">
            <table class="table">
                <caption><a href="${path}/community/list" style="color: #333333"> 커뮤니티 </a></caption>
                <thead>
                <tr>
                    <th width="5%">#</th>
                    <th class="has-text-centered">제목</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${indexComList}" var="community" varStatus="status">
                    <tr>
                        <td class="has-text-centered">${status.count}</td>
                        <c:if test="${empty sid}">
                            <td style="overflow: hidden">${community.title}</td>
                        </c:if>
                        <c:if test="${!empty sid}">
                            <td><a href="${path}/qna/detail.do?qno=${community.cno}" style="overflow: hidden">${community.title}</a></td>
                        </c:if>
                    </tr>
                </c:forEach>
                <c:if test="${empty indexComList}">
                    <tr>
                        <td colspan="2" class="has-text-centered"> 게시글이 없습니다. </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
        <!-- 공지사항 -->
        <div class="column is-one-third">
            <table class="table">
                <caption><a href="${path}/lecture/list" style="color: #333333"> 인기강의 </a></caption>
                <thead>
                <tr>
                    <th width="5%">#</th>
                    <th class="has-text-centered">제목</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${popularLectures}" var="list" varStatus="status">
                    <tr>
                        <td class="has-text-centered">${status.count}</td>
                        <c:if test="${empty sid}">
                            <td style="overflow: hidden">${list.ltitle}</td>
                        </c:if>
                        <c:if test="${!empty sid}">
                            <td><a href="${path}/qna/detail?lcode=${list.lcode}" style="overflow: hidden">${list.ltitle}</a></td>
                        </c:if>
                    </tr>
                </c:forEach>
                <c:if test="${empty popularLectures}">
                    <tr>
                        <td colspan="2" class="has-text-centered"> 강의 없습니다. </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
        <!-- QnA -->
        <div class="column is-one-third">
            <table class="table">
                <caption><a href="${path}/qna/list.do" style="color: #333333"> Q & A </a></caption>
                <thead>
                <tr>
                    <th width="5%">#</th>
                    <th class="has-text-centered">제목</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${reviews}" var="rev" varStatus="status">
                    <tr>
                        <td class="has-text-centered">${status.count}</td>
                        <td>${rev.content}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty reviews}">
                    <tr>
                        <td colspan="2" class="has-text-centered"> 리뷰가 없습니다. </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</section>
<!--================ End Feature Area =================-->

<!--================ End Testimonial Area =================-->
<!-- Footer 시작 -->
    <jsp:include page="./layout/footer.jsp"/>
<!-- Footer 끝 -->
</body>