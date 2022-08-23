<%@ page import = "java.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String adminok = (String) session.getAttribute("adminok");%> 
<%String idok = (String) session.getAttribute("idok");%>
<%

request.setCharacterEncoding("UTF-8");
String company_subject = request.getParameter("company_subject");
String company_name = request.getParameter("company_name");
String company_scale = request.getParameter("company_scale");
String company_career = request.getParameter("company_career");
String company_education = request.getParameter("company_education");
String company_location = request.getParameter("company_location");
String company_fulltime = request.getParameter("company_fulltime");
String company_field = request.getParameter("company_field");
String company_image = request.getParameter("company_image");
String company_url = request.getParameter("company_url");
String company_period = request.getParameter("company_period");
String company_q1 = request.getParameter("company_q1");
String company_q2 = request.getParameter("company_q2");
String company_q3 = request.getParameter("company_q3");

Connection conn = null;
PreparedStatement pstmt = null;

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://10.0.4.63:3306/db?serverTimezone=UTC";
conn = DriverManager.getConnection(url,"root","It1234567!");


int company_num=0;
pstmt = conn.prepareStatement("select max(company_num) from company");
ResultSet rs = pstmt.executeQuery();
if(rs.next()){
    company_num=rs.getInt("max(company_num)")+1;
}

pstmt = conn.prepareStatement("INSERT INTO company (company_num, company_subject, company_name, company_scale, company_career, company_education, company_location, company_fulltime, company_field, company_image, company_url, company_period, company_q1, company_q2, company_q3) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

pstmt.setInt(1, company_num);
pstmt.setString(2, company_subject);
pstmt.setString(3, company_name);
pstmt.setString(4, company_scale);
pstmt.setString(5, company_career);
pstmt.setString(6, company_education);
pstmt.setString(7, company_location);
pstmt.setString(8, company_fulltime);
pstmt.setString(9, company_field);
pstmt.setString(10, company_image);
pstmt.setString(11, company_url);
pstmt.setString(12, company_period);
pstmt.setString(13, company_q1);
pstmt.setString(14, company_q2);
pstmt.setString(15, company_q3);


try{
    int result = pstmt.executeUpdate();
    if(result == 1){
                    
                     response.sendRedirect("enroll_success.jsp");
                            }
                            }
    
    catch(Exception e){

            response.sendRedirect("enroll_fail.jsp");
    }
    
    pstmt.close();
    conn.close();
%>