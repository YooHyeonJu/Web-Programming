<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html><head>
<title>회원관리 시스템 회원가입 페이지</title>
</head>

<script language=javascript>
    function valid_check()
    {
    	// alert("사용자 함수를 호출 함.");
    	    if (document.joinform.id.value == "")
    	    {
    	         // joinform 은 form name="joinform" 임
    	        // 디른 파일에서 같은 이름 사용하면 에러 발생-에러 고치기 어려움
    	       alert("아이디를 입력하여 주시기 바랍니다.");
    	       document.joinform.id.focus();
    	       return false;
    	    }
    	    
    	    if ((document.joinform.id.value.length <4) || 
                    (document.joinform.id.value.length >=9 ))
			{
				alert("아이디는 4자 이상 8 자 이하 입니다.");
				document.joinform.id.focus();
				return false;
				// 추가적인 처리 : string과 int 값 구분하기
			}

    	    
    	    if (document.joinform.pass.value == "")
    	    {
    	         // joinform 은 form name="joinform" 임
    	        // 디른 파일에서 같은 이름 사용하면 에러 발생-에러 고치기 어려움
    	       alert("비밀번호를 입력하여 주시기 바랍니다.");
    	       document.joinform.pass.focus();
    	       return false;
    	    }
    	    
    	    if (document.joinform.pass.value.length != 4)
			{
				alert("비밀번호는 반드시 4자리여야 합니다.");
				document.joinform.pass.focus();
				return false;
			}
    	    
    	    
    	    if (document.joinform.name.value == "")
    	    {
    	         // joinform 은 form name="joinform" 임
    	        // 디른 파일에서 같은 이름 사용하면 에러 발생-에러 고치기 어려움
    	       alert("이름을 입력하여 주시기 바랍니다.");
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
      // 실행된 윈도우 창을 맨 앞으로 표시 
     }

 </script>

<body>

<form name="joinform" action="memberJoinOk.jsp" method="post">
 <!-- 반드시 폼 이름 은 파일명과 같게 한다. -->
<center>
<table border=1>

<tr><td colspan="2" align=center>
      <b><font size=5>회원가입 페이지</font></b> </td> </tr>
<tr><td>아이디 : </td>
      <td><input type="text" name="id" readonly/>
     

			<!-- 아디는 수정 못하게 일기 전용으로 --> 
			
			<input TYPE=button VALUE="ID Check" onclick="check_id()" onmouseover="this.style.cursor='hand';">
			<!--  onmouseover="this.style.cursor='hand' 마우스가 올라가면 손 모양으로 변환 -->
			      
      
      </td></tr>
<tr><td>비밀번호 :  </td>
           <td><input type="password" name="pass"/></td></tr>
<tr><td>이름 : </td><td><input type="text" name="name"/></td></tr>
<tr><td>나이 : </td><td><input type="text" name="age" 
        maxlength=2 size=5/></td></tr>
<tr><td>성별 : </td>
      <td><input type="radio" name="gender" value="남자" checked/>남자
      <input type="radio" name="gender" value="여자"/>여자  </td></tr>
<tr><td>이메일 주소 : </td><td><input type="text" name="email" 
         size=30/></td></tr>
<tr><td colspan="2" align=center>

<INPUT TYPE = "button" VALUE = 회원가입 onclick="valid_check()">      
       &nbsp;&nbsp;

     <!-- <input type="submit" value="회원가입하기"> &nbsp;&nbsp;  -->
     <a href="javascript:joinform.reset()">다시작성</a>
</td></tr>
</table></center></form>
</body></html>


           