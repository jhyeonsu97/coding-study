<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/register.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
   <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<script>

function fn_popup() {
   
   let url = "/passChange.do";
   window.open(url,"암호변경팝업","width=400,height=300");
   
}


$(function(){
   
   $("#btn_submit").click(function(){
      var userid = $.trim($("#userid").val());
      var pass   = $.trim($("#pass").val());
      var name   = $.trim($("#name").val());
      var nickname   = $.trim($("#nickname").val());
      
      userid = userid.replace(" ","");
      pass   = pass.replace(" ","");
      name   = name.replace(" ","");
      
      $("#userid").val(userid);
      $("#pass").val(pass);
      $("#name").val(name);
      
      var nick1 = "${vo.nickname}";
      var nick2 = $("#nickname").val();
      if(nick1 != nick2) {
         $("#nickname_change").val("Y");
      }
      
      if( userid.length < 3 || userid.length > 20 ) {
         alert("아이디를 3자리~20자리로 입력해주세요.");
         $("#userid").focus();
         return false;
      }
      if( pass.length < 4 || pass.length > 20 ) {
         alert("암호는 4~20자로 입력해주세요.");
         $("#pass").focus();
         return false;
      }
      
      if( name == "" ) {
         alert("이름을 입력해주세요.");
         $("#name").focus();
         return false;
      }
      if( nickname == "" ) {
         alert("닉네임을 입력해주세요.");
         $("#nickname").focus();
         return false;
      }
      var form = $("#frm").serialize();
      $.ajax({  
         type : "POST",
         url  : "/mbrModifySave.do",
         data : form,
         
         datatype : "text",
         success : function(data) {
             if(data == "1") {
               alert("수정완료!");
               location = "/";
             } else if(data == "2") {
                alert("암호가 일치하지 않습니다.");
                $("#pass").focus();
             } else if(data == "3") {
                alert("이미사용중인 닉네임입니다.");
                $("#nickname").focus();
             } else if(data == "4") {
               alert("다시 로그인을 해주세요.");
               location = "/loginWrite.do";
             }
          },
          error : function() {
             alert("전송실패");
          }
      });
   });
});


</script>

<body>
<header>
<%@ include file="../include/header.jsp" %>
</header>
    
<div id="wrapper">
        
    <div id="container">
        <div id="wrapper_title">회원 가입</div>
        <div class="mbskin">

            <form id="frm" name="frm">
            <input type="hidden" id="nickname_change" name="nickname_change" value="N">
  
            <div class="tbl_frm01 tbl_wrap">
                <table>
                <caption>사이트 이용정보 입력</caption>
                <tbody>
                <tr>
                    <th scope="row"><label for="userid">아이디<strong class="sound_only">필수</strong></label></th>
                    <td>
                       <input type="text" name="userid" readonly value="${vo.userid }" id="userid" required="" class="frm_input required " minlength="3" maxlength="20">
                        <span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
                        <span id="msg_userid"></span>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label for="pass">비밀번호<strong class="sound_only">필수</strong></label></th>
                    <td>
                    <input type="password" name="pass" id="pass"  value="${vo.pass }" required="" class="frm_input required" minlength="3" maxlength="20">
                    <button type="button" onclick="fn_popup()">암호변경</button>
                    </td>
                </tr>
                </tbody>
                </table>
            </div>

            <div class="tbl_frm01 tbl_wrap">
                <table>
                <caption>개인정보 입력</caption>
                <tbody>
                    <tr>
                        <th scope="row"><label for="name">이름<strong class="sound_only">필수</strong></label></th>
                        <td>
                            <input type="text" id="name" name="name" value="${vo.name }" required="" class="frm_input required " size="10">
                        </td>
                    </tr>
                            <tr>
                        <th scope="row"><label for="nickname">닉네임<strong class="sound_only">필수</strong></label></th>
                        <td>
                        
                           <input type="text" name="nickname" value="${vo.nickname }" id="nickname" required="" class="frm_input required nospace" size="10" maxlength="20">
                            <span class="frm_info">
                                공백없이 한글,영문,숫자만 입력 가능 (한글2자, 영문4자 이상)<br>
                                닉네임을 바꾸시면 앞으로 60일 이내에는 변경 할 수 없습니다.
                            </span>
                            <input type="hidden" name="mb_nick_default" value="">
                            
                            <span id="msg_mb_nick"></span>
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row"><label for="email">E-mail<strong class="sound_only">필수</strong></label></th>
                        <td>
                            <input type="text" name="email" value="${vo.email }" id="email" required="" class="frm_input email required" size="70" maxlength="100">
                        </td>
                    </tr>

                    
                            <tr>
                        <th scope="row"><label for="phone">전화번호</label></th>
                        <td><input type="text" name="phone" value="${vo.phone }" id="phone" class="frm_input " maxlength="20"></td>
                    </tr>
                    
                    <tr>
                        <th scope="row"><label for="mobile">휴대폰번호<strong class="sound_only">필수</strong></label></th>
                        <td>
                            <input type="text" name="mobile" value="${vo.mobile }" id="mobile" required="" class="frm_input required" maxlength="20">
                        </td>
                    </tr>
                
                </tbody>
            </table>
        </div>

        <div class="tbl_frm01 tbl_wrap">
            <table>
            <caption>기타 개인설정</caption>
            <tbody>
            <tr>
                <th scope="row"><label for="mailchk">메일링서비스</label></th>
                <td>
                    <input type="checkbox" name="mailchk" value="Y" id="mailchk" <c:if test="${vo.mailchk=='Y' }"> checked=""</c:if> >
                    정보 메일을 받겠습니다.
                </td>
            </tr>

                    <tr>
                <th scope="row"><label for="smschk">SMS 수신여부</label></th>
                <td>
                    <input type="checkbox" name="smschk" value="Y" id="smschk" <c:if test="${vo.smschk=='Y' }"> checked=""</c:if> >
                    휴대폰 문자메세지를 받겠습니다.
                </td>
            </tr>
            
                    <tr>
                <th scope="row"><label for="reg_mb_open">정보공개</label></th>
                <td>
                    <span class="frm_info">
                        정보공개를 바꾸시면 앞으로 0일 이내에는 변경이 안됩니다.
                    </span>
                    <input type="hidden" name="mb_open_default" value="">
                    <input type="checkbox" name="mb_open" value="1" checked="" id="reg_mb_open">
                    다른분들이 나의 정보를 볼 수 있도록 합니다.
                </td>
            </tr>
            
            
            <tr>
                <th scope="row">자동등록방지</th>
                    <td>
                        <fieldset id="captcha" class="captcha">
                        <legend><label for="captcha_key">자동등록방지</label></legend>
                        <img src="../images/kcaptcha_image.jpg" alt="" id="captcha_img">
                        <button type="button" id="captcha_mp3"><span></span>숫자음성듣기</button>
                        <button type="button" id="captcha_reload"><span></span>새로고침</button><input type="text" name="captcha_key" id="captcha_key" required="" class="captcha_box required" size="6" maxlength="6">
                        <span id="captcha_info">자동등록방지 숫자를 순서대로 입력하세요.</span>
                        </fieldset>
                    </td>
            </tr>
                    </tbody>
                    </table>
        </div>

        <div class="btn_confirm">
            <input type="submit" value="정보수정" id="btn_submit"  onclick="return false;"  class="btn_submit" accesskey="s">
            <a href="" class="btn_cancel">취소</a>
        </div>
        </form>

        </div>

    </div>
</div>
    
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>   

    
</body>
</html>