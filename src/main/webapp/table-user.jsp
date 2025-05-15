<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="model.User"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cinema</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="./style.css" rel="stylesheet" href="">
</head>
<body class="d-flex flex-column min-vh-100">

	<!-- Header -->
	<jsp:include page="./partial/header.jsp"></jsp:include>

	<!-- Main -->
	<h2 style="text-align: center;">Danh sách người dùng</h2>
	<table>
		<tr>
			<th>User ID</th>
			<th>Họ và tên</th>
			<th>Email</th>
			<th>Tên đăng nhập</th>
			<th>Vai trò</th>
			<th>Thoi gian tao</th>
			<th>Thoi gian sua</th>
		</tr>
		<%
		List<User> users = (List<User>) request.getAttribute("users");
		if (users != null) {
			for (User user : users) {
		%>
		<tr>
			<td><%=user.getUserID()%></td>
			<td><%=user.getFullname()%></td>
			<td><%=user.getEmail()%></td>
			<td><%=user.getUsername()%></td>
			<td><%=user.getRoleName()%></td>
			<td><a href="./getUserDetail?id=<%=user.getUserID()%>">Chỉnh
					sửa</a>&emsp;<a href="./deleteUser?id=<%=user.getUserID()%>">Xoá</a></td>
		</tr>
		<%
		}
		} else {
		%>
		<tr>
			<td colspan="4">Không có dữ liệu người dùng.</td>
		</tr>
		<%
		}
		%>
	</table>

	<form id="simple-form" enctype="application/x-www-form-urlencoded">
		<div class="mb-3">
			<label for="inputUserID" class="form-label">Id</label> <input
				type="text" class="form-control" id="inputUserID" name="id" required />
		</div>
		<div class="mb-3">
			<label for="inputFullName" class="form-label">Họ và tên</label> <input
				type="text" class="form-control" id="inputFullName" name="fullname"
				required />
		</div>
		<div class="mb-3">
			<label for="inputEmail" class="form-label">Email</label> <input
				type="email" class="form-control" id="inputEmail" name="email"
				required />
		</div>
		<div class="mb-3">
			<label for="inputUsername" class="form-label">Tên đăng nhập</label> <input
				type="text" class="form-control" id="inputUsername" name="username"
				required />
		</div>
		<div class="mb-3">
			<label for="password" class="form-label">Mật khẩu</label> <input
				type="password" class="form-control" id="password"
				name="passwordInput" />
		</div>
		<div class="mb-3">
			<label for="role-name" class="form-label">Vai tro</label> 
			<select id="role-name">
		    	<option value="ADMIN">ADMIN</option>
		    	<option value="CUSTOMER">CUSTOMER</option>
			</select>
		</div>

		<button type="button" class="btn btn-primary w-100"
			onclick="submitFormCreateUser()">Tạo mới</button>
		<button type="button" class="btn btn-primary w-100"
			onclick="resetForm()">Làm mới</button>
	</form>

	<!-- Footer -->
	<jsp:include page="./partial/footer.jsp"></jsp:include>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- JavaScript -->
	<script>
		function submitFormCreateUser() {
			const form = document.getElementById("simple-form");
			
		    const params = new URLSearchParams();
		    params.append("fullNameInput", document.getElementById("full-name").value);
		    params.append("emailInput", document.getElementById("email").value);
		    params.append("usernameInput", document.getElementById("username").value);
		    params.append("passwordInput", document.getElementById("password").value);
		    params.append("addressInput", document.getElementById("address").value);
		    params.append("roleNameInput", document.getElementById("role-name").value);
	
		    fetch("./createUser", {
		        method: "POST",
		        headers: {
		            "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8"
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
		
		function resetForm() {
		    document.getElementById("full-name").value = "";
		    document.getElementById("email").value = "";
		    document.getElementById("username").value = "";
		    document.getElementById("password").value = "";
		    document.getElementById("address").value = "";
		    document.getElementById("role-name").value = "customer";
		}
	</script>
</body>
</html>
