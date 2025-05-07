<%@page import="model.User" %> 
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm sticky-top">
            <div class="container">
                <a class="navbar-brand" href="./home.jsp">
                    <img class="logo-thumb" src="./img/logo.png" alt="Logo">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <% User loginUser=(User)request.getSession().getAttribute("loginUser"); %>

                    <div class="collapse navbar-collapse justify-content-end" id="mainNavbar">
                        <ul class="navbar-nav mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="./films.jsp">Phim</a></li>
                            <li class="nav-item"><a class="nav-link" href="./tickets.jsp">Mua vé</a></li>
                            <li class="nav-item"><a class="nav-link" href=".about.jsp">Thông tin</a></li>
                            <li class="nav-item"><a class="nav-link" href="./contact.jsp">Liên hệ</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Tài khoản</a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <% if(loginUser==null) { %>
                                        <li><a class="dropdown-item" href="./login">Đăng nhập</a></li>
                                        <% } else { %>
                                            <li><a class="dropdown-item" href="./logout">Đăng xuất</a></li>
                                            <li><a class="dropdown-item" href="./invoices.jsp">Hoá đơn</a></li>
                                            <li><a class="dropdown-item" href="./account-info.jsp">Thông tin tài khoản</a></li>
                                            <% } %>
                                </ul>
                            </li>
                            <!-- <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Dữ liệu</a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="./table-user.jsp">Người dùng</a></li>
                            <li><a class="dropdown-item" href="./table-category.jsp">Loại sản phẩm</a></li>
                            <li><a class="dropdown-item" href="./table-product.jsp">Sản phẩm</a></li>
                            <li><a class="dropdown-item" href="./table-cart.jsp">Giỏ hàng</a></li>
                            <li><a class="dropdown-item" href="./table-invoice.jsp">Hoá đơn</a></li>
                        </ul>
                    </li> -->
                        </ul>
                    </div>
            </div>
        </nav>