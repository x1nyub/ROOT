<%@ page import = "java.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String adminok = (String) session.getAttribute("adminok");%>
<% String idok=(String) session.getAttribute("idok"); 
    if (idok==null) {
        response.sendRedirect("login_need.jsp"); } %>
<%String cpnameok = (String) session.getAttribute("cpnameok");%>

<%
request.setCharacterEncoding("UTF-8");
Object obj_idok = session.getAttribute("idok");
Object obj_cpnameok = session.getAttribute("cpnameok");

String id = (String)obj_idok;
String company_name = (String)obj_cpnameok;
String company_a1 = request.getParameter("company_a1");
String company_a2 = request.getParameter("company_a2");
String company_a3 = request.getParameter("company_a3");

Connection conn = null;
PreparedStatement pstmt = null;

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://10.0.4.108:3306/db?serverTimezone=UTC";
conn = DriverManager.getConnection(url,"root","It1234567!");

pstmt = conn.prepareStatement("INSERT INTO resume (id, company_name, company_a1, company_a2, company_a3) VALUES (?, ?, ?, ?, ?)");

pstmt.setString(1, id);
pstmt.setString(2, company_name);
pstmt.setString(3, company_a1);
pstmt.setString(4, company_a2);
pstmt.setString(5, company_a3);

try{
    int result = pstmt.executeUpdate();
    if(result == 1){
                    
                     response.sendRedirect("resume_success.jsp");
                            }
                            }
    
    catch(Exception e){

            response.sendRedirect("enroll_fail.jsp");
    }
    
    pstmt.close();
    conn.close();
%>
