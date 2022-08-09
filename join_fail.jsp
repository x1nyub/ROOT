<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String idok = (String) session.getAttribute("idok");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>Modern Business - Start Bootstrap Template</title>
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
                            <li class="nav-item"><a class="nav-link" href="enroll.jsp">공고 등록</a></li>                          
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
                            
                            <h1 class="fw-bolder">회원가입</h1>
                            <p class="lead fw-normal text-muted mb-0">간편한 가입으로 다양한 서비스를 편리하게 이용해보세요.</p>
                            <span style="color:red">중복된 ID 입니다.</span>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                             <!--여기밑에 FORM만 건드림-->
                                <form action="join_ok.jsp" method="post">
                                
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="id" type="text"   />
                                        <label for="name">ID</label>
                                        
                                    </div>
                                    
                                    <div class="form-floating mb-3">
                                        <input class="form-control"  name="passwd" type="password"   />
                                        <label for="name">Password</label>
                                        
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control"  name="name" type="text"   />
                                        <label for="name">Name</label>
                                       
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control"  name="email" type="text"   />
                                        <label for="name">Email</label>
                                       
                                    </div>
                                   
                                                                                       
                                    <div class="d-grid"><button class=" btn-primary btn-lg disabled"  type="submit">완료</button></div>
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
