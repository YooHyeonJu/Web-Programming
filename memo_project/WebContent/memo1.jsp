<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.Calendar" %>

<body>
<% 

if ((session.getAttribute("id")==null)) {
/* memberLoginForm.jsp 에서 저장한 세션 값 */
out.println("<script>");
out.println("location.href='memberLoginForm.jsp'");
out.println("</script>");
}
%>
<form action="memo_ok.jsp" method="post">
<table border=1 align="center">
<tr><td colspan=5 align=center width="650px">한 줄 메모장</td></tr>
<tr><td>작성자</td><td> <input name="name"  type="text" VALUE="<%= session.getAttribute("id")  %>"> </td>
       <!-- 로그인하고 나면 이곳에서 이름 값에 값을 넣어줌 -->
    <td>비밀번호</td><td><input name="pass" type="password"></td>
    <td rowspan=2><input value="저장하기" type="submit"></td></tr>
    <tr><td>내 용</td><td colspan=3>
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
// 여러 SQL  사용하려면 이 이하부터 다시 추가 하여 사용하면 됨.

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
<tr><td colspan="5" align="center"> 총 <%=cnt %> 개의 글이 있습니다.</td></tr> 
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
			<td width="40px"><a href="memo_Delete.jsp?number=<%=rs2.getString(1) %>">삭제</a></td>
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
		<td width="40px"><a href="memo_Delete.jsp?number=<%=rs3.getString(1) %>">삭제</a></td>
	<%
	}
	%>
   </tr>   
<%   
}
%>
</table></body>

    