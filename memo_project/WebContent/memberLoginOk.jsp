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
 // ������ �Է��� id �� DB �� �Ƶ� ������ �ҷ��ͼ�
 
 pstmt.setString(1,id);
 rs=pstmt.executeQuery();  // �ҷ��� ���ڵ带 rs �� ����
 if(rs.next()){
	 if(pass.equals(rs.getString("pass"))){
	 // ������ �Է��� �н��� DB ���� �ҷ��� �н��� ������
	 // �ᱹ�� ���̵�� �н� �� �� ������ 
	   session.setAttribute("id",id); // �Ƶ� ���ǰ����� ����
	   out.println("<script>");
	   //out.println("location.href='memberMain.jsp'"); // ���� �α����̸�
	   out.println("location.href = 'memo.jsp'");
	   out.println("</script>");
	 }
}
 // �н��� �ٸ��� �ٽ� �α��� â���� ����
 out.println("<script>");
 out.println("location.href='memberLoginForm.jsp'");
 out.println("</script>");  
%>