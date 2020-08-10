<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Piedra&display=swap" rel="stylesheet">
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
    <!-- 제이쿼리 -->
    <script
    src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>

    <style>
        #border{
            width: 500px;
            height: 600px;
            background-color: rgb(249, 255, 225);
            border: 2px solid rgb(194, 194, 194);
        }
        #border h1{
            text-align: center;
            font-family: 'Do Hyeon', sans-serif;
            font-weight: 100;
            font-size: 26px;
        }
        #border hr{
            width: 95%;
        }
        form input{
            width: 92%;
            margin-left: 10px;
            margin-bottom: 10px;
            padding-left: 10px;
            height: 30px;
            border: 1px solid rgb(179, 179, 179);
            border-radius: 5px;
        }
        form textarea{
            width: 90.5%;
            margin-left: 10px;
            padding: 10px;
            height: 160px;
            border: 1px solid rgb(179, 179, 179);
            border-radius: 5px;

        }
        form p{
            width: 91%;
            margin-left: 10px;
            padding: 10px;
            height: 90px;
            border: 1px solid rgb(197, 197, 197);
            border-radius: 5px;
            font-family: 'Gamja Flower', cursive;
            font-weight: 400;
            font-size: 18px;
            color: rgb(0, 0, 0);
        }

        #submitBtn{
            width: 95.2% !important;
            height: 40px !important;
            font-family: 'Do Hyeon', sans-serif;
            font-weight: lighter;
            color: rgb(75, 75, 75);
            font-size: 16px;
            border-radius: 5px;
        }
        #submitBtn:hover{
            background-color: rgb(219, 219, 219);
        }
    </style>

    <script>
        function check(){
            if(blankCheck()){
                if(emailCheck()){
                    return true
                }
            }
            return false
        }

        function blankCheck(){
            if($('#titleArea').val() == ""){
                alert("게시판 이름을 입력해주세요");
                return false
            }
            return true;
        }

        function emailCheck(){
            //이메일 정규식
            var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            if(!emailRule.test($('#emailArea').val())) {            
                alert("이메일 형식을 확인해주세요");
                return false;
            }
            return true;
        }
    </script>

</head>
<body>
	<% 
		String loginID = (String)session.getAttribute("loginUser");
    %>
    <c:set var='str' value='<%=loginID %>'/>
    
    
    <div id="border">
        <h1>게시판 신청</h1>
        <hr>
        <form method="POST" name="frm" >
            <input type="text" id="titleArea" name="title" placeholder=" 신청하실 게시판 이름(학교명)을 입력해주세요"/>
            <input type="text" value="${str}" name="id" readonly>
            <input type="text" id="emailArea" name="email" placeholder=" 연락가능한 이메일을 입력해주세요"/>
            <textarea name="content" placeholder="신청서 내용을 입력해주세요"></textarea>
            <p>위 내용을 토대로 관리자 승인 이후 게시판이 개설됩니다.<br>확인 및 증빙내용이 필요한 경우 이메일을 통해 요구될 수 있습니다.<br>게시판 개설이 반려될 수 있습니다.</p>
            <input type="submit" id="submitBtn" value="동의하고 신청하기" onclick="return check()">
        </form>
    </div>

</body>
</html>