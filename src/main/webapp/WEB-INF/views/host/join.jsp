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
        }

        .input {
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
            width: 150px;
            text-align: right;
        }

        .required label:before {
            color: rgb(238, 51, 34);
            content: '* ';
        }

    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"></jsp:include>

    <div class="signup">
        <h1>기업(호스트) 회원가입</h1>
        <br>
        <div class="required">
            <form name="join_form" action="/host/register.kh" method="post" enctype="multipart/form-data">
                <label>이메일</label><input type="email" class="input" id="email" name="hostEmail" placeholder=""><br>
                <label>비밀번호</label><input type="password" class="input" id="pwd" name="hostPwd" placeholder="문자/숫자/기호 포함, 6자~20자"><br>
                <label>비밀번호 확인</label><input type="password" class="input" id="pwd2" name="hostPwd2" placeholder="문자/숫자/기호 포함, 6자~20자" ><br><br>
                <label>대표자명</label><input type="text" class="input" id="name" name="hostName" placeholder="" ><br>
                <label>상호명</label><input type="text" class="input" id="space" name="companyName" placeholder="" ><br>
                <label>전화번호</label><input type="text" class="input" id="phone" name="hostPhone" oninput="hypenTel(this)" maxlength="13" placeholder="숫자만 입력" ><br>
                <label>은행명</label><input type="text" class="input" id="bank" name="accountName" placeholder="ex)국민은행/카카오뱅크 등" ><br>
                <label>예금주명</label><input type="text" class="input" id="holder" name="accountHolder" placeholder="" ><br>
                <label>계좌번호</label><input type="text" class="input" id="num" name="accountNumber" placeholder="숫자만 입력" ><br>
                <label>사업자 등록번호</label><input type="text" class="input" id="reg" name="companyRegNum" oninput="hypenReg(this)" maxlength="10" placeholder="숫자만 입력" ><br>
                <label for="photo">사업자 등록증 사진</label><input type="file" class="input" id="photo" name="uploadFile"><br>

                <br>
                <div><button type="button" class="button" onclick="joinform_check();">회원가입하기</button></div>
            </form>
        </div>
    </div>

    <script>
        
        const hypenTel = (target) => {
            target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
            }
            
            const hypenReg = (target) => {
            target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/^(\d{3})(\d{2})(\d{5})$/, `$1-$2-$3`);
            }

      function joinform_check() {
        var email = document.getElementById("email");
        var pwd = document.getElementById("pwd");
        var pwd2 = document.getElementById("pwd2");
        var name = document.getElementById("name");
        var space = document.getElementById("space");
        var phone = document.getElementById("phone");
        var bank = document.getElementById("bank");
        var holder = document.getElementById("holder");
        var num = document.getElementById("num");
        var reg = document.getElementById("reg");
        var photo = document.getElementById("photo");

        var emailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        if (!emailCheck.test(email.value)) {
            alert("올바른 이메일 형식을 입력하세요.");
            email.focus();
            return false;
        }
        
        if(pwd.value == "") {
            alert("비밀번호를 입력하세요.");
            pwd.focus();
            return false;
        }

        var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,20}$/;
        
        if (!pwdCheck.test(pwd.value)) {
            alert("비밀번호는 영문자+숫자+특수문자 조합으로 6~20자리 사용해야 합니다.");
            pwd.focus();
            return false;
        }

        if (pwd2.value !== pwd.value) {
            alert("비밀번호가 일치하지 않습니다.");
            pwd2.focus();
            return false;
        }
        
        var nameCheck = /^[가-힣]{2,}$/;
        if (!nameCheck.test(name.value)) {
            alert("대표자명은 한글 2글자 이상 입력하세요.");
            name.focus();
            return false;
            }

        if(space.value == "") {
            alert("상호명을 입력하세요.");
            space.focus();
            return false;
        }

        if(phone.value == "") {
            alert("전화번호를 입력하세요.");
            phone.focus();
            return false;
        }

        var phoneCheck = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
        if (!phoneCheck.test(phone.value)) {
            alert("올바른 형식의 전화번호를 입력하세요.");
            phone.focus();
            return false;
            }
        
        if(bank.value == "") {
            alert("은행명을 입력하세요.");
            bank.focus();
            return false;
        }
        
        var bankCheck = /^[가-힣]{4,}$/;
        if (!bankCheck.test(bank.value)) {
            alert("은행명을 올바르게 입력하세요.");
            bank.focus();
            return false;
            }

        if(holder.value == "") {
            alert("예금주명을 입력하세요.");
            holder.focus();
            return false;
        }
        
        var holderCheck = /^[가-힣]{2,}$/;
        if (!holderCheck.test(holder.value)) {
            alert("예금주명은 한글 2글자 이상 입력하세요.");
            holder.focus();
            return false;
            }

        var numCheck = /^[0-9]+$/;
        if (!numCheck.test(num.value)) {
            alert("계좌번호는 숫자만 입력하세요.");
            num.focus();
            return false;
        }
        
        if(reg.value == "") {
            alert("사업자 등록번호를 입력하세요.");
            reg.focus();
            return false;
        }
        
        var regCheck = /^[0-9]{3}-[0-9]{2}-[0-9]{5}/;
        if (!regCheck.test(reg.value)) {
            alert("올바른 형식의 사업자 등록번호를 입력하세요.");
            reg.focus();
            return false;
            }
        
        if(photo.value == "") {
            alert("사업자 등록증 사진을 등록하세요.");
            photo.focus();
            return false;
        }
       
        document.join_form.submit();
      }

      </script>
      
  <br><br><br><br><br><br>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>