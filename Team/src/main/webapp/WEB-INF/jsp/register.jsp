<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register - SB Admin</title>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous"></script>        
<script>
	function adduser(){
		if(document.getElementById("uid").value==""){
	        alert("아이디를 입력하세요");
	        return;
	    }
		if(document.getElementById("pwd").value==""){
	        alert("비밀번호를 입력하세요");
	        return;
	    }
		if(document.getElementById("phone").value==""){
	        alert("전화번호를 입력하세요");
	        return;
	    }
		if(document.getElementById("name").value==""){
	        alert("이름을 입력하세요");
	        return;
	    }
		if(document.getElementById("email").value==""){
	        alert("이메일을 입력하세요");
	        return;
	    }
		if(document.getElementById("address").value==""){
	        alert("주소를 입력하세요");
	        return;
	    }
		if(document.getElementById("uid").value.length<4){
			alert("아이디를 4자리 이상 입력하세요");
			return;
		}
		if(document.getElementById("pwd").value.length<8){
			alert("비밀번호를 8자리 이상 입력하세요");
			return;
		}

		var serData = $('#addform').serialize();
		$.ajax({
			url:'/user/insertuser',
			method:'post',
			cache:false,
			data:serData,
			dataType:'json',
			success:function(res){
				alert(res.insertuser ? '회원가입 성공':'실패');
				location.href='/page/login';
			},
			error:function(xhr,status,err){
				alert('이미 가입된 아이디입니다'+err);
			}
		});
		
		return false;
	}
</script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Account</h3></div>
                                    <div class="card-body">
                                        <form id="addform" onsubmit="return adduser();">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="uid" id="uid" type="text" placeholder="Enter your ID" />
                                                        <label for="inputID">ID</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" name="pwd" id="pwd" type="text" placeholder="Enter your Password" />
                                                        <label for="inputPassword">Password</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="email" id="email" type="email" placeholder="name@example.com" />
                                                <label for="inputEmail">Email address</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="name" id="name" type="text" placeholder="Full Name" />
                                                <label for="inputEmail">Full Name</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="address" id="address" type="text" placeholder="Address" />
                                                <label for="inputEmail">Address</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="phone" id="phone" type="text" placeholder="010-xxxx-xxxx" />
                                                <label for="inputEmail">Phone Number</label>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><input class="btn btn-primary btn-block" type="submit" value="Create Account"></div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="login.html">Have an account? Go to login</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    </body>
</html>