<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html><head>
<title>ȸ������ �ý��� ȸ������ ������</title>
</head>

<script language=javascript>
    function valid_check()
    {
    	// alert("����� �Լ��� ȣ�� ��.");
    	    if (document.joinform.id.value == "")
    	    {
    	         // joinform �� form name="joinform" ��
    	        // �� ���Ͽ��� ���� �̸� ����ϸ� ���� �߻�-���� ��ġ�� �����
    	       alert("���̵� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
    	       document.joinform.id.focus();
    	       return false;
    	    }
    	    
    	    if ((document.joinform.id.value.length <4) || 
                    (document.joinform.id.value.length >=9 ))
			{
				alert("���̵�� 4�� �̻� 8 �� ���� �Դϴ�.");
				document.joinform.id.focus();
				return false;
				// �߰����� ó�� : string�� int �� �����ϱ�
			}

    	    
    	    if (document.joinform.pass.value == "")
    	    {
    	         // joinform �� form name="joinform" ��
    	        // �� ���Ͽ��� ���� �̸� ����ϸ� ���� �߻�-���� ��ġ�� �����
    	       alert("��й�ȣ�� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
    	       document.joinform.pass.focus();
    	       return false;
    	    }
    	    
    	    if (document.joinform.pass.value.length != 4)
			{
				alert("��й�ȣ�� �ݵ�� 4�ڸ����� �մϴ�.");
				document.joinform.pass.focus();
				return false;
			}
    	    
    	    
    	    if (document.joinform.name.value == "")
    	    {
    	         // joinform �� form name="joinform" ��
    	        // �� ���Ͽ��� ���� �̸� ����ϸ� ���� �߻�-���� ��ġ�� �����
    	       alert("�̸��� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
    	       document.joinform.name.focus();
    	       return false;
    	    }
    	    document.joinform.submit();
    }
    
    function check_id() 
    {
      var JSPName = "id_check.jsp";
      browsing_window = window.open(JSPName, "_idcheck","height=220,width=420");
       browsing_window.focus(); 
      // ����� ������ â�� �� ������ ǥ�� 
     }

 </script>

<body>

<form name="joinform" action="memberJoinOk.jsp" method="post">
 <!-- �ݵ�� �� �̸� �� ���ϸ�� ���� �Ѵ�. -->
<center>
<table border=1>

<tr><td colspan="2" align=center>
      <b><font size=5>ȸ������ ������</font></b> </td> </tr>
<tr><td>���̵� : </td>
      <td><input type="text" name="id" readonly/>
     

			<!-- �Ƶ�� ���� ���ϰ� �ϱ� �������� --> 
			
			<input TYPE=button VALUE="ID Check" onclick="check_id()" onmouseover="this.style.cursor='hand';">
			<!--  onmouseover="this.style.cursor='hand' ���콺�� �ö󰡸� �� ������� ��ȯ -->
			      
      
      </td></tr>
<tr><td>��й�ȣ :  </td>
           <td><input type="password" name="pass"/></td></tr>
<tr><td>�̸� : </td><td><input type="text" name="name"/></td></tr>
<tr><td>���� : </td><td><input type="text" name="age" 
        maxlength=2 size=5/></td></tr>
<tr><td>���� : </td>
      <td><input type="radio" name="gender" value="����" checked/>����
      <input type="radio" name="gender" value="����"/>����  </td></tr>
<tr><td>�̸��� �ּ� : </td><td><input type="text" name="email" 
         size=30/></td></tr>
<tr><td colspan="2" align=center>

<INPUT TYPE = "button" VALUE = ȸ������ onclick="valid_check()">      
       &nbsp;&nbsp;

     <!-- <input type="submit" value="ȸ�������ϱ�"> &nbsp;&nbsp;  -->
     <a href="javascript:joinform.reset()">�ٽ��ۼ�</a>
</td></tr>
</table></center></form>
</body></html>


           