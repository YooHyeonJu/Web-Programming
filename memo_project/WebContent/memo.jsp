<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import=" java.util.Calendar"%>
<body>
   <%
      int c_mon;
      int c_day;
      int c_year;
      int c_hour;
      Calendar now = Calendar.getInstance();
      c_day = now.get(Calendar.DATE);
      c_mon = now.get(Calendar.MONTH);
      c_year = now.get(Calendar.YEAR);
      c_hour = now.get(Calendar.HOUR);

      if ((session.getAttribute("id") == null)) {
         /* memberLoginForm.jsp 에서 저장한 세션 값 */
         out.println("<script>");
         out.println("location.href='memberLoginForm.jsp'");
         out.println("</script>");
      }
   %>
   <form action="memo_ok.jsp" method="post">
      <table border=1 align="center">
         <tr>
            <td colspan=5 align=center width="650px">한 줄 메모장</td>
         </tr>
         <tr>
            <td>작성자</td>
            <td><input name="name" type="text"
               VALUE="<%=session.getAttribute("id")%>"></td>
            <!-- 로그인하고 나면 이곳에서 이름 값에 값을 넣어줌 -->
            <td>비밀번호</td>
            <td><input name="pass" type="password"></td>
            <td rowspan=2><input value="저장하기" type="submit"></td>
         </tr>
         <tr>
            <td>내 용</td>
            <td colspan=3><input name="title" type="text" size="70"></td>
      </table>
   </form>
   <br>
   <%
      request.setCharacterEncoding("euc-kr");
      int i = 0;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      PreparedStatement pstmt2 = null;
      ResultSet rs2 = null;
      PreparedStatement pstmt3 = null;
      ResultSet rs3 = null;
      PreparedStatement pstmt4 = null;
      ResultSet rs4 = null;
      String driver = "oracle.jdbc.driver.OracleDriver";
      String url = "jdbc:oracle:thin:@localhost:1522:orc";
      try {
         Class.forName(driver);
         conn = DriverManager.getConnection(url, "yhj781", "hj0503");
         // 여러 SQL  사용하려면 이 이하부터 다시 추가 하여 사용하면 됨.

         pstmt = conn.prepareStatement("SELECT * FROM memo_Test order by indate desc");
         rs = pstmt.executeQuery();
         pstmt2 = conn.prepareStatement("SELECT COUNT(*) FROM memo_Test");
         rs2 = pstmt2.executeQuery();
         pstmt3 = conn.prepareStatement("SELECT * FROM memo_Test where name='admin' order by indate desc");
         rs3 = pstmt3.executeQuery();
         pstmt4 = conn.prepareStatement("SELECT * FROM memo_Test where name!='admin' order by indate desc");
         rs4 = pstmt4.executeQuery();

      } catch (Exception e) {
         e.printStackTrace();
      }

   %>
   <table border="1" cellspacing="1" align="center">

      <%
         while (rs2.next()) {
      %>
      <tr align=center>
         <td colspan=5>총 <%=rs2.getInt(1)%>개의 글이 있습니다. <%
            }
         %>
         </td>
      </tr>
      <%
         while (rs3.next()) {
            String write_year = rs3.getString("indate").substring(0, 4);
            int w_year = Integer.parseInt(write_year);
            String write_mon = rs3.getString("indate").substring(5, 7);
            int w_mon = Integer.parseInt(write_mon);
            String write_day = rs3.getString("indate").substring(8, 10);
            int w_day = Integer.parseInt(write_day);
      %>
      <tr>
         <td width="40px"><%=rs3.getString(1)%></td>
         <td width="100px"><%=rs3.getString(2)%> <%
    if ((w_year == c_year) && (w_mon == c_mon+1) && (w_day + 2 > c_day)) {
 %> <Img src="image/new.gif" width="20" height="20"> <%
    }
 %>
         <td width="300px"><%=rs3.getString(3)%></td>
         <td width="90px"><%=(rs3.getString("indate")).substring(0, 10)%>
         </td>
         <%
            if (session.getAttribute("id").equals("admin")) {
         %>
         <td width="40px"><a
            href="memo_Delete.jsp?num=<%=rs3.getString(1)%>">삭제</a></td>
         <%
            }
         %>
      </tr>
      <%
         }
      %>
      <%
         while (rs4.next()) {
            String write_year = rs4.getString("indate").substring(0, 4);
            int w_year = Integer.parseInt(write_year);
            String write_mon = rs4.getString("indate").substring(5, 7);
            int w_mon = Integer.parseInt(write_mon);
            String write_day = rs4.getString("indate").substring(8, 10);
            int w_day = Integer.parseInt(write_day);
      %>
      <tr>
         <td width="40px"><%=rs4.getString(1)%></td>
         <td width="100px"><%=rs4.getString(2)%> <%
    if ((w_year == c_year) && (w_mon == c_mon+1) && (w_day + 2 > c_day)) {
 %> <img src="new.jpg" width="20" hight="20"> <%
    }
 %>
 </td>
         <td width="300px"><%=rs4.getString(3)%></td>
         <td width="90px"><%=(rs4.getString("indate")).substring(0, 10)%>
         </td>
         <%
            if (session.getAttribute("id").equals("admin")) {
         %>
         <td width="40px"><a
            href="memo_Delete.jsp?number=<%=rs4.getString(1)%>">삭제</a></td>
         <%
            }
         %>
      </tr>
      <%
         }
      %>
   </table>
       올해 년도 출력 :  <%= c_year %>년 <br>
    이달 출력 :  <%= c_mon+1 %>월 <br>
    오늘 출력 :  <%= c_day %>일 <br>
    현재시간 출력 :  <%= c_hour %>시 <br>
</body>