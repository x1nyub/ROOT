<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
String idok = (String) session.getAttribute("idok");
if (idok==null) {
    response.sendRedirect("logout.jsp");
}
%>
<!DOCTYPE html>

<body>
    
        
    <h2>resume test</h2>
    

</body>