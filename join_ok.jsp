<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String idok = (String) session.getAttribute("idok");%>
<%String adminok = (String) session.getAttribute("adminok");%>

<%

request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
String email = request.getParameter("email");
String isadmin = request.getParameter("isadmin");

Connection conn = null;
PreparedStatement pstmt = null;

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://10.0.4.69:3306/db?serverTimezone=UTC";
conn = DriverManager.getConnection(url,"root","It1234567!");


pstmt = conn.prepareStatement("INSERT INTO user (id, passwd, name, email, isadmin) VALUES (?, ?, ?, ?, ?)");

pstmt.setString(1, id);
pstmt.setString(2, passwd);
pstmt.setString(3, name);
pstmt.setString(4, email);
pstmt.setString(5, isadmin);
try{
int result = pstmt.executeUpdate();
if(result == 1){
                        response.sendRedirect("join_success.jsp");
                        }
                        }

catch(Exception e){

        response.sendRedirect("join_fail.jsp");
}

pstmt.close();
conn.close();
%>