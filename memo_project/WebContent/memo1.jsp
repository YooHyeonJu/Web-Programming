<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.Calendar" %>

<body>
<% 

if ((session.getAttribute("id")==null)) {
/* memberLoginForm.jsp ���� ������ ���� �� */
out.println("<script>");
out.println("location.href='memberLoginForm.jsp'");
out.println("</script>");
}
%>
<form action="memo_ok.jsp" method="post">
<table border=1 align="center">
<tr><td colspan=5 align=center width="650px">�� �� �޸���</td></tr>
<tr><td>�ۼ���</td><td> <input name="name"  type="text" VALUE="<%= session.getAttribute("id")  %>"> </td>
       <!-- �α����ϰ� ���� �̰����� �̸� ���� ���� �־��� -->
    <td>��й�ȣ</td><td><input name="pass" type="password"></td>
    <td rowspan=2><input value="�����ϱ�" type="submit"></td></tr>
    <tr><td>�� ��</td><td colspan=3>
<input name="title" type="text" size="70"></td>   
</table>
</form><br>
<%
     request.setCharacterEncoding("euc-kr");
    int i=0;
    Connection conn=null;
     PreparedStatement pstmt=null;
     ResultSet rs=null;
    String driver="oracle.jdbc.driver.OracleDriver"; 
    String url="jdbc:oracle:thin:@localhost:1522:orc";
try {
Class.forName(driver);  
conn=DriverManager.getConnection(url,"yhj781","hj0503");
// ���� SQL  ����Ϸ��� �� ���Ϻ��� �ٽ� �߰� �Ͽ� ����ϸ� ��.

pstmt=conn.prepareStatement("SELECT * FROM memo_Test order by indate desc");
rs=pstmt.executeQuery();
}catch(Exception e){
e.printStackTrace();
}

int cnt = 0;
Statement stmt = conn.createStatement();
String cntsql = "select count(*) count from memo_test";
ResultSet rs1 = stmt.executeQuery(cntsql);
if(rs1.next()){
	cnt = rs1.getInt("count");
}

PreparedStatement pstmt2 = conn.prepareStatement("select * from memo_test where name='admin' order by indate desc");
ResultSet rs2 = pstmt2.executeQuery();

Statement stmt3 = conn.createStatement();
String cntsql3 = "select * from memo_test where name!='admin' order by indate desc";
ResultSet rs3 = stmt3.executeQuery(cntsql3);
%>

<table border="1" cellspacing="1" align="center">
<tr><td colspan="5" align="center"> �� <%=cnt %> ���� ���� �ֽ��ϴ�.</td></tr> 
<%
int c_day=0;
Calendar now = Calendar.getInstance();
c_day = now.get(Calendar.DATE);

int cnt_admin=0;


while ( rs2.next() )  {
	cnt_admin +=1;
	if(cnt_admin >=4){
		break;
	}
%>
	 <tr>
 		<td width="40px"> <%= rs2.getString(1) %></td>
        <td width="100px"> <%= rs2.getString(2) %> 
        <%
		int w_day;
		String wirte_day = rs2.getString("indate").substring(8,10);
		w_day = Integer.parseInt(wirte_day);
		
		if(w_day + 2 > c_day){%>
			<Img src="image/new.gif" width="20" height="20">
		<%}%></td> 
        <td width="300px"> <%= rs2.getString(3) %>  </td> 
		<td width="90px"> <%=(rs2.getString("indate")).substring(0,10) %>  </td> 
		          
		
			
		<%
		if(session.getAttribute("id").equals("admin"))
		{
		%>
			<td width="40px"><a href="memo_Delete.jsp?number=<%=rs2.getString(1) %>">����</a></td>
		<%
		}
		%>
	   </tr>   
      
<%  
}   
%>
<%
while(rs3.next()){
%>
	<td width="40px"> <%= rs3.getString(1) %></td>
    <td width="100px"> <%= rs3.getString(2) %> 
    <%
	int w_day;
	String wirte_day = rs3.getString("indate").substring(8,10);
	w_day = Integer.parseInt(wirte_day);
	
	if(w_day + 2 > c_day){%>
		<Img src="image/new.gif" width="20" height="20">
	<%}%></td> 
    <td width="300px"> <%= rs3.getString(3) %>  </td> 
	<td width="90px"> <%=(rs3.getString("indate")).substring(0,10) %>  </td> 
	          
	
	<%
	if(session.getAttribute("id").equals("admin"))
	{
	%>
		<td width="40px"><a href="memo_Delete.jsp?number=<%=rs3.getString(1) %>">����</a></td>
	<%
	}
	%>
   </tr>   
<%   
}
%>
</table></body>

    