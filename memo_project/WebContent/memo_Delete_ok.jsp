<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>

<%

String num=request.getParameter("number");
String pass=request.getParameter("pass");


Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String driver="oracle.jdbc.driver.OracleDriver";  
String url="jdbc:oracle:thin:@localhost:1522:orc";
Class.forName(driver);
conn=DriverManager.getConnection(url,"yhj781","hj0503");

pstmt = conn.prepareStatement("SELECT pass FROM memo_Test WHERE num=?");
 // ������ �Է��� id �� DB �� �Ƶ� ������ �ҷ��ͼ�
 
 pstmt.setString(1,num);
 rs=pstmt.executeQuery();  // �ҷ��� ���ڵ带 rs �� ����
 if(rs.next()){
	 if(pass.equals(rs.getString("pass"))){
	 // ������ �Է��� �н��� DB ���� �ҷ��� �н��� ������
	 // �ᱹ�� ���̵�� �н� �� �� ������ ����
	 	String  SQL1 = "delete from memo_Test where num=?";
		PreparedStatement pstmt1 = conn.prepareStatement(SQL1); 
		pstmt1.setString(1,num);
		pstmt1.executeUpdate();
	 
	 	/*
	   session.setAttribute("id",id); // �Ƶ� ���ǰ����� ����
	   out.println("<script>");
	   //out.println("location.href='memberMain.jsp'"); // ���� �α����̸�
	   out.println("location.href = 'memo.jsp'");
	   out.println("</script>");
	   */
	 }
	 else{%>
		 ��й�ȣ ��ġ���� ����.
	 <%}
		 
}
 
 // �н��� �ٸ��� �ٽ� �α��� â���� ����
 out.println("<script>");
 out.println("location.href='memo.jsp'");
 out.println("</script>");  
%>






