<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html>
<head>
</head>
<%
String number=request.getParameter("number");
%>

<body>

<form name="deleteform" action="memo_Delete_ok.jsp" method="post">

<center>
<table border=1>
<tr><td>글 번호</td><td><input type="text" name="number" value=<%=number %> readonly/></td></tr>
<tr><td>비밀번호 입력 </td><td><input type="password" name="pass"/></td></tr>
<tr><td colspan="2" align=center> <input type="submit" value="확인"></td></tr>
</table>
</center>
</form>
</body>
</html>