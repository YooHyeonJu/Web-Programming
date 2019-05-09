<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
     String id = request.getParameter("id");  
        // 폼에서 입력한 id 참조
     boolean fnd = false;  // select 결과가 있는지 여부 저장
     if (id == null)
          id = "";
     else  // 넘겨져온 ID 가 있으면
     {
       String driver="oracle.jdbc.driver.OracleDriver";  
      String url="jdbc:oracle:thin:@localhost:1522:orc";
    
Connection conn=null;
Class.forName(driver);  
conn=DriverManager.getConnection(url,"yhj781","hj0503");  
ResultSet rs = null;
Statement stmt= conn.createStatement();
String strSQL= "SELECT id FROM member WHERE id='" + id + "'";
 rs = stmt.executeQuery(strSQL);

  if (rs.next())  fnd = true;   // select 된 결과 값이 있으면 fnd 는 true
     stmt.close();
     conn.close();
    }
 %>
    <HTML><HEAD><TITLE>id check</TITLE></HEAD>
<script language="JavaScript">
function id_search()   // id 유효성 검사 메소드
{
   if(document.form_id_check.id.value=="") 
   {
     alert("ID를 입력해 주세요.");
     document.form_id_check.id.focus();
   }
     else 
     {
      document.form_id_check.submit();
     }
}
     function id_ok(a)
  {
    opener.document.joinform.id.value=a;       
    self.close();   
  }

  <%--  다음페이지에 있는 <a href ="javascript:id_ok('<%= id %>')">   --%>
   /* 에 의해 ID 값이 이곳으로 전달되고 이 값을     Open한 폼의 input 태그 
       userid의 value   속성으로 대입-즉, 사용가능한 아디를    
       회원가입화면의 id 값으로 나타나게 해준다. */
    </script>
<BODY><CENTER><BR>
<P align="center">사용할 ID를 입력 후 검색 버튼을 누르세요</P>
<FORM NAME = "form_id_check" ACTION = "id_check.jsp" METHOD = "POST" >
  <TABLE WIDTH="200">
    <TR>     <TD WIDTH="150">ID</TD>
    <TD WIDTH="100"><INPUT TYPE="text"   NAME="id"  size="20" 
               VALUE=<%= id %>></TD>
    <TD WIDTH="40" ><INPUT TYPE="button" VALUE="검색" 
                  onClick="javascript:id_search()"></TD>
    </TR>  </TABLE>
</FORM>
    <% 
if (id != "" && fnd == false)  
  { 
   %>
   사용 가능한 ID 입니다<P>
  확인을 누르시면 회원등록 화면으로 돌아갑니다.
   <a href ="javascript:id_ok('<%= id %>')">  확인 </a>
   <% 
  }
else if (id != "" && fnd == true)
  { 
  %>
   이미 사용 중인 ID 입니다.
  <%
  }
  %>
</CENTER></BODY></HTML>


    