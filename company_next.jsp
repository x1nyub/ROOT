<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>


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
                    <a class="navbar-brand" href="../index.jsp">1Team</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="index.jsp">메인 페이지</a></li>
                            <li class="nav-item"><a class="nav-link" href="company.jsp">채용 공고</a></li>
                            <li class="nav-item"><a class="nav-link" href="resume.jsp">자기소개서</a></li>
                            <li class="nav-item"><a class="nav-link" href="enroll.jsp">공고 등록</a></li>                          
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">로그인</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="login.jsp">로그인</a></li>
                                    <li><a class="dropdown-item" href="logout.jsp">로그아웃</a></li>
                                    <li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!--전달받은 num값 확인-->           
               <%
               int num=Integer.parseInt(request.getParameter("num"));               
                     Class.forName("com.mysql.jdbc.Driver");
                     String url = "jdbc:mysql://43.200.111.30:3306/db";
                     Connection conn = DriverManager.getConnection(url, "root", "It1");
                     PreparedStatement ps=(PreparedStatement)conn.prepareStatement("SELECT * from company where company_num= (?) ");
                     ps.setInt(1, num);
                     ResultSet rs=ps.executeQuery();
                     while(rs.next()){
                             String company_subject=rs.getString("company_subject");
                        
                             pageContext.setAttribute("company_subject", company_subject);
                             String company_name=rs.getString("company_name");
                             
                             pageContext.setAttribute("company_name", company_name);
                             String company_scale=rs.getString("company_scale");
                             
                             pageContext.setAttribute("company_scale", company_scale);
                             String company_career=rs.getString("company_career");
                             
                             pageContext.setAttribute("company_career", company_career);
                             String company_education=rs.getString("company_education");
                             
                             pageContext.setAttribute("company_education", company_education);
                             String company_location=rs.getString("company_location");
                            
                             pageContext.setAttribute("company_location", company_location);
                             String company_fulltime=rs.getString("company_fulltime");
                           
                             pageContext.setAttribute("company_fulltime", company_fulltime);
                             String company_field=rs.getString("company_field");
                           
                             pageContext.setAttribute("company_field", company_field);
                             String company_image=rs.getString("company_image");
                           
                             pageContext.setAttribute("company_image", company_image);
                             String company_url=rs.getString("company_url");
                         
                             pageContext.setAttribute("company_url", company_url);
                             String company_period=rs.getString("company_period");
                             
                             pageContext.setAttribute("company_period", company_period);                          
                     }               
                 %>          
                   <!-- 표에 데이터 집어넣기 -->
                     <div class="row justify-content-center">
                        <div class="col-sm-7">
                        
                        <table class="table table-bordered table-hover   ">
                            
                            <tbody>
                              <tr>
                                
                                 <td colspan="2">
                                    <span class="fw-bold">${company_subject}</span>
                                </td>
                                
                                 
                              </tr>
                              <tr>
                                 <td>기업명 : ${company_name}</td>
                                 <td>기업규모 : ${company_scale}</td>
                                
                              </tr>
                              <tr>
                                 <td>신입/경력 : ${company_career}</td>
                                 <td>학력 : ${company_education}</td>
                                
                              </tr>
                              <tr>
                                <td>기업 위치 : ${company_location}</td>
                                <td>채용 형태 : ${company_fulltime}</td>
                               
                             </tr>
                             <tr>
                                <td>채용 분야 : ${company_field}</td>
                                <td>채용 기간 : ${company_period}</td>
                               
                             </tr>
                            </tbody> 
                           
                           </table>
                    </div>
                </div>
                <!-- 홈페이지 지원 버튼 / 자소서 작성 이동 버튼 -->
                
                <div class="d-grid col-3 float:left">
                    <div  style="display: inline-block">
                    <a class="btn btn-outline-primary"
                    onclick="window.open('${company_url}')">홈페이지 지원</a>
                    <a class="btn btn-outline-primary"
                    onclick="location.href='resume.jsp'">자소서 작성</a>
                </div>
                </div>  

                <!-- 채용 이미지 불러오기 -->
                         <div class="text-center">
                            <img src="${company_image}">
                        </div>
                            
                            
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">                                              
                            </div>
                        </div>
                    </div>
                   
                    
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