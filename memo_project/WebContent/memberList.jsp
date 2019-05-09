<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%
    request.setCharacterEncoding("euc-kr");

     String id=null;
     Connection conn=null;
     PreparedStatement pstmt=null;
     ResultSet rs=null;

    String driver="oracle.jdbc.driver.OracleDriver";  
    String url="jdbc:oracle:thin:@localhost:1522:orc";

// 로그인 하지 않았거나(세션값이 없으면)  또는 관리자가 아니면 
 // memberLoginForm.jsp 로 가라.  
 // 바로 memberList.jsp를 실행하면 memberLoginForm.jsp 로 튕겨나감
    if ((session.getAttribute("id")==null) || (!((String)session.getAttribute("id")).equals("admin"))) {
	    out.println("<script>");
	    out.println("location.href='memberLoginForm.jsp'");	//모든 페이지마다 회원제를 사용한다.	//로그인을 해야만 들어갈 수 있다.
	    out.println("</script>");
    }

// 정상적으로 로그인 하고 들어오면 이곳 수행
    try {
	    Class.forName(driver);  
	    conn=DriverManager.getConnection(url,"yhj781","hj0503");
	    pstmt=conn.prepareStatement("SELECT * FROM member where status=0");
	    rs=pstmt.executeQuery();
	    }
	catch(Exception e){
	    e.printStackTrace();
    }
    %>
<body>
<center>
<table border=1 width=500>
<tr align=center><td colspan=4>정상 회원 목록</td></tr>
<tr align=center><td>아이디 </td><td>이름 </td><td>  </td><td>  </td></tr>
<% while(rs.next()) { %>
<tr align=center>
<td><a href="memberInfo.jsp?id=<%=rs.getString("id") %>">
<!-- 아디를 클릭하면 memberInfo.jsp로  id값을 가지고 가라  -->
<%=rs.getString("id") %>   </a></td>
<%-- <%=rs.getString("id") %>주석 처리하고 실행 해 볼 것 --%>
<td><%=rs.getString("name") %></a></td>
    <td><a href="memberBad.jsp?id=<%=rs.getString("id") %>">불량회원 등록하기</a></td>
<!-- 불량회원을 클릭하면 memberDelete.jsp로  id 값을 가지고 가라  -->

<!-- 퇴출 를 클릭하면 memberExit.jsp로  id 값을 가지고 가라  -->
<td><a href="memberExit.jsp?id=<%=rs.getString("id") %>">강제 퇴출</a>  </td></tr>
<% }  %>
</table>
<table border=1 width=500>
<tr align=center><td>
<a href="memberBadList.jsp">불량 회원 리스트 보기</a></td></tr>
</table>  </center></body>

    