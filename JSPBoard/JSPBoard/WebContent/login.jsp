<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <!-- jQuery -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Piedra&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
    
    <!-- 쿠키 cdn -->
    
    
    
    <style>
        #wrap{
            width: 70%;
            margin: auto;
            background-color: rgb(255, 247, 244);
        }
        .pan{
            width: 100%;
        }
        #upPan{
        }
        #logo{
            font-family: 'Hi Melody', cursive;
            font-size: 55px;
            font-weight: 400;
            color: rgb(8, 214, 241);
            text-align: center;
            padding-top: 40px;
            padding-bottom: 20px;
        }
        #upPan form{
            
        }
        .inputlogin{
            display: block;
            width: 80%;
            height: 50px;
            margin: auto;
            margin-bottom: 10px;
            border: 1px solid rgb(219, 219, 219);
            padding-left: 8px;
        }
        #submitBtn{
            background-color: rgb(8, 214, 241);
            border: none;
            display: block;
            width: 80%;
            height: 60px;
            margin: auto;
            margin-top: 30px;
            color: white;
            font-size: 20px;
        }
        #autoLoginBox{
            margin-left: 10%;
            width: 30%;
            margin-top: 7px;
        }
        .font1{
            font-size: 14px;
        }
        hr{
            margin-top: 20px;
            background-color: rgb(189, 189, 189);
            margin-bottom: 20px;
        }
        #bookMark{
            text-align: center;
        }
        #bookMark a{
            text-decoration: none;
            font-size: 13px;
            color: rgb(110, 110, 110);
            margin-right: 15px;
        }
        #billBoard img{
            display: block;
            margin: auto;
            width: 90%;
            margin-top: 40px;
        }
    </style>

    <script>
    $(document).ready(function(){
		var result='${result}';
		checkModal(result);//함수호출
		
		history.replaceState({},null,null);//history.state를 null로 변경
		
		function checkModal(result){
			if(result.length===0){		
				console.log("0");
			}else{
				alert(result);		
			}
		}
		
		$('#logo').click(function(){
        	location.href = "main.do";
        });
	});
    </script>

</head>
<body>

    <div id="wrap">
        <div id="upPan" class="pan">
            <div id="logo">MegaBoard</div>
            <form action="" method="POST" accept-charset="utf-8" onsubmit="return lastCheck();">
                <input type="text" id="inputID" class="inputlogin" name="inputLoginId" placeholder="  아이디"/>
                <input type="password" id="inputPW" class="inputlogin" name="inputLoginPw" placeholder="  비밀번호"/>
                <input type="submit" id="submitBtn" value="로그인"/>
                <div id="autoLoginBox" >
                    <input type="checkbox" id="autoLogin" name="자동로그인" /><span class="font1">자동로그인</span>
                </div>
            </form>
            <hr>
        </div>
    
        <div id="centerPan" class="pan">
            <div id="bookMark">
                <a href="">아이디 찾기</a>
                <a href="">비밀번호 찾기</a>
                <a href="join.do">회원가입</a>
            </div>
        </div>
    
        <div id="downPan" class="pan">
            <div id="billBoard">
                <img src="img/samsung_banner.PNG"/>
            </div>
        </div>
    </div>
</body>
</html>