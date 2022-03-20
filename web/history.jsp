<%-- 
    Document   : history
    Created on : Mar 20, 2022, 6:26:40 PM
    Author     : Hai Duong
--%>

<%@page import="model.History"%>
<%@page import="java.util.ArrayList"%>
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
        <link href="css/spend.css" rel="stylesheet" type="text/css"/>
        <%
            ArrayList<History> histories = (ArrayList<History>)request.getAttribute("histories");
        %>
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
                                <a class="nav-link" aria-current="page" href="index">Trang chủ </a>
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
                                <a class="nav-link active" href="history">Lịch Sử</a>
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
        <div id="main">
            <div class="main_heading">
                <h1>Lịch sử các khoản thu</h1>
            </div>
            <div class="main_content">
                <div class="filter_area">
                    <form action="history" method="POST" id="filterField">
                        <div class="filter_field">
                            <div class="filter_item">
                                <label for="from">Từ ngày:</label>
                                <input type="date" name="from" id="from">
                            </div>
                            <div class="filter_item">
                                <label for="to">Đến ngày:</label>
                                <input type="date" name="to" id="to">
                            </div>
                        </div>
                        <button type="submit">Tìm kiếm</button>
                    </form>
                </div>
                <c:if test="${requestScope.histories.size() > 0}">
                <div class="history_list">
                    <table>
                        <thead>
                            <tr>
                                <td>STT</td>
                                <td>Phòng</td>
                                <td>Tên khoản thu</td>
                                <td>Số tiền</td>
                                <td>Ngày nhận</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <%for(int i = 0; i < histories.size(); i++){%>
                            <tr>
                                <td><%=(i+1)%></td>
                                <td><%=(histories.get(i).getRoom().getRid())%></td>
                                <td><%=(histories.get(i).getName())%></td>
                                <td><%=(histories.get(i).getAmount())%></td>
                                <td><%=(histories.get(i).getReceiveddate())%></td>
                                <td>
                                    <a href="history/delete?id=<%=(histories.get(i).getId())%>">Xóa</a>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
                </c:if>
                <c:if test="${requestScope.histories.size() == 0}">
                    <p>Không có khoản thu nào được thanh toán</p>
                </c:if>
            </div>
        </div>


        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script>
            function show(id, displayForm) {
                var formCreate = document.getElementById(id);
                if (formCreate.style.display === "none") {
                    formCreate.style.display = displayForm;
                } else {
                    formCreate.style.display = "none";
                }
            }
        </script>
    </body>
</html>
