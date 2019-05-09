<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>

<%


String id=request.getParameter("id");
String pass=request.getParameter("pass");	


Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String driver="oracle.jdbc.driver.OracleDriver";  
String url="jdbc:oracle:thin:@localhost:1522:orc";
Class.forName(driver);
conn=DriverManager.getConnection(url,"yhj781","hj0503");

pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
 // 폼에서 입력한 id 와 DB 의 아디가 같으면 불러와서
 
 pstmt.setString(1,id);
 rs=pstmt.executeQuery();  // 불러온 레코드를 rs 에 저장
 if(rs.next()){
	 if(pass.equals(rs.getString("pass"))){
	 // 폼에서 입력한 패스와 DB 에서 불러온 패스가 같으면
	 // 결국은 아이디와 패스 둘 다 맞으면 
	   session.setAttribute("id",id); // 아디를 세션값으로 저장
	   out.println("<script>");
	   //out.println("location.href='memberMain.jsp'"); // 정상 로그인이면
	   out.println("location.href = 'memo.jsp'");
	   out.println("</script>");
	 }
}
 // 패스가 다르면 다시 로그인 창으로 유도
 out.println("<script>");
 out.println("location.href='memberLoginForm.jsp'");
 out.println("</script>");  
%>