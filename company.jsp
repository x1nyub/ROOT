<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
String idok = (String) session.getAttribute("idok");
if (idok==null) {
    response.sendRedirect("login_need.jsp");
}
%>
<!DOCTYPE html>

<body>

        <h2>company test</h2>

    

</body>