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
                    <form>
                        <div class="mb-3">
                            <label for="inputFullName" class="form-label">Họ và tên</label>
                            <input type="text" class="form-control" id="inputFullName" required />
                        </div>
                        <div class="mb-3">
                            <label for="inputEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="inputEmail" required />
                        </div>
                        <div class="mb-3">
                            <label for="inputUsername" class="form-label">Tên đăng nhập</label>
                            <input type="text" class="form-control" id="inputUsername" required />
                        </div>
                        <div class="mb-3">
                            <label for="inputPassword" class="form-label">Mật khẩu</label>
                            <input type="password" class="form-control" id="inputPassword" required />
                        </div>
                        <div class="mb-3">
                            <label for="inputConfirmPassword" class="form-label">Nhập lại mật khẩu</label>
                            <input type="password" class="form-control" id="inputConfirmPassword" required />
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Đăng ký</button>
                        <div class="mt-3 text-center">
                            Đã có tài khoản? <a href="./login.jsp">Đăng nhập</a>
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
</body>

</html>