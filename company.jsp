<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%String adminok = (String) session.getAttribute("adminok");%>
<% String idok=(String) session.getAttribute("idok"); 
    if (idok==null) {
        response.sendRedirect("login_need.jsp"); } %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content />
                    <meta name="author" content />
                    <title>JOBSPACE-COMPANY</title>
                    <!-- Favicon-->
                    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
                    <!-- Bootstrap icons-->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
                        rel="stylesheet" />
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
                                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation"><span
                                        class="navbar-toggler-icon"></span></button>
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
                        <!-- company 테이블 정보 가져오기-->
                        <% Connection conn=null; 
                        PreparedStatement pstmt=null; 
                        Class.forName("com.mysql.jdbc.Driver");
                        String url="jdbc:mysql://10.0.4.108:3306/db?serverTimezone=UTC" ;
                        conn=DriverManager.getConnection(url,"root","It1234567!"); 
                        pstmt=conn.prepareStatement("select * from company"); 
                        ResultSet rs=pstmt.executeQuery(); %>

                        <!--채용공고 글자-->
                            <section class="bg-light py-5">
                                <div class="container px-5 my-5">
                                    <div class="text-center mb-5">
                                        <h1 class="fw-bolder">채용 공고</h1>
                                        <h2 class="lead fw-normal text-muted mb-0">지금 채용중인 기업을 확인하세요</h2>
                                    </div>
                                    <div class="row gx-5 justify-content-lg-start">

                                        <!-- 데이터베이스에 있는 정보 갯수만큼 카드형 만들기-->
                                        <% while(rs.next()){ %>
                                            <div class="col-lg-6 col-xl-4">
                                                <div class="card mb-5 mb-xl-0">
                                                    <div class="card-body p-5">
                                                        <div class="mb-3">
                                                            <span style="font-size : 20pt">
                                                            <span class="fw-bold">
                                                                <%=rs.getString("company_subject")%>
                                                            </span>
                                                        </span>

                                                        </div>
                                                        <ul class="list-unstyled mb-4">
                                                            <li class="mb-2">
                                                                <i class="bi bi-check text-primary"></i>
                                                                <strong>
                                                                    <%=rs.getString("company_name")%>
                                                                </strong>
                                                            </li>
                                                            <li class="mb-2">
                                                                <i class="bi bi-check text-primary"></i>
                                                                <%=rs.getString("company_career")%>
                                                            </li>
                                                            <li class="mb-2">
                                                                <i class="bi bi-check text-primary"></i>
                                                                <%=rs.getString("company_education")%>
                                                            </li>
                                                            <li class="mb-2">
                                                                <i class="bi bi-check text-primary"></i>
                                                                <%=rs.getString("company_location")%>
                                                            </li>
                                                            <li class="mb-2">
                                                                <i class="bi bi-check text-primary"></i>
                                                                <%=rs.getString("company_fulltime")%>
                                                            </li>
                                                        </ul>
                                                        <!-- 버튼 -->
                                                        <%                                                            
                                                            int num = rs.getInt("company_num");
                                                             %>
                                                        <div class="d-grid"><a class="btn btn-outline-primary"
                                                            id="${numok}" onclick="location.href='company_next.jsp?num=<%=num%>'">
                                                            채용공고 확인하기</a></div>                                                                                                                                                                                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <% } %>
                                    </div>
                                </div>
                            </section>
                    </main>
                    <!-- Footer-->
                    <footer class="bg-dark py-4 mt-auto">
                        <div class="container px-5">
                            <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                                <div class="col-auto">
                                    <div class="small m-0 text-white">Copyright &copy; Your Website 2022</div>
                                </div>
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