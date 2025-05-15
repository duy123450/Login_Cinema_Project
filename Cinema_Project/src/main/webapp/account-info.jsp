<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ECom Website</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="./style.css" rel="stylesheet">
</head>

<body class="d-flex flex-column min-vh-100">

    <!-- Header -->
    <jsp:include page="./partial/header.jsp"></jsp:include>

    <!-- Nội dung chính -->
    <main class="flex-grow-1">
        <div class="container mt-5 my-5">
            <h1 class="mb-4 text-center">Thông tin tài khoản</h1>

            <div class="row justify-content-center">
                <div class="col-md-8">
                    <form>
                        <div class="mb-3 row align-items-center justify-content-center">
                            <div class="col-md-12">
                                <label for="inputFullName" class="form-label">Họ và tên</label>
                                <div class="row">
                                    <div class="col-md-9 mb-3">
                                        <input type="text" class="form-control" id="inputFullName"
                                            placeholder="Nhập họ tên">
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <button type="submit" class="btn btn-success w-100">Lưu</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <form>
                        <div class="mb-3 row align-items-center justify-content-center">
                            <div class="col-md-12">
                                <label for="inputEmail" class="form-label">Email</label>
                                <div class="row">
                                    <div class="col-md-9 mb-3">
                                        <input type="text" class="form-control" id="inputEmail"
                                            placeholder="Nhập email">
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <button type="submit" class="btn btn-success w-100">Lưu</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <form>
                        <div class="mb-3 row align-items-center justify-content-center">
                            <div class="col-md-12">
                                <label for="inputAddress" class="form-label">Địa chỉ</label>
                                <div class="row">
                                    <div class="col-md-9 mb-3">
                                        <input type="text" class="form-control" id="inputAddress"
                                            placeholder="Nhập email">
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <button type="submit" class="btn btn-success w-100">Lưu</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <div class="mb-3 row align-items-center justify-content-center">
                        <div class="col-md-12">
                            <label for="inputUsername" class="form-label">Tên người dùng</label>
                            <div class="row">
                                <div class="col-md-9 mb-3">
                                    <input type="text" class="form-control" id="inputUsername" readonly>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3 row align-items-center justify-content-center">
                        <div class="col-md-12">
                            <label for="inputNewPassword" class="form-label">Mật khẩu mới</label>
                            <div class="row">
                                <div class="col-md-9 mb-3">
                                    <input type="password" class="form-control" id="inputNewPassword"
                                        placeholder="Nhập mật khẩu mới">
                                </div>
                            </div>
                        </div>
                    </div>

                    <form>
                        <div class="mb-3 row align-items-center justify-content-center">
                            <div class="col-md-12">
                                <label for="inputConfirmNewPassword" class="form-label">Nhập lại mật khẩu mới</label>
                                <div class="row">
                                    <div class="col-md-9 mb-3">
                                        <input type="password" class="form-control" id="inputConfirmNewPassword"
                                            placeholder="Nhập lại mật khẩu mới" disabled>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <button type="submit" class="btn btn-success w-100" disabled>Lưu</button>
                                    </div>
                                </div>
                            </div>
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