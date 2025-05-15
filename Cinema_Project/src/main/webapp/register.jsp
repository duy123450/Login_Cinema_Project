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
</head>

<body class="d-flex flex-column min-vh-100">

    <!-- Header -->
    <jsp:include page="./partial/header.jsp"></jsp:include>

    <!-- Main -->
    <main class="flex-grow-1">
        <div class="container mt-5 my-5">
            <h1 class="mb-4 text-center">Đăng ký</h1>

            <div class="row d-flex justify-content-center">
                <div class="col-md-4">
                    <form id="simple-form" enctype="application/x-www-form-urlencoded">
                        <div class="mb-3">
                            <label for="inputFullName" class="form-label">Họ và tên</label>
                            <input type="text" class="form-control" id="inputFullName" name="fullname" required />
                        </div>
                        <div class="mb-3">
                            <label for="inputEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="inputEmail" name="email" required />
                        </div>
                        <div class="mb-3">
                            <label for="inputUsername" class="form-label">Tên đăng nhập</label>
                            <input type="text" class="form-control" id="inputUsername" name="username" required />
                        </div>
                        <div class="mb-3">
                            <label for="inputUsername" class="form-label">Dia chi</label>
                            <input type="text" class="form-control" id="inputAddress" name="address" required />
                        </div>
                        <div class="mb-3">
                            <label for="inputPassword" class="form-label">Mật khẩu</label>
                            <input type="password" class="form-control" id="inputPassword" name="password" required />
                        </div>
                        <div class="mb-3">
                            <label for="inputConfirmPassword" class="form-label">Nhập lại mật khẩu</label>
                            <input type="password" class="form-control" id="inputConfirmPassword" name="confirmPassword" required />
                        </div>
                        <button type="submit" class="btn btn-primary w-100" onclick="submitFormRegister()">Đăng ký</button>
                        <div class="mt-3 text-center">
                            Đã có tài khoản? <a href="./login">Đăng nhập</a>
                        </div>
                    </form>
                    <%-- Hiển thị thông báo lỗi nếu có --%>
					<%
					String error = (String) request.getAttribute("error");
					if (error != null) {
					%>
					<p style="color: red;"><%=error%></p> 
					<%
					}
					%>
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
	 	// Submit form
		function submitFormRegister() {
		    const form = document.getElementById("simple-form");

		    const params = new URLSearchParams();
		    params.append("fullNameInput", document.getElementById("inputFullName").value);
		    params.append("emailInput", document.getElementById("inputEmail").value);
		    params.append("usernameInput", document.getElementById("inputUsername").value);
		    params.append("passwordInput", document.getElementById("inputPassword").value);
		    params.append("addressInput", document.getElementById("inputAddress").value);
	
		    fetch("./register", {
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