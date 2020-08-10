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
    
    <!-- font awasome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	
	
	
	<!-- jQuery -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="js/jquery.cookie.js"></script>

    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">

	<style>
        body{
            font-family: "Merriweather Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        }

        #nav{
            margin-bottom: 50px;
        }
        #nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
            position: -webkit-sticky; /* Safari */
            position:fixed;
            width: 100%;
            height: 50px;
            z-index: 100;
            top: 0;
        }
        #nav li {
            float: left;
        }
        #nav li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        #nav ul li a:hover{
            color: rgb(169, 204, 255);
        }

        #searcher{
            width: 25%;
            height: 60%;
            margin: 7px;
            margin-left: 40px;
        }
        #searcherBtn{
            height: 60%;
            margin-top: 7px;
            background-color: rgb(82, 142, 253);
            border: none;
            color: white;
        }
        #userManage{
            float: right;
            margin-right: 30px;
            margin-top: 12px;
            color: rgb(185, 185, 185);
        }
        #userManage i{
            height: 100%;
            font-size: 24px;
        }
        #userManage1_1{
            font-size: 20px;
        }
        #userManage1_2{
            font-size: 15px;
            margin-right: 20px;
        }
        .fa-door-open:hover{
            transform: scale(1.3);
            color: white;
        }
		.fa-users:hover{
            transform: scale(1.3);
            color: white;
        }


        .wrap{
            padding-left: 8%;
            padding-right: 8%;
            padding-bottom: 3%;
        }
        #boardTable{
            width: 100%;
        }
        #boardTable ul{
            clear: left;
            margin: 0;
            padding: 0;
            list-style-type: none;
        }
        #boardTableTitle{
            height: 35px;
            background-color: rgb(232, 248, 255);
            border-top: 1px solid rgb(129, 129, 129);
            border-bottom: 1px solid rgb(129, 129, 129);
            font-size: 15px;
        }
        #boardTableTitle li{
            width: 100%;
            padding-top: 7px;
            border-bottom: none !important;
        }
        .col li{
        	padding-top: 4px;
        	padding-bottom: 4px;
        }
        .col:hover li{
            background-color: rgb(230, 230, 230);
        }
        #boardTable ul li:nth-child(1){ width: 8%; }
        #boardTable ul li:nth-child(2){ width: 47%; }
        #boardTable ul li:nth-child(3){ width: 13%; }
        #boardTable ul li:nth-child(4){ width: 12%; }
        #boardTable ul li:nth-child(5){ width: 10%; }
        #boardTable ul li:nth-child(6){ width: 10%; }
        #boardTable ul li{
            text-align: center;
            float: left;
            margin: 0;
            height: 24px;
            padding: 2px, 1px;
            border-bottom: 1px solid rgb(129, 129, 129);
        }

        #boardBtnZone{
            margin-top: 35px;
        }
        .btn{
            border: none;
            border-radius: 7px;
            background-color: rgb(82, 142, 253);
            color: white;
            font-size: 14px;
            width: 90px;
            height: 30px;
        }
        .btn:hover{
            background-color: rgb(23, 104, 255);
        }
        #toListBtn{
            
        }
        #toWriteBtn{
            float: right;
        }
        
        .pagination{
            list-style: none;
            margin:0;
            padding:0;
        }
        .pagination li{
            margin-left: 30px;
            padding: 0 0 0 0;
            border : 0;
            float: left;
            text-decoration: none;
        }
        .pagination li a{
            text-decoration: none;
            border-radius: 5px;
            color: rgb(0, 0, 0);
            border: 2px solid rgb(168, 168, 168);
            padding: 10px;
        }
        .pagination li a:hover{
            background-color: rgb(82, 142, 253);
            color: white;
            border: 2px solid rgb(255, 255, 255);
        }
        .pagination li .active{
            background-color: rgb(82, 142, 253);
            color: white;
            border: 2px solid rgb(255, 255, 255);
            padding: 12px;
        }
    </style>
    
    <script>
        $(document).ready(function(){
            $('.col').click(function(){
            	var id = document.getElementById("getBoardID").value;
                var getNum = $(this).children().first().text();
                location.href = "BoardRead.do?id="+id+"&num="+getNum;
            });
            $('#toListBtn').click(function(){
            	var id = document.getElementById("getBoardID").value;
            	location.href = "list.do?id="+id;
            });
            $('#toListSearch').click(function(){
            	location.href = "BoardSearch.do";
            });
            $('#toWriteBtn').click(function(){
            	var id = document.getElementById("getBoardID").value;
            	var title = document.getElementById("getBoardTitle").value;
            	location.href = "BoardWrite.do?title="+title+"&id="+id;
            });
            
            // nav로그아웃 버튼 
            $('#logoutIcon').click(function(){
            	var logoutCheck = confirm("로그아웃 하시겠습니까?");
    			if(logoutCheck == true){
                	var currentUrl = window.location.href;
                	$.cookie('url', currentUrl);
                	location.href = "sessionLogout.do";
    			}
            })
            // nav로그인 버튼 
            $('#loginIcon').click(function(){
            	var currentUrl = window.location.href;
            	$.cookie('url', currentUrl);
            	location.href = "login.do";
            })
            
            <% 
        		String loginID = (String)session.getAttribute("loginUser");
			%>
			
			var title = document.getElementById("getParamTitle").value;
			//alert(title + " 이것을 쿠키에 저장");
			// 한글은 url인코딩하여 저장해야 오류가 나지않는다
			/*
			var date = new Date();
			date.setTime(date.getTime() + (10 * 24 * 60 * 60 * 1000)); // 10일간 저장
			var cookieExpires = "; expires=" + date.toGMTString();
			document.cookie = "BookMark=" + escape(title) + cookieExpires;
			*/
			var getCookie = function(name) {
				var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
				return value? value[2] : null;
			};
			
			var bookMarkCookie = getCookie("BookMark");
			
			var date = new Date();
			date.setTime(date.getTime() + (10 * 24 * 60 * 60 * 1000)); // 10일간 저장
			var cookieExpires = "; expires=" + date.toGMTString();
			
			if(bookMarkCookie==null){
				document.cookie = "BookMark=" + escape(title) + cookieExpires;
			}else{
				
				if(bookMarkCookie.indexOf(escape(title)) != -1){
					// bookmark 쿠키에 현제 title이 존재한다면
		          	var cookieArr = bookMarkCookie.split("SEPERATE");
					// 최근 6번 중에 존재하는지 체크
					var sixFlag = 0;
					for(var i=cookieArr.length-1, j=0	;	i>=0&&j<6	;	i--,j++){
			        	  if(unescape(cookieArr[i])==title){
			        		  sixFlag = 1;
			        		  break;
			        	  }
			        }
					
					if(sixFlag==0){
						// 최근 방문 6개 게시판중에 현제 접근한 게시판이 존재하지 않음
						document.cookie = "BookMark=" + bookMarkCookie + "SEPERATE" + escape(title) + cookieExpires;
					}else{
						// 최근 방문 6개 게시판중에 현제 접근한 게시판이 존재
						document.cookie = "BookMark=" + bookMarkCookie + cookieExpires;
					}
					
				}else{
					// bookmark 쿠키에 현제 title이 존재하지 않는다면
					document.cookie = "BookMark=" + bookMarkCookie + "SEPERATE" + escape(title) + cookieExpires;
				}
			}
			
			console.log("BookMark: "+bookMarkCookie);
			
			
			
			
			// 검색어 쿠키가져오기
		     function getListCookie(cName) {
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
		           
		          // hidden태그에 결과 넣어놓기
				  $("#searchLists").val(getCookieStr);
		     }
		     getListCookie("boardList");
		     
		     
		     
		     
		     
		     
		     // 검색어 쿠키 통해서 검색어 제공
		     var temp = document.getElementById('searchLists').value;
			    
			 // 배열 형태로 전달
			 var availableBoard = temp.split(',');
			    
			 $("#searcher").autocomplete({
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
        });
        
        function searchCheck(){
			searchStr = document.getElementById('searcher').value;
			
			if(searchStr == ""){
				alert("검색어를 확인해주세요");
				return false;	
			}
			else{
				location.href = 'search.do?query='+searchStr;
				return false;	
			}
		}
    </script>
    
</head>
<body>
	
	<c:set var='str' value='<%=loginID %>'/>
	
	<!-- 네비게이션 ----------------------------------------->
    <div id="nav">
        <ul>
            <li><a class="active" href="main.do">Home</a></li>
            <li><a href="#news">News</a></li>
            <li><a href="#contact">Contact</a></li>
            <span id="navSearchZon">
                <input type="text" id="searcher"/>
            	<input type="button" id="searcherBtn" value="검색" onclick="return searchCheck();"/>
            </span>
            <input type="hidden" id="searchLists">
            
            <!-- 로그인중이 아니라면 -->
            <c:if test="${str==null}">
            	<span id="userManage">
            		<i id="loginIcon" class="fas fa-users"></i>
            	</span>
            </c:if>
            
            <!-- 로그인 중이라면 -->
			<c:if test="${str!=null}">
				<span id="userManage">
	                <i class="fas fa-user-circle"></i>
	                <span id="userManage1_1"><c:out value="${str}"/></span>
	                <span id="userManage1_2">님 </span>
	                <i id="logoutIcon" class="fas fa-door-open"></i>
            	</span>
			</c:if>
			
        </ul>
    </div>
	<!-- 네비게이션 끝 -->
	
    <!-- 게시판 테이블 -------------------------------------->
    <div class="wrap">
        <br>
        <h1>${param.title} 게시판</h1>
        <input id="getParamTitle" type="hidden" value=${param.title}>
        
        <input id="getBoardTitle" type="hidden" value=${param.title}>
        <input id="getBoardID" type="hidden" value=${param.id}>
        
        <div class="list" id="boardTable">
            <ul id="boardTableTitle">
                <li>번호</li>
                <li>제목</li>
                <li>작성자</li>
                <li>작성일</li>
                <li>조회</li>
                <li>댓글</li>
            </ul>
            
            <c:forEach var="board" items="${boardList }">
            	<ul class="col">
            		<li>${board.num}</li>
            		<li>${board.title}</li>
            		<li>${board.id}</li>
            		<li><fmt:formatDate value="${board.writedate }" /></li>
            		<li>${board.readcount}</li>
            		<li>${board.replyCount}</li>
            	</ul>
			</c:forEach>
			
        </div>
        <div id="boardBtnZone">
            <input type="button" id="toListBtn" class="btn" value="목록으로">
            <input type="button" id="toListSearch" class="btn" value="검색">
            <input type="button" id="toWriteBtn" class="btn" value="글 작성">
        </div>
    </div>
    <jsp:include page="paging.jsp"></jsp:include>
    <!-- 게시판 테이블 끝 -->
</body>
</html>