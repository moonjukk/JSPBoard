<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <!-- Add icon library -->
    
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Piedra&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
    
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  	/>
    <script
    src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>

    <style>
    body {font-family: Arial, Helvetica, sans-serif;}
    * {box-sizing: border-box;}

    #titleImg{
        width: 180px;
    }
    
    #logo{
        font-family: 'Hi Melody', cursive;
        font-size: 68px;
        font-weight: 400;
        color: rgb(8, 214, 241);
        text-align: center;
        padding-top: 30px;
        width: 30%;
        height: 100%;
        float: left;
        display: block;
        margin: auto;
        margin-top: 40px;
        margin-bottom: 16px;
        width: 100%;
    }
    #logo:hover{
        transform: scale(1.1);
    }
    
    .input-container {
        display: -ms-flexbox; /* IE10 */
        display: flex;
        width: 100%;
        height: 45px;
        margin-bottom: 15px;
        border: 0.1px solid #CCCCCC;
    }

    .icon {
    padding: 10px;
    border: 0.1px solid #CCCCCC;
    border-right: none;
    color: rgb(163, 163, 163);
    height: 45px;
    width: 45px;
    text-align: center;
    }

    .input-field {
    width: 100%;
    padding: 10px;
    outline: none;
    }

    .input-field:focus {
    border: 2px solid rgb(175, 196, 218);
    }

    /* Set a style for the submit button */
    .btn {
        background-color: #0074E9;
        color: white;
        padding: 15px 20px;
        border: none;
        cursor: pointer;
        width: 101%;
        opacity: 0.9;
    }

    .btn:hover {
    opacity: 1;
    }

    .warning{
        border: 0.2px solid red !important;
    }

    .check{
        position: relative;
        color: #0073E9;
        left: 95%;
        top: -45px;
        font-size: 22px;
        margin: -20px;
    }
    .check2{
        top: -80px !important;
    }

    .dis_none{
        display: none;
    }
    .warning_text{
        color: red;
        margin-top: -5px;
        margin-left: 20px;
        font-size: 12px;
    }
    
    #checkPoint{
    	font-size: 12px
    }
    #footer{
        font-size: 10px;
        text-align: center;
    }
    </style>

    <script>
        var checkPoint1 = 0;
        var checkPoint2 = 0;
        var checkPoint3 = 0;
        var checkPoint4 = 0;
        var checkPoint5 = 0;

        function lastCheck(){

                console.log(checkPoint1);
                console.log(checkPoint2);
                console.log(checkPoint3);
                console.log(checkPoint4);
                console.log(checkPoint5);
                
                if(checkPoint1 == 0 || checkPoint2 == 0 || checkPoint3 == 0 || checkPoint4 == 0 || checkPoint5 == 0){
                    alert("입력정보를 확인하세요");
                    return false;
                }
            }

        $(function() {
            //아이디 정규식
            var emailRule = /^[A-Za-z0-9]{4,12}$/;
            function check_email(){
                var check1 = 0;
                var check2 = 0;
                if(!emailRule.test(document.form1.userid.value)){
                    $('#userid').addClass('warning');
                    $('#input_email1').addClass('dis_none');
                    $('#input_email2').removeClass('dis_none');
                    $('#check1').addClass('dis_none');
                    check2 = 0;
                    checkPoint1 = 0;
                }else{
                    $('#userid').removeClass('warning');
                    $('#input_email1').addClass('dis_none');
                    $('#input_email2').addClass('dis_none');
                    check2 = 1;
                }

                if(document.form1.userid.value==""){
                    $('#userid').addClass('warning');
                    $('#input_email1').removeClass('dis_none');
                    $('#input_email2').addClass('dis_none');
                    $('#check1').addClass('dis_none');
                    check1 = 0;
                    checkPoint1 = 0;
                }else{
                    check1 = 1;
                }

                if(check1==1 && check2==1){
                    $('#check1').removeClass('dis_none');
                    checkPoint1 = 1;
                }
            }

            function pw_check(){
                var passRule =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,12}$/;//숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
                if(!passRule.test(document.form1.userpw.value)){
                    $('#userpw').addClass('warning');
                    $('#input_pw').removeClass('dis_none');
                    $('#check2').addClass('dis_none');
                    checkPoint2 = 0;
                }else{
                    $('#userpw').removeClass('warning');
                    $('#input_pw').addClass('dis_none');
                    $('#check2').removeClass('dis_none');
                    checkPoint2 = 1;
                }
            }
            function pw_check2(){
                var pw1 = $('#userpw').val();
                var pw2 = $('#userpw_check').val();

                if(pw1==pw2 && pw1!=""){
                    $('#userpw_check').removeClass('warning');
                    $('#input_pw_check').addClass('dis_none');
                    $('#check3').removeClass('dis_none');
                    checkPoint3 = 1;
                }else{
                    $('#userpw_check').addClass('warning');
                    $('#input_pw_check').removeClass('dis_none');
                    $('#check3').addClass('dis_none');
                    checkPoint3 = 0;
                }
            }
            function name_check(){
                var nameRule = /^[가-힣]{2,4}$/;
                if(!nameRule.test(document.form1.username.value)){
                    $('#username').addClass('warning');
                    $('#input_name').removeClass('dis_none');
                    $('#check4').addClass('dis_none');
                    checkPoint4 = 0;
                }else{
                    $('#username').removeClass('warning');
                    $('#input_name').addClass('dis_none');
                    $('#check4').removeClass('dis_none');
                    checkPoint4 = 1;
                }
            }
            function phone_check(){
                var phoneRule = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/;
                if(!phoneRule.test(document.form1.userphone.value)){
                    $('#userphone').addClass('warning');
                    $('#input_phone').removeClass('dis_none');
                    $('#check5').addClass('dis_none');
                    checkPoint5 = 0;
                }else{
                    $('#userphone').removeClass('warning');
                    $('#input_phone').addClass('dis_none');
                    $('#check5').removeClass('dis_none');
                    checkPoint5 = 1;
                }
            }
            
            $('#userid').focusout(function() {
                check_email();
            });
            $('#userpw').focusout(function() {
                pw_check();
            });
            $('#userpw_check').focusout(function() {
                pw_check2();
            });
            $('#username').focusout(function(){
                name_check();
            });
            $('#userphone').focusout(function(){
                phone_check();
            });
            
            var message = document.getElementById('checkMessageBox').value;
            if(message == 'dupl'){
            	alert("죄송합니다. 중복되는 ID입니다.");
                pw_check();
                pw_check2();
                name_check();
                phone_check();
                check_email();
            }
            
            $('#logo').click(function(){
            	location.href = "main.do";
            });
        });
    </script>

</head>
<body>
<!--
<% request.setCharacterEncoding("UTF-8"); %>
-->
<form name="form1" action="join.do" method="post" accept-charset="utf-8" style="max-width:500px;margin:auto" onsubmit="return lastCheck();">
    
    <div id="logo">MegaBoard</div>

    <div class="input-container">
        <i class="fa fa-envelope icon"></i>
        <input class="input-field" type="text" placeholder="아이디(4~12자 이내)" name="userid" id="userid">
    </div>
    <i id="check1" class="fa fa-check check dis_none"></i>
    <p id="input_email1" class="dis_none warning_text">아이디를 입력하세요.</p>
    <p id="input_email2" class="dis_none warning_text">아이디 형식이 올바르지 않습니다.</p>
    
    <div class="input-container">
        <i class="fa fa-key icon"></i>
        <input class="input-field" type="password" placeholder="비밀번호(영문 숫자 특수문자 2가지이상 6~15자 이내)" name="userpw" id="userpw" value="${member.pw}">
    </div>
    <i id="check2" class="fa fa-check check dis_none"></i>
    <p id="input_pw" class="dis_none warning_text">비밀번호는 6~15자 이내로 입력하셔야 합니다.</p>

    <div class="input-container">
        <i class="fa fa-key icon"></i>
        <input class="input-field" type="password" placeholder="비밀번호 확인" name="userpw_check" id="userpw_check" value="${member.pw}">
    </div>
    <i id="check3" class="fa fa-check check dis_none"></i>
    <p id="input_pw_check" class="dis_none warning_text">비밀번호가 일치하지 않습니다.</p>

    <div class="input-container">
        <i class="fa fa-user icon"></i>
        <input class="input-field" type="text" placeholder="이름" name="username" id="username" value="${member.name}">
    </div>
    <i id="check4" class="fa fa-check check dis_none"></i>
    <p id="input_name" class="dis_none warning_text">이름을 정확히 입력하세요.</p>

    <div class="input-container">
        <i class="fas fa-mobile-alt icon"></i>
        <input class="input-field" type="text" placeholder="휴대폰번호" name="userphone" id="userphone" value="${member.phonenum}">
    </div>
    <i id="check5" class="fa fa-check check check2 dis_none"></i>
    <p id="input_phone" class="dis_none warning_text">휴대폰 번호를 정확하게 입력하세요.</p>

    <input type="submit" class="btn" value="동의하고 가입하기" style="margin-top: 20px;">
	<br>
	<p id="checkPoint">본인은 만 8세 이상이며, 이용약관, 개인정보 수집 및 이용, 개인정보 제공 내용을 확인 하였으며, 이에 동의합니다</p>
	
	<p id="footer">©MegaBoard Corp. All rights reserved.</p>
	
</form>
<input id="checkMessageBox" type="hidden" value="${param.ms}"/>
</body>
</html>






                