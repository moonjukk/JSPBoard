<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
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
            padding-left: 5px;
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
            background-color: white;
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
            width: 29%;
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
            margin-botton: 30px;
        }
        #newsZone img{
            text-align: center;
        }
        
        #quickFinder{
            position: relative;
            float: left;
            background-color: white;
            
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
            background-color: rgb(228, 228, 228);
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
            font-size: 15px;
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
    </style>
	<script>
		$(function() {
			var message = document.getElementById('checkMessageBox').value;
            if(message == 'newMember'){
            	alert("반갑습니다! 회원가입에 성공하셨습니다!")
            }
            
            <% 
            	String loginID = (String)session.getAttribute("loginUser");
            %>
            <c:set var='str' value='<%=loginID %>'/>
            
            //delegation
            $('#quickFinder').on("click", ".quickBox", function(){
            	var title = $(this).text(); 
				location.href = 'searchGo.do?query='+title;
            });
            
            // 게시판 신청 클릭 시
            $('#loginBorder_box1_2_2').click(function(){
            	window.open('apply.do','게시판신청','width=530, height=630')
            	//location.href = "apply.do";
            });
		});
		
		function logout(){
			var logoutCheck = confirm("정말로 로그아웃 하시겠습니까?");
			if(logoutCheck == true){
				location.href = 'logout.do';
			}
		}
		
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

		
		function listSaveCookie(temp){
			var getCookie = function(name) {
				var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
				return value? value[2] : null;
			};
			
			var boardListCookie = getCookie("boardList");
			
			var date = new Date();
			date.setTime(date.getTime() + (24 * 60 * 60 * 1000)); // 1일 간 저장
			var cookieExpires = "; expires=" + date.toGMTString();
			document.cookie = "boardList=" + escape(temp) + cookieExpires;
			console.log("boardList: "+boardListCookie);
		}
		
		
		//<![CDATA[
		$(function() {
		    var temp = document.getElementById('boardList').value;
		    
		    // list 등 nav에서도 활용가능하게 쿠키에 저장
		    listSaveCookie(temp);
		    
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
		           
		          // 최대 6개까지 최근방문 탭 추가
		          var sixFlag = 0;
		          var quickFinder = document.querySelector("#quickFinder");
				  for(var i=cookieArr.length-1, j=0	;	i>=0&&j<6	;	i--,j++){
					  // 동적 탭 추가
					  if(cookieArr[i] != ""){
						  var div = document.getElementById('quickFinder');
						  var plus = document.createElement('div');
						  plus.innerHTML = cookieArr[i];
						  div.appendChild(plus);
					  }
			      }
				  $('#quickFinder').children('div').addClass("quickBox");
				  $('#quickFinder').children('div').eq(0).removeClass("quickBox");
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
            <form method="POST" name="frm">
            	<input type="text" id="search">
            	<input type="submit" id="searcherBtn" value="검색" onclick="return searchCheck();"/>
            	<input type="hidden" id="boardList" value='${tableList}'>
            </form>
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

    <!-- Middle --------------------------------------------------->
    <div class="wrap">
        <div id="billboard">
            <img id="mainboard" src="https://ssl.pstatic.net/tveta/libs/1281/1281372/abc224766a12a7514495_20200610180324184.jpg" alt="">
        </div>
        
        <div id="loginBox">
        	<c:if test="${str==null}">
				<div id="logoutBorder" class="">
	                <input type="button" value="로그인" onclick="location.href='login.do'"><br>
	                <a href="join.do">회원가입</a>
	                <a href="#">비밀번호 찾기</a>
            	</div>
			</c:if>
				
        	<c:if test="${str!=null}">
				<div id="loginBorder" class="">
	                <div id="loginBorder_box1">
	                    <div id="loginBorder_box1_1">
	                    	<span><i class="fas fa-user-circle" style="font-size: 24px;"></i></span>
	                        <span id="loginBorder_id"><c:out value="${str}"/></span><span> 님</span>
	                        <input id="" type="button" value="로그아웃" onclick="return logout()"/>
	                    </div>
	                    <div id="loginBorder_box1_2">
	                        <div id="loginBorder_box1_2_1">내 정보</div>
	                        <div id="loginBorder_box1_2_2">게시판 신청</div>
	                    </div>
	                </div>
           		</div>
			</c:if><input id="checkMessageBox" type="hidden" value="${param.ms}"/>
        </div>
    </div>
    <!-- Middle -->


    <!-- 즐겨찾기 --------------------------------------------------->
    <div class="wrap">
        <div id="quickFinder">
            <div id="finderTitleBox">바로가기</div>
            <!-- 
	            	자바스크립트로 쿠키확인하여 동적생성
            -->
        </div>
    </div>
    <!-- 즐겨찾기 -->
    
    
    <!-- 뉴스_임시로 이미지 대체 ----------------------------------------->
    <div class="wrap">
        <div id="newsZone">
            <img src="./img/news1.PNG" alt=""/>
            <!-- <img src="./img/news2.PNG" alt=""/> -->
        </div>
    </div>
    <!-- 뉴스_임시로 이미지 대체 -->
    
	
	<!-- list에서 로그인 한 경우 쿠키에 경로가 남아있으면 해당 경로로 이동 -->
	<%
		//쿠키관리
		String url = "";
		try{
			Cookie[] cookies = request.getCookies();
	
			if(cookies!=null){
				for(int i=0; i<cookies.length; i++){
					if(cookies[i].getName().equals("url")){            
						url = cookies[i].getValue();
						// 경로 쿠키 제거
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
						
						//깨진 특수문자를 decode
						int index = url.indexOf("MyBoard%2F");
						String str = url.substring(index+10);
						str = str.replace("%3F", "?");
						str = str.replace("%3D", "=");
						str = str.replace("%26", "&");
						
						response.sendRedirect(str);
					}
				}
			}
		}catch(Exception e){}
	%>
	
</body>
</html>