<%-- 
    Document   : index
    Created on : Mar 5, 2022, 7:21:26 PM
    Author     : Hai Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang Chủ</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <link href="css/global.css" rel="stylesheet" type="text/css"/>
        <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <nav class="headerNav navbar navbar-expand-lg container">
                <div class="container-fluid">
                    <a class="navLogo navbar-brand text-center" href="index.html">
                        <p class="fw-bold mb-0"><i class="fa fa-book"></i> QUẢN LÝ</p>
                        <p class="fw-bold mb-0">NHÀ TRỌ</p>
                    </a>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarNavDropdown">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index">Trang chủ </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="detail">Quản lý</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="income">Khoản Thu</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="spend">Khoản Chi</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="history">Lịch Sử</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="service">Nhà xe</a>
                            </li>
                            <li class="nav-item user">
                                <i class="fa fa-user-circle"></i>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link log_out" href="logout">Thoát</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <section class="content">
            <div class="content_header">
                <p><i class="fa fa-align-justify"></i> THÔNG TIN CHUNG</p>
            </div>
            <div class="content_report">
                <p><i class="fa fa-hotel"></i> Tổng số phòng: <span>${requestScope.rooms.size()}</span></p>
                <p><i class="fa fa-battery-full" style="color: rgba(255, 0, 0,0.7);"></i> Phòng đang thuê: <span>${requestScope.roomInRent}</span></p>
                <p><i class="fa fa-battery-empty" style="color: #adff2f;"></i> Phòng trống:  <span>${requestScope.roomEmpty}</span></p>
                <p><i class="fa fa-user-alt" style="margin-right: 10px;"></i>Tổng số người thuê:  <span>${requestScope.customerTotal}</span></p>
            </div>
            <div class="content_main">
                <c:if test="${requestScope.rooms.size()>0}">
                    <c:forEach items="${requestScope.rooms}" var="r">
                        <div class="room" style="background-color: ${r.contract.customers.size() > 0 ?"rgba(255, 0, 0,0.7)":"#adff2f"};">
                            <p><i class="fa fa-home"></i><br>Phòng ${r.rid}</p>
                            <div class="room_type">${r.contract.customers.size()}/${r.type} người</div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${requestScope.rooms.size() eq 0}">
                    <p style="text-align: center;">Ko có phòng nào để hiện thị</p> 
                </c:if>
            </div>
        </section>


        <script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
    </body>
</html>
