<%-- 
    Document   : service
    Created on : Mar 7, 2022, 9:44:08 PM
    Author     : Hai Duong
--%>

<%@page import="model.Vehicle"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nhà xe</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <link href="css/global.css" rel="stylesheet" type="text/css"/>
        <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
        <link href="css/service.css" rel="stylesheet" type="text/css"/>

        <%
            ArrayList<Vehicle> vehicles = (ArrayList<Vehicle>) request.getAttribute("vehicles");
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
                                <a class="nav-link" href="#">Khoản Thu</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Khoản Chi</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Lịch Sử</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="service">Nhà xe</a>
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
                <h1>Quản lý phương tiện</h1>
            </div>
            <div class="main_content">
                <div class="report">
                    <p><i class="fa fa-align-justify"></i> Tổng số phương tiện: ${requestScope.vehicles.size()}</p>
                    <p><i class="fa fa-motorcycle"></i> Xe máy: ${requestScope.motorbike}</p>
                    <p><i class="fa fa-bicycle"></i> Xe đạp: ${requestScope.bike}</p>
                    <p><i class="fa-solid fa-bolt"></i> Xe đạp điện: ${requestScope.electricbike}</p>
                </div>
                <div class="search">

                    <div class="search_box">
                        <div class="input">
                            <input type="text" id="nameSearch" name="name" onkeyup="find();"
                                   placeholder="Tìm theo tên chủ sở hữu..." required autocomplete="off">
                        </div>
                        <button class="search_button" type="button">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>

                </div>
                <button class="add" id="add" type="button" onclick="show();"><i class="fa fa-plus-circle"></i> Thêm phương
                    tiện</button>
                <form action="vehicle/add" method="POST" id="formAdd" style="display: none;">
                    <div class="add_heading"></div>
                    <div class="add_input">
                        <table id="addTable">
                            <tr>
                                <td>
                                    <label for="id">Chứng minh thư(CCCD): </label>
                                </td>
                                <td>
                                    <input type="text" name="id" id="id" placeholder="Chứng minh thư(CCCD)" autocomplete="off" required>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="ticketNo">Số vé</label></td>
                                <td>
                                    <input type="text" name="ticket" id="ticketNo" placeholder="Số vé" autocomplete="off" required>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="vtype">Loại xe</label></td>
                                <td>
                                    <select name="vtype" id="vtype">
                                        <option value="bike">Xe đạp</option>
                                        <option value="motorbike">Xe máy</option>
                                        <option value="electricbike">Xe điện</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="vnumber">Biến số(Không bắt buộc):</label></td>
                                <td><input type="text" name="vnumber" id="vnumber" placeholder="Biển số" autocomplete="off"></td>
                            </tr>
                        </table>
                        <button type="submit" onclick="return checkSubmit()">Xác nhận</button>
                    </div>
                </form>
                <c:if test="${requestScope.vehicles.size() > 0}">
                    <table class="vehicle_list">
                        <thead>
                            <tr>
                                <td>Số vé</td>
                                <td>Chủ sở hữu</td>
                                <td>Chứng minh thư(CCCD)</td>
                                <td>Loại xe</td>
                                <td>Biển số</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody id="vehicleList">
                            <% for (int i = 0; i < vehicles.size(); i++) {%>
                            <tr>
                                <td><%=(vehicles.get(i).getVid())%></td>
                                <td><%=(vehicles.get(i).getCustomer().getName())%></td>
                                <td><%=(vehicles.get(i).getCustomer().getId())%></td>
                                <td><%=(vehicles.get(i).getVtype())%></td>
                                <td><%=(vehicles.get(i).getVnumber() != null ? vehicles.get(i).getVnumber() : "-")%></td>
                                <td>
                                    <a href="#" class="update">Chỉnh sửa</a>
                                    <a href="#" class="delete" 
                                       onclick="confirmDelete('<%=(vehicles.get(i).getVid())%>')">Xóa</a>
                                </td>
                            </tr>        
                            <%}%>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${requestScope.vehicles.size() == 0}">
                    <p style="margin-top: 20px;">Không có phương tiện để hiển thị</p> 
                </c:if>
            </div>
        </div>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script>
                                           function show() {
                                               var formAdd = document.getElementById('formAdd');
                                               if (formAdd.style.display === "none") {
                                                   formAdd.style.display = "block";
                                               } else {
                                                   formAdd.style.display = "none";
                                               }
                                           }

                                           function find() {
                                               var nameToSearch = document.getElementById("nameSearch").value.trim();
                                               $.ajax({
                                                   url: "/Assignment/vehicle/search",
                                                   type: "get",
                                                   data: {
                                                       name: nameToSearch
                                                   },
                                                   success: function (data) {
                                                       var row = document.getElementById("vehicleList");
                                                       row.innerHTML = data;
                                                   },
                                                   error: function (xhr) {

                                                   }
                                               });
                                           }

                                           function confirmDelete(id) {
                                               var result = confirm('Chắc chắn xóa xe?');
                                               if (result) {
                                                   window.location.href = "vehicle/delete?id=" + id;
                                               }
                                           }

                                           function checkSubmit() {
                                               var id = document.getElementById("id").value.trim();
                                               var vnumber = document.getElementById("vnumber").value.trim();
                                               var ticketNo = document.getElementById("ticketNo").value.trim();
                                               var vtype = document.getElementById('vtype').value;
                                               var warning = "";
                                               var validated = true;
                                               if (!new RegExp('^([0-9]{9,12})$', 'g').test(id)) {
                                                   warning += "CCCD không hợp lệ(gồm 9 hoặc 12 số)\n";
                                                   validated = false;
                                               }
                                               if(!new RegExp('^([0-9A-Z-z ]+)$', 'g').test(vnumber)){
                                                   warning += "Số hiệu xe không hợp lệ\n";
                                                   validated = false;
                                               }
                                               if(!new RegExp('^([0-9]+)$', 'g').test(ticketNo)){
                                                   warning += "Số vé không hợp lệ\n";
                                                   validated = false;
                                               }
                                               if(!validated){
                                                   alert(warning);
                                                   return false;
                                               } else {
                                                   var result = confirm("Xác nhận tạo phương tiện: "+vtype);
                                                   if(result){
                                                       return true;
                                                   } else{
                                                       return false;
                                                   }
                                               }
                                           }
        </script>
    </body>
</html>
