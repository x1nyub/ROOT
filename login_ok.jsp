<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String idok = (String) session.getAttribute("idok");%>
<%String adminok = (String) session.getAttribute("adminok");%>
<%
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String passwd = request.getParameter("passwd");
        String isadmin = request.getParameter("isadmin");

        String url = "jdbc:mysql://test.jobspace.monster:3306/db?serverTimezone=UTC";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from user where id = ? and passwd = ?";

        try{

                Class.forName("com.mysql.jdbc.Driver");


                conn = DriverManager.getConnection(url,"root","It1234567!");


                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                pstmt.setString(2, passwd);


                rs = pstmt.executeQuery();

                if(rs.next()){
                        id = rs.getString("id");
                        isadmin=rs.getString("isadmin");
                        
                        session.setAttribute("idok", id);
                        session.setAttribute("adminok", isadmin);

                        response.sendRedirect("index.jsp");

                } else{
                        response.sendRedirect("login_fail.jsp");
                }
        } catch(Exception e){
                e.printStackTrace();
                response.sendRedirect("login.jsp");
        } finally{
                try{
                        if(conn != null) conn.close();
                        if(pstmt != null) pstmt.close();
                        if(rs != null) rs.close();
                } catch(Exception e){
                        e.printStackTrace();
                }
        }
 %>