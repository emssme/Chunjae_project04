<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<header class="header_area">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <a class="navbar-brand logo_h" href="${path}/">
                    <picture>
                        <source srcset="${path}/resources/images/logo.png" media="all and (min-width: 992px)">
                        <img src="${path}/resources/images/logo2.png" alt="해법 로고 이미지" style="height: 38px">
                    </picture>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div
                        class="collapse navbar-collapse offset"
                        id="navbarSupportedContent"
                >
                    <ul class="nav navbar-nav menu_nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="${path}">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${path}/lecture/list">강의</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="${path}/community/list">커뮤니티</a>
                        </li>
                        <li class="nav-item submenu dropdown">
                            <a
                                    href="#"
                                    class="nav-link dropdown-toggle"
                                    data-toggle="dropdown"
                                    role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                            >고객지원</a
                            >
                            <ul class="dropdown-menu">
                                <li class="nav-item">
                                    <a class="nav-link" href="${path}/notice/list"
                                    >공지사항</a
                                    >
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${path}/fileboard/list">자료실</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${path}/qna/list">질문 및 답변</a>
                                </li>
                            </ul>
                        </li>
                        <c:if test="${sid eq null}">
                        <li class="nav-item">
                            <a href="${path}/user/login" class="nav-link login" id="login">
                                <i class="fa-solid fa-right-to-bracket"></i><span> &nbsp;&nbsp;로그인 </span>
                            </a>
                        </li>
                        </c:if>
                        <c:if test="${! empty sid && sid eq 'admin'}">
                        <li class="nav-item" style="margin-right: 15px;">
                            <a href="${path}/admin/" class="nav-link admin">
                                <i class="fa-solid fa-user"  style="color: #fac632;"></i> <span> &nbsp;관리자</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${path}/user/logout" class="nav-link logout">
                                <i class="fa-solid fa-right-from-bracket" style="color: #fac632;"></i> <span> &nbsp;로그아웃 </span>
                            </a>
                        </li>
                        </c:if>
                        <c:if test="${! empty sid && sid ne 'admin'}">
                        <li class="nav-item" style="margin-right: 15px;">
                            <a href="${path}/user/mypage" class="nav-link admin">
                                <i class="fa-solid fa-user"  style="color: #fac632;"></i><span> &nbsp;마이페이지</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${path}/user/logout" class="nav-link logout">
                                <i class="fa-solid fa-right-from-bracket" style="color: #fac632;"></i><span> &nbsp;로그아웃 </span>
                            </a>
                        </li>
                        </c:if>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>