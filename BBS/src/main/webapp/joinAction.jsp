<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
 request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userGender" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>READ BOOK</title>
</head>
<body>
 <%
 if(user.getUserID() == null||
	user.getUserPassword() == null||
	user.getUserName() == null||
	user.getUserGender() == null||
	user.getUserEmail() == null)
 {
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('입력이 안된 사항이 있습니다.')");
	   script.println("history.back()");
	   script.println("</script>");
 }else{
  UserDAO userDAO = new UserDAO();
  int result = userDAO.join(user); 
     if(result == 0){
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("location.href = 'main.jsp''");
	   script.println("</script>");
	  }
	  else if(result == -1){
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('존재하지 않는 아이디 입니다!')");
	   script.println("history.back()");
	   script.println("</script>");
	  }
	  else if(result == -2){
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('데이터베이스 오류가 발생했습니다!')");
	   script.println("history.back()");
	   script.println("</script>");
	  }
 
 }
  

 %>
</body>
</html>