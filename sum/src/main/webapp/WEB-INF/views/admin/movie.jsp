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
        <link rel="stylesheet" href="${ path }/resources/css/admin/styles.css">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
        
        <!-- 썸머노트 -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="${ path }/">SUM</a>
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
                <main id="main_contnet">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">영화등록</h1>
                            * 관리자로 등록된 회원만 글을 저장 할 수 있습니다.
                        <hr>
                        <!-- 입력창 메인 영역-->
                        <div id="pageMain" class="pageMain">

                            <div>
                                <div>
                                    영화이름 : <input type="text">
                                </div>
                                <div>
                                    장르 : <input type="text">
                                </div>
                                <div class="date_input">
                                    개봉일 : <input type="date" id="date" name="birthDate" value>
                                </div> 
                                <div>
                                    영화이름 : <input type="text">
                                </div> 
                                <div>
                                    출연진 : <input type="text">
                                </div>
                                <div class="">
                                    등급 : 
                                    <select name="address" id="area">
                                        <option selected>연령제한</option>
                                        <option value="TotalUserPrice">전체 이용가</option>
                                        <option value="12">12</option>
                                        <option value="15">15</option>
                                        <option value="19">19</option>
                                    </select>
                                </div>
                            <div>
                                동영상 URL : <input type="text">
                            </div>
                            <div>
                                영화 포스터 사진 : <label for=""></label> <input type="file">
                            </div>
                            <div class="col">
                                <div class="fileboxBtn">
                                    <div>
                                        <label for="uploadImages1"><i class="bi bi-image"></i> 사진 등록 1</label>
                                        <input name="upfile1" type="file" id="uploadImages1"> 
                                        <label for="uploadImages2"><i class="bi bi-image-fill"></i> 사진 등록 2</label>
                                        <input name="upfile2" type="file" id="uploadImages2"> 
                                    </div>
                                    <div style="margin-top: 10px;">
                                        <label for="uploadImages3"><i class="bi bi-image-fill"></i> 사진 등록 3</label>
                                        <input name="upfile3" type="file" id="uploadImages3"> 
                                        <label for="uploadImages4"><i class="bi bi-image"></i> 사진 등록 4</label>
                                        <input name="upfile4" type="file" id="uploadImages4"> 
                                    </div>
                                    <p class="subText">* 최대 4장 4MB 이하</p>
                                </div>
                            </div>
                            <div>
                                무비로드 대표사진 : <label for=""></label> <input type="file">
                            </div>
                            <div>
                                줄거리 상세 :
                                <div id="">
                                    <textarea id="summernote"></textarea>
                                </div>
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
        <script src="js/scripts.js"></script>
        <script>
            $('#summernote').summernote({
            placeholder: '줄거리 내용을 작업 해 주세요.',
            tabsize: 2,
            height: 200
            });
        </script>
    </body>
</html>
