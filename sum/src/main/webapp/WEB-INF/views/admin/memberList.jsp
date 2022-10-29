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
        <link rel="stylesheet" href="${ path }/resources/css/myPage/myQnA.css?var=1">
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
                    <!-- 관리자 아이디 접속시 나타나는 아이콘-->
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><img src="${ path }/resources/image/admin.png" class="iconimages" alt="..."></a>
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
                        <div class="small">${loginMember.name}님, 관리자 페이지에 접속중입니다.</div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원 목록</h1>
                            * 관리자로 등록된 회원만 글을 작성 할 수 있습니다.
                        <hr>
                        <div id="member-main-container" class="">
                            <div id="member-select">
                                <span class="float-end"><img src="${ path }/resources/image/ghost.png" class="iconimages float-end" alt="..."><strong>&nbsp;&nbsp;탈퇴 회원&nbsp;:&nbsp; </strong></span>
                                <span class="float-end"><img src="${ path }/resources/image/admin.png" class="iconimages float-end" alt="..."><strong>&nbsp;&nbsp;관리자&nbsp;:&nbsp;</strong></span>
                                <span class="float-end"><img src="${ path }/resources/image/member.png" class="iconimages float-end" alt="..."><strong> 회원&nbsp;&nbsp;:&nbsp;&nbsp;</strong></span>
                            </div>
                        <br><br>
                        <div class="card mb-4" id="member-board">
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
                                                    <col width="5%" />
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
                                                        <th>권한</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbody">
                                                
                                                <c:if test="${ empty list }">
							            			<tr>
														<td colspan="8">
															조회된 회원목록이 없습니다.
														</td>
													</tr>	
												</c:if>
												
                                                <c:forEach items="${ list }" var="m">
                                                <tr>
                                                    <td>${ m.no }</td>
                                                    <c:choose>
						                         		<c:when test="${ m.status == 'N' }">
	                                                    	<td><img src="${ path }/resources/image/ghost.png" class="iconimages"></td>
						                         		</c:when>
						                         		<c:when test="${ m.role == 'ROLE_ADMIN' and m.status == 'Y' }">
	                                                    	<td><img src="${ path }/resources/image/admin.png" class="iconimages"></td>
						                         		</c:when>
						                         		<c:when test="${ m.role != 'ROLE_UESR' and m.status == 'Y' }">
	                                                    	<td><img src="${ path }/resources/image/member.png" class="iconimages"></td>
						                         		</c:when>
					                         		</c:choose>
                                                    <td>${ m.id }</td>
                                                    <td>${ m.name }</td>
                                                    <td>${ m.birth }</td>
                                                    <td>${ m.email }</td>
                                                    <td>${ m.genre }</td>
                                                    <td>
                                                        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                                                            <li class="nav-item dropdown">
                                                                <a class="nav-link" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></a>
                                                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                                                    <li><a class="dropdown-item" href="${ path }/admin/memberDetail?no=${ m.no }">관리자로 변경</a></li>
                                                                    <li><a class="dropdown-item" href="${ path }/admin/memberDetail?no=${ m.no }">회원탈퇴</a></li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                                </tbody>    
                                            </table>
                                        </form>            
                                    </div>
                                </div>
                            </div>
                </main>
                <!-- 리스트 목록-->
                        <div class="page_wrap">
			             <div class="page_nation">
			                 <a class="arrow pprev" href="${ path }/admin/memberList?page=1">&#60;&#60;</a>
			                 <a class="arrow prev" href="${ path }/admin/memberList?page=${ pageInfo.prevPage }">&#60;</a>
			                 
						   		<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">
										<a href="#" class="active">${ status.current }</a>
									</c:if>
									<c:if test="${ status.current != pageInfo.currentPage }">
										<a href="${ path }/admin/memberList?page=${ status.current }">${ status.current }</a>
									</c:if>
								</c:forEach>
			
			                 <a class="arrow next" href="${ path }/admin/memberList?page=${ pageInfo.nextPage }">&#62;</a>
			                 <a class="arrow nnext" href="${ path }/admin/memberList?page=${ pageInfo.maxPage }">&#62;&#62;</a>
			             </div>
			         </div>
                
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${ path }/js/jquery-3.6.0.min.js"></script>
    </body>
</html>
