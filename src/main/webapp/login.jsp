<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cinema</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="./style.css" rel="stylesheet">
    
    <style>
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>

<body class="d-flex flex-column min-vh-100">

    <!-- Header -->
    <jsp:include page="./partial/header.jsp"></jsp:include>

    <!-- Main -->
    <main class="flex-grow-1">
        <div class="container mt-5 my-5">
            <h1 class="mb-4 text-center">Đăng nhập</h1>

            <div class="row d-flex justify-content-center">
                <div class="col-md-4">
                    <form id="simple-form" enctype="application/x-www-form-urlencoded">
                      <div class="mb-3">
                        <label for="username" class="form-label">Tên đăng nhập</label>
                        <input type="text" class="form-control" id="username" name="usernameInput" />
                        <div class="error-message" id="usernameErrorMessage"></div>
                      </div>
                      <div class="mb-3">
                        <label for="password" class="form-label">Mật khẩu</label>
                        <input type="password" class="form-control" id="password" name="passwordInput" />
                        <div class="error-message" id="passwordErrorMessage"></div>
                      </div>
                      <button type="button" class="btn btn-primary w-100" onclick="validateForm()">Đăng nhập</button>
                      <div class="mt-3 text-center">
                          Chưa có tài khoản? <a href="./register">Đăng ký</a> | 
                        <a href="./retrievePassword">Quên mật khẩu?</a>
                      </div>
                    </form>
                  </div>
            </div>
          </div>
    </main>

    <!-- Footer -->
    <jsp:include page="./partial/footer.jsp"></jsp:include>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- JavaScript -->
    <script>
    	// Validate form
	    function validateForm(){
			var user = document.getElementById("username").value.trim();
			var pass = document.getElementById("password").value;
			
			var isValid = true;
			
			// Check for username
			if(user === '') {
				usernameErrorMessage.textContent = 'Vui lòng nhập username của bạn.';
				isValid = false;
			} else {
				usernameErrorMessage.textContent = '';
			}
			
			// Check for password
			if(pass === '') {
				passwordErrorMessage.textContent = 'Vui lòng nhập password của bạn.';
				isValid = false;
			} else if(pass.length < 3) {
				passwordErrorMessage.textContent = 'Password của bạn không được dưới 3 ký tự';
				isValid = false;
			} else if(pass.length > 16) {
				passwordErrorMessage.textContent = 'Password của bạn không được quá 16 ký tự';
				isValid = false;
			} else {
				passwordErrorMessage.textContent = '';
			}
			
			if(isValid) {
				submitForm();
			}
		}
    	
    	// Submit form
		function submitForm() {
		    const form = document.getElementById("simple-form");

		    const params = new URLSearchParams();
		    params.append("action", action);
		    params.append("usernameInput", document.getElementById("username").value);
		    params.append("passwordInput", document.getElementById("password").value);
	
		    fetch("./login", {
		        method: "POST",
		        headers: {
		            "Content-Type": "application/x-www-form-urlencoded"
		        },
		        body: params.toString()
		    })
		    .then(response => {
	            if(response.redirected) {
	                window.location.href = response.url;
	            }
        	})
		    .catch(error => {
		        console.error("Lỗi:", error);
		        alert("Đã xảy ra lỗi khi gửi dữ liệu.");
		    });
		}
	</script>
</body>

</html>