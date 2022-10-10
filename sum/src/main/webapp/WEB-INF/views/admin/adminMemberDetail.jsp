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
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">
                <img src="./assets/img/sum_logo.png" class="sumLogo">
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
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                관리자 메인
                            </a>
                            <a class="nav-link" href="index.html">
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
                                    <a class="nav-link" href="layout-static.html">1:1 문의 목록</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMovie" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="bi bi-camera-reels-fill"></i></div>
                                영화
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseMovie" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesMovies" aria-expanded="false" aria-controls="pagesCollapseError">
                                        영화 등록
                                    </a>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesMovies" aria-expanded="false" aria-controls="pagesCollapseError">
                                        영화관 등록
                                    </a>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesMovies" aria-expanded="false" aria-controls="pagesCollapseError">
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
                                    <a class="nav-link" href="">공지사항 목록</a>
                                    <a class="nav-link" href="layout-static.html">공지사항 등록</a>
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
                        <h1 class="mt-4">회원 관리자 등록</h1>
                            * 관리자로 등록된 회원만 변경할 수 있습니다.
                        <hr>
                        <div id="wrap">
                            <div id="container">
                                <div class="inner">        
                                    <form id="boardForm" name="boardForm">
                                        <table width="100%" class="table01">
                                            <colgroup>
                                                <col width="5%" />
                                                <col width="5%" />
                                                <col width="10%" />
                                                <col width="10%" />
                                                <col width="10%" />
                                                <col width="20%" />
                                                <col width="35%" />
                                            </colgroup>
                                            <thead>        
                                                <tr>
                                                    <th>No</th>
                                                    <th>회원</th>
                                                    <th>아이디</th>
                                                    <th>이름</th>
                                                    <th>생년월일</th>
                                                    <th>이메일</th>
                                                    <th>선호장르</th>
                                                </tr>
                                            </thead>
                                            <tbody id="tbody">
                                                <tr>
                                                    <td>1</td>
                                                    <td><img src="./assets/img/admin.png" class="iconimages"></td>
                                                    <td>admin</td>
                                                    <td>관리자</td>
                                                    <td>1999-12-31</td>
                                                    <td>admin@naver.com</td>
                                                    <td>멜로/로맨스, 액션, 드라마</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td><img src="./assets/img/member.png" class="iconimages"></td>
                                                    <td>moviestar</td>
                                                    <td>김무비</td>
                                                    <td>1999-12-31</td>
                                                    <td>moviestar@naver.com</td>
                                                    <td>코메디, SF, 드라마</td>
                                                </tr>
                                            </tbody>    
                                        </table>
                                    </form>            
                                </div>
                            </div>
                        </div>
                        <br><br>
                        <div class="btnzone">
                            <button type="submit" class="btn btn-warning btnsize"> 변경 </button>
                            <button type="reset" class="btn btn-light btnsize"> 취소 </button>
                        </div> 
                    </div>
                </main>
                
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
