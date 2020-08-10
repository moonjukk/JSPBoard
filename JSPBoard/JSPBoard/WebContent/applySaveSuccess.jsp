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
            height: 180px;
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
        p{
            width: 91%;
            margin-left: 10px;
            padding: 10px;
            height: 30px;
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
            margin-left: 10px;
            border: 1px solid rgb(179, 179, 179);
        }
        #submitBtn:hover{
            background-color: rgb(219, 219, 219);
        }
    </style>

    <script>
        function close(){
            location.href = "apply_admin.do";
        }
    </script>

</head>
<body>

    <div id="border">
        <h1>게시판 생성 완료</h1>
        <hr>
        <p>
            입력하신 게시판이 성공적으로 저장되었습니다.
        </p>
    </div>

</body>
</html>