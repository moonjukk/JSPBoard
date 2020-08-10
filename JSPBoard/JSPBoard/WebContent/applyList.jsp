<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            overflow-y: scroll;
        }
        h1{
            text-align: center;
            font-family: 'Do Hyeon', sans-serif;
            font-weight: 100;
            font-size: 26px;
        }
        h3{
            font-family: 'Do Hyeon', sans-serif;
            font-weight: 100;
            font-size: 18px;
            margin-left: 10px;
        }
        #border hr{
            width: 95%;
        }
        span{
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

        .list{
            width: 92%;
            height: 90px;
            margin-left: 10px;
            background-color: rgb(255, 223, 211);
            padding: 10px;
            border-radius: 10px;
            margin-bottom: 10px;
        }
        .left{
            float: left;
            width: 80%;
            height: 100%;
        }
        .contentZone{
            height: 65%;
            padding: 5px;
            background-color: rgb(246, 249, 255);
            font-family: 'Gamja Flower', cursive;
            color: rgb(51, 51, 51);
            font-size: 14px;
            
        }
        
        .right{
            float: left;
            margin-left: 15px;
            width: 16%;
            height: 100%;
        }
        .right input{
            width: 100%;
            height: 45%;
            margin-top: 3px;
            border: 1px solid rgb(179, 179, 179);
            border-radius: 5px;
            font-family: 'Gamja Flower', cursive;
            font-size: 18px;
        }
        .right input:hover{
            background-color: rgb(218, 218, 218);
        }

        .marginLeft{
            margin-left: 10px;
        }
        .overFlow{
            overflow-y: scroll;
            width: 97%;
            margin-left: 5px;
        }
        
        #manageZone{
            margin-left: 20px;
            margin-bottom: 20px;
            
        }
        #formTextBtn{
            height: 30px;
            width: 77%;
        }
        #formSubmitBtn{
            height: 35px;

        }
    </style>

    <script>
        $(document).ready(function(){
        	$(".rejectBtn").click(function(){
        		var conf = confirm("정말 반려하시겠습니까?");
                if(conf){
                	var tempStr = $(this).parent().first().parent().first().children().first().children().first().text();
                	var num = tempStr.substring(1,2);
                	location.href = "apply_admin.do?message=2&num="+num;
                }
        	});
        	$(".rejectCancelBtn").click(function(){
        		var conf = confirm("정말 반려취소하시겠습니까?");
                if(conf){
                	var tempStr = $(this).parent().first().parent().first().children().first().children().first().text();
                	var num = tempStr.substring(1,2);
                	location.href = "apply_admin.do?message=0&num="+num;
                }
        	});
        	$(".emailBtn").click(function(){
        		var tempStr = $(this).parent().first().parent().first().children().first().children("#email").val();
        		alert("이메일 주소 : "+tempStr);
        	});
        	$(".approveBtn").click(function(){
        		var conf = confirm("정말 승인하시겠습니까?");
                if(conf){
                	var tempStr = $(this).parent().first().parent().first().children().first().children().first().text();
                	var num = tempStr.substring(1,2);
                	location.href = "apply_admin.do?message=1&num="+num;
                }
        	});
        	$("#formSubmitBtn").click(function(){
                var title = $("#formTextBtn").val();
                if(title==""){
                    alert("게시판 이름을 입력하세요");
                }
                else{
                    var temp = confirm("정말 ["+ title +"] 게시판을 생성하시겠습니까?\n게시판이름을 다시한번 확인해주세요.");
                    
                    if(temp){
                        window.open('applyTableSave.do?query='+title,'게시판','width=530, height=210')
                    }
                }
            });
        });

    </script>

</head>
<body>

    <div id="border">
        <h1>게시판 신청현황</h1>
        <hr>
        <h3># 게시판생성</h3>
        <div id="manageZone">
            <input id="formTextBtn" type="text" placeholder="생성할 게시판 이름">
            <input id="formSubmitBtn" type="button" value="생성하기">
        </div>
        
        <hr>
        <h3># 대기목록</h3>
		
		<c:forEach var="applyList0" items="${applyList0}">
	        <div class="list">
	            <div class="left">
	            	<span class="numPoint">[${applyList0.num}] </span>
	                <span>${applyList0.id} 님</span>
	                <span class="marginLeft">  [${applyList0.title}] 게시판</span>
	                <div class="contentZone overFlow">
	                    ${applyList0.content}
	                </div>
	                <input type="hidden" id="num" value="${applyList0.num}">
	                <input type="hidden" id="id" value="${applyList0.id}">
	                <input type="hidden" id="title" value="${applyList0.title}">
	                <input type="hidden" id="email" value="${applyList0.email}">
	                <input type="hidden" id="content" value="${applyList0.content}">
	            </div>
	            <div class="right">
	                <input type="button" class="approveBtn" value="승인">
	                <input type="button" class="rejectBtn" value="반려">
	            </div>
	        </div>
		</c:forEach>

        <br><hr>
        <h3># 반려목록</h3>
        <c:forEach var="applyList2" items="${applyList2}">
	        <div class="list">
	            <div class="left">
	            	<span class="numPoint">[${applyList2.num}] </span>
	                <span>${applyList2.id} 님</span>
	                <span class="marginLeft">  [${applyList2.title}] 게시판</span>
	                <div class="contentZone overFlow">
	                    ${applyList2.content}
	                </div>
	                <input type="hidden" id="num" value="${applyList2.num}">
	                <input type="hidden" id="id" value="${applyList2.id}">
	                <input type="hidden" id="title" value="${applyList2.title}">
	                <input type="hidden" id="email" value="${applyList2.email}">
	                <input type="hidden" id="content" value="${applyList2.content}">
	            </div>
	            <div class="right">
	                <input type="button" class="emailBtn" value="이메일">
	                <input type="button" class="rejectCancelBtn" value="반려취소">
	            </div>
	        </div>
        </c:forEach>
        
        
       	<br><hr>
        <h3># 승인목록</h3>
        <c:forEach var="applyList1" items="${applyList1}">
	        <div class="list">
	            <div class="left">
	            	<span class="numPoint">[${applyList1.num}] </span>
	                <span>${applyList1.id} 님</span>
	                <span class="marginLeft">  [${applyList1.title}] 게시판</span>
	                <div class="contentZone overFlow">
	                    ${applyList1.content}
	                </div>
	                <input type="hidden" id="num" value="${applyList1.num}">
	                <input type="hidden" id="id" value="${applyList1.id}">
	                <input type="hidden" id="title" value="${applyList1.title}">
	                <input type="hidden" id="email" value="${applyList1.email}">
	                <input type="hidden" id="content" value="${applyList1.content}">
	            </div>
	            <div class="right">
	                <input type="button" class="emailBtn" value="이메일">
	                <input type="button" class="rejectCancelBtn" value="승인취소">
	            </div>
	        </div>
        </c:forEach>
        
    </div>

</body>
</html>