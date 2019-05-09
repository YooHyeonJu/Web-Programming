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
         /* memberLoginForm.jsp ���� ������ ���� �� */
         out.println("<script>");
         out.println("location.href='memberLoginForm.jsp'");
         out.println("</script>");
      }
   %>
   <form action="memo_ok.jsp" method="post">
      <table border=1 align="center">
         <tr>
            <td colspan=5 align=center width="650px">�� �� �޸���</td>
         </tr>
         <tr>
            <td>�ۼ���</td>
            <td><input name="name" type="text"
               VALUE="<%=session.getAttribute("id")%>"></td>
            <!-- �α����ϰ� ���� �̰����� �̸� ���� ���� �־��� -->
            <td>��й�ȣ</td>
            <td><input name="pass" type="password"></td>
            <td rowspan=2><input value="�����ϱ�" type="submit"></td>
         </tr>
         <tr>
            <td>�� ��</td>
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
         // ���� SQL  ����Ϸ��� �� ���Ϻ��� �ٽ� �߰� �Ͽ� ����ϸ� ��.

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
         <td colspan=5>�� <%=rs2.getInt(1)%>���� ���� �ֽ��ϴ�. <%
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
            href="memo_Delete.jsp?num=<%=rs3.getString(1)%>">����</a></td>
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
            href="memo_Delete.jsp?number=<%=rs4.getString(1)%>">����</a></td>
         <%
            }
         %>
      </tr>
      <%
         }
      %>
   </table>
       ���� �⵵ ��� :  <%= c_year %>�� <br>
    �̴� ��� :  <%= c_mon+1 %>�� <br>
    ���� ��� :  <%= c_day %>�� <br>
    ����ð� ��� :  <%= c_hour %>�� <br>
</body>