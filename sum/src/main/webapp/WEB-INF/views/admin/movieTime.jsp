<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>4SUM</title>
        <!-- 부트스트랩 아이콘 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
        <link href="${ path }/resources/css/admin/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="${ path }/">
                <img src="${ path }/resources/image/sum_logo.png" class="sumLogo">
            </a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">관리자 대시보드</div>
                            <a class="nav-link" href="${ path }/admin/main">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                관리자 메인
                            </a>
                            <a class="nav-link" href="${ path }/admin/memberList">
                                <div class="sb-nav-link-icon"><i class="bi bi-person-lines-fill"></i></div>
                                회원 목록
                            </a>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseInquriy" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="bi bi-envelope-plus"></i></div>
                                1:1 문의
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseInquriy" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="${ path }/admin/inquiry">1:1 문의 목록</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMovie" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="bi bi-camera-reels-fill"></i></div>
                                영화
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseMovie" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="${ path }/admin/movie" data-bs-toggle="collapse" data-bs-target="#pagesMovies" aria-expanded="false" aria-controls="pagesCollapseError">
                                        영화 등록
                                    </a>
                                    <a class="nav-link collapsed" href="${ path }/admin/cinema" data-bs-toggle="collapse" data-bs-target="#pagesMovies" aria-expanded="false" aria-controls="pagesCollapseError">
                                        영화관 등록
                                    </a>
                                    <a class="nav-link collapsed" href="${ path }/admin/movieTime" data-bs-toggle="collapse" data-bs-target="#pagesMovies" aria-expanded="false" aria-controls="pagesCollapseError">
                                        상영시간 등록
                                    </a>
                                    <div class="collapse" id="pagesMovies" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                    </div>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseNotice" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="bi bi-calendar3"></i></div>
                                공지 사항
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseNotice" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="${ path }/admin/noticeList">공지사항 목록</a>
                                    <a class="nav-link" href="${ path }/admin/noticeWrite">공지사항 등록</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">로그인한 사람의 아이디가 보여지는 곳</div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">상영시간 등록 </h1>
                            * 관리자로 등록된 회원만 글을 저장할 수 있습니다.
                        <hr>
                        <!-- 입력창 메인 영역-->
                        <div id="pageMain" class="">

                            <div>
                                <div>
                                    상영 영화관: <select name="address" id="cinema">
                                                    <option selected>상영 영화관</option>
                                                </select>
                                </div>
                                <div>
                                    상영 영화 :
                                    <select name="address" id="playMovie">
                                        <option selected>상영 영화</option>
                                    </select>
                                </div>
                                <div class="date_input">
                                    상영 날짜 : <input type="date" id="date" name="openDate" value>
                                </div> 
                                <div class="date_input">
                                    종영 날짜 : <input type="date" id="date" name="closeDate" value>
                                </div> 
                                <div>
                                    상영 시간 : 
                                    <select name="address" id="movieTime">
                                        <option selected>상영 시간</option>
                                        <option value="09">09:00</option>
                                        <option value="10">10:00</option>
                                        <option value="11">11:00</option>
                                        <option value="12">12:00</option>
                                        <option value="13">13:00</option>
                                        <option value="14">14:00</option>
                                        <option value="15">15:00</option>
                                        <option value="16">16:00</option>
                                        <option value="17">17:00</option>
                                        <option value="18">18:00</option>
                                        <option value="19">19:00</option>
                                        <option value="20">20:00</option>
                                        <option value="21">21:00</option>
                                        <option value="22">22:00</option>
                                        <option value="23">23:00</option>
                                        <option value="24">24:00</option>
                                    </select>
                                </div>
                                
                            
                            <br>
                            <div class="btnzone">
                                <button type="submit" class="btn btn-warning btnsize"> 저장 </button>
                                <button type="reset" class="btn btn-light btnsize"> 취소 </button>
                            </div>    
                            </div>
                            
                            <br><br>    
                        </div>
                </main>
                
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${ path }/js/jquery-3.6.0.min.js"></script>
    </body>
</html>
