<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
String adminok = (String) session.getAttribute("adminok");
String idok = (String) session.getAttribute("idok");
if (idok==null) {
    response.sendRedirect("login_need.jsp");
}
else if (session.getAttribute("adminok").equals("1")) {
    response.sendRedirect("login_need.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>JOBSPACE-ENROLL</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="index.jsp" ><img src="assets/logo.png" style="width: 150px;"></a>
                    <%if (idok!=null)%> <a class="navbar-brand" > <%=session.getAttribute("idok")%>님 안녕하세요.</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="index.jsp">메인 페이지</a></li>
                            <li class="nav-item"><a class="nav-link" href="company.jsp">채용 공고</a></li>
                            <li class="nav-item"><a class="nav-link" href="resume_board.jsp">자기소개서</a></li>
                            <%if (adminok!=null && adminok.equals("0"))%><li class="nav-item"><a class="nav-link" href="enroll.jsp">공고 등록</a></li>                          
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">SIGN</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <%if (idok==null)%><li><a class="dropdown-item" href="login.jsp">로그인</a></li>
                                    <%if (idok!=null)%><li><a class="dropdown-item" href="logout.jsp">로그아웃</a></li>
                                    <%if (idok==null)%><li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            
                            <h1 class="fw-bolder">공고 등록 </h1>
                            <p class="lead fw-normal text-muted mb-0">관리자만 접근 가능한 페이지입니다.</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                             <!--여기밑에 FORM만 건드림-->
                                <form action="enroll_ok.jsp" method="post">
                                
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="company_subject" type="text"   />
                                        <label for="name">공고제목</label>
                                        
                                    </div>
                                    
                                    <div class="form-floating mb-3">
                                        <input class="form-control"  name="company_name" type="text"   />
                                        <label for="name">기업명</label>
                                        
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-check-input"  name="company_scale" type="radio" value="중소기업" checked/> 중소기업
                                        <input class="form-check-input"  name="company_scale" type="radio" value="중견기업" /> 중견기업
                                        <input class="form-check-input"  name="company_scale" type="radio" value="대기업" /> 대기업
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input class="form-check-input"  name="company_career" type="radio" value="신입" checked/> 신입
                                        <input class="form-check-input"  name="company_career" type="radio" value="경력" /> 경력
                                       
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-check-input"  name="company_education" type="radio" value="학력무관" checked/> 학력무관
                                        <input class="form-check-input"  name="company_education" type="radio" value="고졸↑" /> 고졸
                                        <input class="form-check-input"  name="company_education" type="radio" value="초대졸↑" /> 초대졸
                                        <input class="form-check-input"  name="company_education" type="radio" value="대졸↑" /> 대졸
                                       
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control"  name="company_location" type="text"   />
                                        <label for="name">기업위치</label>
                                       
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-check-input"  name="company_fulltime" type="radio" value="정규직" checked/> 정규직
                                        <input class="form-check-input"  name="company_fulltime" type="radio" value="계약직" /> 계약직
                                        <input class="form-check-input"  name="company_fulltime" type="radio" value="인턴" /> 인턴
                                       
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-check-input"  name="company_field" type="radio" value="it" checked /> IT
                                        <input class="form-check-input"  name="company_field" type="radio" value="경영"/> 경영
                                        <input class="form-check-input"  name="company_field" type="radio" value="마케팅"/> 마케팅
                                        <input class="form-check-input"  name="company_field" type="radio" value="영업" /> 영업
                                        <input class="form-check-input"  name="company_field" type="radio" value="디자인"/> 디자인
                                        <input class="form-check-input"  name="company_field" type="radio" value="연구개발" /> 연구개발
                                       
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control"  name="company_image" type="text"   />
                                        <label for="name">채용공고 URL</label>
                                       
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control"  name="company_url" type="text"   />
                                        <label for="name">실제 기업 채용 페이지 URL</label>
                                       
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control"  name="company_period" type="text"   />
                                        <label for="name">채용기간</label>
                                       
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control"  name="company_q1" type="text"   />
                                        <label for="name">자소서 문항 1</label>
                                       
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control"  name="company_q2" type="text"   />
                                        <label for="name">자소서 문항 2</label>
                                       
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input class="form-control"  name="company_q3" type="text"   />
                                        <label for="name">자소서 문항 3</label>
                                       
                                    </div>
                                   
                                   
                                                                                       
                                    <div class="d-grid"><button class=" btn-primary btn-lg disabled"  type="submit">공고 등록</button></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Contact cards-->
                    
                </div>
            </section>
        </main>
        <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2022</div></div>
                    <div class="col-auto">
                        <a class="link-light small" href="#!">Privacy</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Terms</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
