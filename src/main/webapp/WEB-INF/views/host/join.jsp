<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>기업 회원가입</title>
    <style>
        .signup {
            text-align: center;
            margin-top: 100px;
        }

        #input {
            height: 30px;
            width: 400px;
            font-size: 15px;
            margin: 1px 80px 10px 20px;
        }

        .button {
            height: 50px;
            width: 400px;
            background-color:rgb(212, 191, 232);
            border-radius: 10px;
            border: none;
            font-size: 15px;
        }
        
        .required label {
            font-weight: bold;
            display: inline-block; 
            width: 120px;
            text-align: right;
        }

        .required label:before {
            color: rgb(238, 51, 34);
            content: '* ';
        }
    </style>
</head>
<body>
    <div class="signup">
        <h1>기업(호스트) 회원가입</h1>
        <br>
        <div class="required">
            <form name="email" action="/" method="post">
                <label>이메일</label><input type="email" id="input" placeholder="이메일을 입력해주세요." required><br>
                <label>비밀번호</label><input type="password" id="input" placeholder="문자/숫자/기호 포함하여 6자~20자 입력하세요." required><br>
                <label>비밀번호 확인</label><input type="password" id="input" placeholder="문자/숫자/기호 포함하여 6자~20자 입력하세요." required><br><br>

                <label>대표자명</label><input type="text" id="input" placeholder="이름을 입력해주세요." required><br>
                <label>상호명</label><input type="text" id="input" placeholder="상호명을 입력해주세요." required><br>
                <label>전화번호</label><input type="text" id="input" oninput="hypenTel(this)" maxlength="13" placeholder="숫자만 입력해주세요." required><br>
                <br>
                <div><button type="submit" class="button">회원가입하기</button></div>
            </form>
        </div>
    </div>

    <script>
        const hypenTel = (target) => {
       target.value = target.value
         .replace(/[^0-9]/g, '')
         .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
      }
      
      </script>
</body>
</html>