<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- font awasome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Piedra&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
    <!-- jQuery -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="js/jquery.cookie.js"></script>
    
    <style>
        body{
            background-color: rgb(253, 248, 238);
        }
        .hidden{
            display: none;
        }
        .wrap{
            width: 80%;
            height: auto;
            margin: auto;
            background-color: white;
        }
        #mainTop{
            margin-left: auto;
            margin-right: auto;
            width: 80%;
            height: 100px;
            background-color: white;
        }
        #logo{
            font-family: 'Hi Melody', cursive;
            font-size: 48px;
            color: rgb(8, 214, 241);
            text-align: center;
            padding-top: 30px;
            width: 30%;
            height: 100%;
            float: left;
        }
        #logo:hover{
            color: rgb(0, 225, 255);
        }
        #logo img{
            width: 30px;
        }
        #logo a{
            text-decoration: none;
            color: rgb(8, 214, 241);
        }
        #top_search{
            width: 100%;
            padding-top: 36px;
            
        }
        #search{
            float: left;
            height: 40px;
            width: 50%;
            border: 1px solid rgb(8, 214, 241);
            border-radius: 3px;
        }
        #searcherBtn{
            height: 45px;
            width: 10%;
            max-width: 150px;
            text-align: center;
            margin-left: 5px;
            border: none;
            border-radius: 4px;
            background-color: rgb(8, 214, 241);
            color: white;
            font-weight: 400;
        }
        #searcherBtn:hover{
            background-color: rgb(0, 225, 255);
        }

        #nav{
            width: 100%;
            height: 33px;
            padding-top: 7px;
            border-top : 1px solid rgb(179, 179, 179);
            border-bottom : 1px solid rgb(179, 179, 179);

        }
        #nav a{
            margin: auto;
            margin-left: -30px;
            margin-right: 60px;
            padding-top: 0px;
            text-decoration:none;
            color: rgb(136, 136, 136);
            font-family: "Merriweather Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        }
        #nav a:hover{
            color: rgb(36, 36, 36);

        }

        #billboard{
            float: left;
            width: 70%;
            height: 10%;
            min-height: 124px;
            margin-top: 5px;
            margin-bottom: 5px;
        }
        #mainboard{
            width: 100%;
            height: 10%;
            min-height: 124px;
        }

        #loginBox{
            float: left;
            width: 30%;
            height: 10%;
            min-height: 124px;
            margin-top: 5px;
            text-align: center;
        }
        #loginBorder{
            position: relative;
            border: 1px solid rgb(196, 196, 196);
            border-radius: 3px;
            width: 90%;
            height: 100%;
            margin-left: 10px;
            min-height: 120px;
        }
        #loginBorder_box1{
            color: rgb(63, 63, 63);

        }
        #loginBorder_box1 div input{
            background-color:rgb(0, 217, 255);
            border-radius: 10px;
            width: 33%;
            height: 30px;
            margin-top: 30px;
            margin-bottom: 10px;
            margin-left: 10px;
            font-size: 14px;
        }
        #loginBorder_box1_1{
            
        }
        #loginBorder_box1_2{
            padding-top: 6px;
            margin-top: 10px;
            color: rgb(63, 63, 63);
        }
        #loginBorder_box1_2_1{
            float: left;
            padding-top: 3px;
            width: 50%;
            height: 30px;
            border-top: 1px solid rgb(170, 170, 170);
            border-right: 1px solid rgb(170, 170, 170);
        }
        #loginBorder_box1_2_1:hover{
            background-color: rgb(199, 248, 255);
        }
        #loginBorder_box1_2_2{
            float: left;
            width: 49%;
            padding-top: 3px;
            height: 30px;
            border-top: 1px solid rgb(170, 170, 170);

        }
        #loginBorder_box1_2_2:hover{
            background-color: rgb(199, 248, 255);
        }
        #loginBorder_id{

        }
        #logoutBorder{
            position: relative;
            border: 1px solid rgb(196, 196, 196);
            border-radius: 3px;
            width: 90%;
            margin-left: 10px;
            min-height: 120px;
        }
        #loginBox input{
            height: 50px;
            width: 100%;
            max-width: 150px;
            border: none;
            border-radius: 2px;
            margin-top: 20px;
            background-color: rgb(28, 191, 212);
            color: white;
            font-weight: 500;
            font-size: 20px;
        }
        #loginBox input:hover{
            background-color: rgb(0, 225, 255);
        }
        #loginBox a{
            bottom: 0px;
            left: 0px;
            text-decoration:none;
            color: black;
            margin-left: 15px;
            padding-top: 16px;
            font-size: 11px;
            color: rgb(136, 136, 136);
            font-family: "Merriweather Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        }
        #loginBox a:hover{
            color: rgb(58, 58, 58);
        }

        
        
        #newsZone{
            float: left;
            width: 100%;
            background-color: white;
            border: 1px solid rgb(197, 197, 197);
        }
        #newsZone img{
            text-align: center;
        }

        #quickFinder{
            position: relative;
            float: left;
            width: 100%;
            height: 25px;
            margin-bottom: 5px;
        }
        #finderTitleBox{
            float: left;
            height: 100%;
            width: 10%;
            font-size: 14px;
            font-weight: 900;
            background-color: rgb(228, 228, 228);;
            border-bottom: none;
            text-align: center;
        }
        .quickBox{
            float: left;
            border: 1px solid rgb(177, 177, 177);
            border-radius: 8px;
            height: 100%;
            width: 13%;
            margin-left: 10px;
            text-align: center;
            font-size: 16px;
        }
        .quickBox a{
            width: 100%;
            height: 100%;
        }
        .quickBox:hover{
            background-color: rgb(0, 183, 255);
            border: none;
            color: white;
        }

        #searchResult{
            padding-top: 30px;
        }
        .results{
            float: left;
            width: 100%;
            height: 100px;
            margin-bottom: 20px;
        }
        .results:hover{
            background-color: rgb(218, 218, 218);
        }
        .results img{
            float: left;
            margin-left: 40px;
            margin-right: 10px;
        }
        .results h3, p{
            
        }
        hr{
        }
        #bottom{
            float: left;
            width: 100%;
            height: 100px;
            background-color: white;
        }
        h2{
            margin-left: 40px;
        }
    </style>

    <script>
        $(document).ready(function(){
            $('.results').click(function(){
                var arr = $(this).children('h3').text().split(" 게시판");
                var getTitle = arr[0];
                //alert(getTitle);
                location.href = 'searchGo.do?query='+getTitle;
            });
        });
        
        function searchCheck(){
			searchStr = document.getElementById('search').value;
			
			if(searchStr == ""){
				alert("검색어를 확인해주세요");
				return false;	
			}
			else{
				location.href = 'search.do?query='+searchStr;
				return false;	
			}
		}
        
        
      //<![CDATA[
		$(function() {
		    var temp = document.getElementById('boardList').value;
		    // 배열 형태로 전달
		    var availableBoard = temp.split(',');
		    
		    $("#search").autocomplete({
		        //source: availableBoard,
		        source: function(request, response) {
			        var results = $.ui.autocomplete.filter(availableBoard, request.term);
			        response(results.slice(0, 10));
			    },
		        
		        select: function(event, ui) {
		            console.log(ui.item);
		        },

		        focus: function(event, ui) {
		            return false;
		            //event.preventDefault();
		        }
		    });
		    
		    
		    
		 // 쿠키 가져오기
		 function getCookie(cName) {
		      cName = cName + '=';
		      var cookieData = document.cookie;
		      var start = cookieData.indexOf(cName);
		      var cValue = '';
		      if(start != -1){
		           start += cName.length;
		           var end = cookieData.indexOf(';', start);
		           if(end == -1)end = cookieData.length;
		           cValue = cookieData.substring(start, end);
		      }
		      var getCookieStr = unescape(cValue);
		      var cookieArr = getCookieStr.split("SEPERATE");
		     }
		 
		 	getCookie("BookMark");
		});
		//]]>
        
    </script>

</head>
<body>

    <!-- top -------------------------------------------------->
    <div id="mainTop">
        <div id="logo">
            <a href="main.do">MegaBoard</a>
        </div>
        <div id="top_search">
            <input type="text" id="search" value=${param.query}>
            <input type="submit" id="searcherBtn" value="검색" onclick="return searchCheck();"/>
            <input type="hidden" id="boardList" value='${tableList}'>
        </div>
    </div>
    <!-- top -->

    <!-- Navigation --------------------------------------------->
    <div class="wrap">
        <div id="nav">
            <a href="#">인기글</a>
            <a href="#">인기게시판</a>
            <a href="#">실시간</a>
            <a href="#">공지사항</a>
            <a href="#">건의사항</a>
            <a href="#">더보기</a>
        </div>
    </div>
    <!-- Navigation -->
    
    <!-- 검색결과 ------------------------------------------------->
    <div class="wrap">
        <div id="searchResult">
            <h2>검색결과</h2>
            <hr>
            
	        <c:forEach var="boardSearchList" items="${boardSearchList }">
	        	<span class="results">
	                <img src="img/boardIcon.png" alt="" height="100px" width="100px">
	                <h3>${boardSearchList.title} 게시판</h3>
	                <p>자세히보기</p>
	            </span>
	            <hr>
			</c:forEach>
	        
	        
        </div>
    </div>
    <!-- 검색결과 -->
    
    <div class="wrap">
        <div id="bottom"></div>
    </div>
    
</body>
</html>