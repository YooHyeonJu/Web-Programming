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

// �α��� ���� �ʾҰų�(���ǰ��� ������)  �Ǵ� �����ڰ� �ƴϸ� 
 // memberLoginForm.jsp �� ����.  
 // �ٷ� memberList.jsp�� �����ϸ� memberLoginForm.jsp �� ƨ�ܳ���
    if ((session.getAttribute("id")==null) || (!((String)session.getAttribute("id")).equals("admin"))) {
	    out.println("<script>");
	    out.println("location.href='memberLoginForm.jsp'");	//��� ���������� ȸ������ ����Ѵ�.	//�α����� �ؾ߸� �� �� �ִ�.
	    out.println("</script>");
    }

// ���������� �α��� �ϰ� ������ �̰� ����
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
<tr align=center><td colspan=4>���� ȸ�� ���</td></tr>
<tr align=center><td>���̵� </td><td>�̸� </td><td>  </td><td>  </td></tr>
<% while(rs.next()) { %>
<tr align=center>
<td><a href="memberInfo.jsp?id=<%=rs.getString("id") %>">
<!-- �Ƶ� Ŭ���ϸ� memberInfo.jsp��  id���� ������ ����  -->
<%=rs.getString("id") %>   </a></td>
<%-- <%=rs.getString("id") %>�ּ� ó���ϰ� ���� �� �� �� --%>
<td><%=rs.getString("name") %></a></td>
    <td><a href="memberBad.jsp?id=<%=rs.getString("id") %>">�ҷ�ȸ�� ����ϱ�</a></td>
<!-- �ҷ�ȸ���� Ŭ���ϸ� memberDelete.jsp��  id ���� ������ ����  -->

<!-- ���� �� Ŭ���ϸ� memberExit.jsp��  id ���� ������ ����  -->
<td><a href="memberExit.jsp?id=<%=rs.getString("id") %>">���� ����</a>  </td></tr>
<% }  %>
</table>
<table border=1 width=500>
<tr align=center><td>
<a href="memberBadList.jsp">�ҷ� ȸ�� ����Ʈ ����</a></td></tr>
</table>  </center></body>

    