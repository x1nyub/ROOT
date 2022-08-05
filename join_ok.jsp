<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
String email = request.getParameter("email");

Connection conn = null;
PreparedStatement pstmt = null;

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://43.200.111.30:3306/db";
conn = DriverManager.getConnection(url,"root","It1");


pstmt = conn.prepareStatement("INSERT INTO user (id, passwd, name, email) VALUES (?, ?, ?, ?)");

pstmt.setString(1, id);
pstmt.setString(2, passwd);
pstmt.setString(3, name);
pstmt.setString(4, email);

try{
int result = pstmt.executeUpdate();
if(result == 1){
                        response.sendRedirect("join_success.jsp");
                        }
                        }

catch(Exception e){
//window.open("join_fail.jsp","_blank","width=300px height=100px");
        response.sendRedirect("join_fail.jsp");
}

pstmt.close();
conn.close();
%>