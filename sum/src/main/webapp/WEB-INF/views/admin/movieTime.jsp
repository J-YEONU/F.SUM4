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
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="${ path }/admin/movie">영화 등록</a>
                                    <a class="nav-link" href="${ path }/admin/cinema">영화관 등록</a>
                                    <a class="nav-link" href="${ path }/admin/movieTime">상영시간 등록</a>
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
                        <div class="small">${ loginMember.name }님, 관리자 페이지에 접속중입니다.</div>
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
						<form action="${ path }/admin/movieTime" method="POST" enctype="multipart/form-data">
						
                            <div>
                            <table style=" margin-left: auto; margin-right: auto; margin-bottom: 25px;">
                                <div>
                                <tr>
                                    <th>상영 영화관 :</th>
                                    <td> <select name="showNo" id="cinema">
                                                    <option selected>상영 영화관</option>
                                                    <option value="인제점">인제점</option>
			                                        <option value="평택점">평택점</option>
			                                        <option value="강릉점">강릉점</option>
			                                        <option value="홍대점">홍대점</option>
			                                        <option value="">범계점</option>
			                                        <option value="인천점">인천점</option>
			                                        <option value="계양점">계양점</option>
			                                        <option value="대전점">대전점</option>
			                                        <option value="천안점">천안점</option>
                                                </select>
                                    </td>            
                                </div>
                                <div>
                                <tr>
                                    <th>상영 영화 :</th>
                                    <td>
                                    <select name="cinemaNo" id="playMovie" >
                                        <option selected>상영 영화</option>
                                    	<option value="낮과달">낮과달</option>
                                        <option value="캐릭터">캐릭터</option>
                                        <option value="공조2">공조 2</option>
                                        <option value="귀못">귀못</option>
                                        <option value="리멤버">리멤버</option>
                                        <option value="52">자백</option>
                                        <option value="스마일">스마일</option>
                                        <option value="블랙아담">블랙아담</option>
                                        <option value="블랙 팬서 - 와칸다 포에버">블랙 팬서 - 와칸다 포에버</option>
                                        <option value="옆집사람">옆집사람</option>
                                        <option value="분노의 추격자">분노의 추격자</option>
                                        <option value="극장판 짱구는 못말려">극장판 짱구는 못말려</option>
                                        <option value="에브리씽 에브리웨어 올 앳 원스">에브리씽 에브리웨어 올 앳 원스</option>
                                    </select>
                                    </td>
                                </tr>
                                </div>
                                <div class="date_input">
                                <tr>
                                    <th>상영 날짜 :</th>
                                    <td>
                                     	<input type="date" id="date" name="startDate" value="SYSDATE">
	                                </td>     
                                </tr>
                                </div> 
                                <div class="date_input">
                                <tr>
                                    <th>종영 날짜 :</th>
                                    <td>
                                     <input type="date" id="date" name="endDate" value="SYSDATE">
                                    </td>
                                </tr>
                                </div> 
                                <div>
                                <tr>
                                <th>상영 시간 :</th>
                                <td> 
                                    <select name="time" id="movieTime" onchange="myFunction">
                                        <option selected>상영 시간</option>
                                        <option value="09">09:00</option>
                                        <option value="10:00">10:00</option>
                                        <option value="11:00">11:00</option>
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
								</td>
                                </tr>
                                </div>
                                
                            </table>
                            <br>
                            <div class="btnzone">
                                <button type="submit" class="btn btn-warning btnsize"> 저장 </button>
                                <button type="reset" class="btn btn-light btnsize"> 취소 </button>
                            </div>    
                            </div>
                            
                            <br><br>    
                        </div>
                </main>
                
                            </form>
            </div>
        </div>
        <script src="${ path }/js/jquery-3.6.0.min.js"></script>
        <script >
        <!-- 시간 확인 -->
       	
       	 
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>
</html>
