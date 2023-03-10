<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 로그인 웹 사이트</title>
</head>
<body>
<%
	String userID = null;
if(session.getAttribute("userID")!=null){
	userID = (String) session.getAttribute("userID");
}
if(userID==null){
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('로그인을 하세요.')");
	   script.println("location.href = 'login.jsp'");
	   script.println("</script>");	 
}

int bbsID = 0;
if(request.getParameter("bbsID")!=null){
	bbsID = Integer.parseInt(request.getParameter("bbsID"));
}

if(bbsID == 0){
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('유효하지 않은 글.')");
	   script.println("location.href = 'bbs.jsp'");
	   script.println("</script>");	 
}

Bbs bbs = new BbsDAO().getBbs(bbsID);
if(!userID.equals(bbs.getUserID())){
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('권한이 없습니다.')");
	   script.println("location.href = 'bbs.jsp'");
	   script.println("</script>");	 
}
%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expended="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
       <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"
       				aria-expanded="false">
           <ul class="nav navbar-nav">
                   <li><a href="main.jsp">메인</a></li>
                   <li class="active"><a href="bbs.jsp">게시판</a></li>
           </ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
                     data-toggle="dropdown" role="button" aria-haspopup="true"
                     aria-expanded="false">회원관리<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                     	<li><a href="logoutAction.jsp">로그아웃</a></li>
                     </ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
	<div class="row">
	<form action="updateAction.jsp">
	<input type="hidden" name="bbsID" value="<%=bbsID%>">
		<table class="table table-striped" style="text-align: center;border:1px solid #ddd">
		<thead>
			<tr>
				<th style="background-color:#eeee;text-align: center;" colspan="2">게시판 글 수정 양식</th>
				
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" class="form-control" placeholder="글제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %>"></td>
			</tr>
			<tr>
				<td><textarea class="form-control" placeholder="글내용" name="bbsContent" maxlength="2048" style="height:350px"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></textarea></td>
				
			</tr>
		</tbody>
		</table>
		<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</form>
	</div>
</div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>