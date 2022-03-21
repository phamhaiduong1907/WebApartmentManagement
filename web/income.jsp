<%-- 
    Document   : revenue
    Created on : Mar 7, 2022, 9:43:50 PM
    Author     : Hai Duong
--%>

<%@page import="model.Room"%>
<%@page import="model.Service"%>
<%@page import="model.Rent"%>
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
        <link href="css/revenue.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/income.css"/>
        <%
            ArrayList<Rent> rents = (ArrayList<Rent>) request.getAttribute("rents");
            ArrayList<Service> services = (ArrayList<Service>) request.getAttribute("services");
            ArrayList<Room> rooms = (ArrayList<Room>) request.getAttribute("rooms");
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

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false"
                            aria-label="Toggle navigation">
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
                                <a class="nav-link active" href="income">Khoản Thu</a>
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
        <div id="main">
            <ul class="main_heading" id="mainNav">
                <li class="button button_active" id="rentNav" onclick="showTab('rent', 'rentNav')">Tiền nhà</li>
                <li class="button" id="serviceNav" onclick="showTab('service', 'serviceNav')">Dịch vụ</li>
            </ul>





            <div class="tab" id="rent">
                <button class="create" onclick="show('formCreate', 'block');">Tạo hạn thu tiền</button>
                <button class="add" onclick="show('formAddRent', 'block')">Tạo một</button>



                <form action="rent/many" method="GET" id="formCreate" style="display: none;">
                    <div class="create_field">
                        <div class="create_wrapper">
                            <div class="create_input">
                                <label for="rentName">Tên khoản thu:</label>
                                <input type="text" id="rentName" name="rentName" required>
                            </div>
                            <button type="submit" class="create">Tạo hạn thu</button>
                        </div>
                    </div>
                </form>



                <form action="rent/one" method="GET" id="formAddRent" style="display: none;">
                    <div class="create_field">
                        <div class="create_wrapper">
                            <div class="create_input">
                                <label for="rentRoomAdd">Chọn phòng:</label>
                                <select name="room" id="rentRoomAdd">
                                    <c:forEach items="${requestScope.rooms}" var="r">
                                        <option value="${r.rid}">phòng ${r.rid}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="create_input">
                                <label for="rentAdd">Tên khoản thu:</label>
                                <input type="text" id="rentAdd" name="rentName" required>
                            </div>
                        </div>
                        <button type="submit" class="add">Tạo khoản thu</button>
                    </div>
                </form>
                <c:if test="${requestScope.rents.size() > 0}">
                    <table id="rentTable">
                        <thead>
                            <tr>
                                <td>STT</td>
                                <td>Tên phòng</td>
                                <td>Tên khoản thu</td>
                                <td>Số tiền</td>
                                <td>Ghi chú</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (int i = 0; i < rents.size(); i++) {%>
                            <tr>
                                <td><%=(i + 1)%></td>
                                <td><%=(rents.get(i).getRoom().getRid())%></td>
                                <td><%=(rents.get(i).getName())%></td>
                                <td><%=(rents.get(i).getAmount())%></td>
                                <td>
                                    <form action="#" method="POST">
                                        <input type="hidden" name="id" value="<%=(rents.get(i).getId())%>"/>
                                        <input type="text" name="note" 
                                               value="<%=((rents.get(i).getNote() == null) ? "" : rents.get(i).getNote())%>"/>
                                        <input type="submit" value="Lưu"/>
                                    </form>
                                </td>
                                <td style="display: flex; align-items: center;">
                                    <form action="rent/confirm" method="GET">
                                        <input type="hidden" name="id" value="<%=(rents.get(i).getId())%>"/>
                                        <input type="hidden" name="rid" value="<%=(rents.get(i).getRoom().getRid())%>"/>
                                        <input type="hidden" name="name" value="<%=(rents.get(i).getName())%>"/>
                                        <input type="hidden" name="amount" value="<%=(rents.get(i).getAmount())%>"/>
                                        <button type="submit" class="confirm">
                                            <i class="fa-solid fa-circle-check"></i>
                                            Xác nhận thu tiền
                                        </button>
                                    </form>
                                    <a href="rent/delete?id=<%=(rents.get(i).getId())%>" 
                                       class="delete" style="padding: 10px;">
                                        <i class="fa-solid fa-trash-can"></i> Xóa</a>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${requestScope.rents.size() == 0}">
                    <p>Không có khoản thu để hiển thị</p>
                </c:if>
            </div>








            <div class="tab" style="display: none;" id="service">
                <button class="create" onclick="show('serviceForm', 'block')">Tạo hạn thu tiền</button>
                <button class="add" onclick="show('formAddService', 'block')">Tạo một</button>







                <form action="service/add" method="GET" id="serviceForm" style="display: none;">
                    <div class="serviceForm_input">
                        <div class="default_field">
                            <div class="default_item">
                                <label for="serviceName">Tên khoản thu:</label>
                                <input type="text" name="serviceName" id="serviceName" required autocomplete="off">
                            </div>
                            <div class="default_item">
                                <label for="servicePrice">Giá dịch vụ:</label>
                                <input type="text" name="servicePrice" id="servicePrice" required autocomplete="off">
                            </div>
                            <div class="default_item">
                                <label for="servicePrice">Đơn giá điện:</label>
                                <input type="text" name="unitElectricity" id="unitElectricity" required autocomplete="off">
                            </div>
                        </div>
                        <div class="input_field">
                            <table class="serviceInput">
                                <thead>
                                    <tr>
                                        <td>STT</td>
                                        <td>Tên phòng</td>
                                        <td>Số điện tiêu thụ</td>
                                        <td>Thành tiền</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (int i = 0; i < rooms.size(); i++) {%>
                                    <tr>
                                        <td><%=(i + 1)%></td>
                                        <td><%=(rooms.get(i).getRid())%></td>
                                        <td>
                                            <input type="hidden" name="rid" value="<%=(rooms.get(i).getRid())%>"/>
                                            <input type="text" name="consumedElec" class="elecNo" required autocomplete="off">
                                        </td>
                                        <td>
                                            <input type="text" name="toCass" class="toCass" readonly>
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                                <tr id="calculate">
                                    <td colspan="3">Tổng cộng:</td>
                                    <td id="calculateTotal">
                                        <span id="total">0</span> VNĐ
                                    </td>
                                </tr>
                            </table>
                            <div class="button_group">
                                <button class="confirm" type="reset">Tạo lại</button>
                                <button class="confirm" type="button" onclick="check();">Tính Tiền</button>
                                <button class="confirm" type="submit" onclick="checkSubmit()">Xác Nhận</button>
                            </div>
                        </div>
                    </div>
                </form>







                <form action="service/add" method="POST" id="formAddService" style="display: none;">
                    <div class="serviceForm_input">
                        <div class="default_field">
                            <div class="default_item">
                                <label for="serviceName">Tên khoản thu:</label>
                                <input type="text" name="serviceName" id="addName" required autocomplete="off">
                            </div>
                            <div class="default_item">
                                <label for="servicePrice">Giá dịch vụ:</label>
                                <input type="text" name="servicePrice" id="addPrice" 
                                       required autocomplete="off" pattern="[1-9][0-9{3,}">
                            </div>
                            <div class="default_item">
                                <label for="servicePrice">Đơn giá điện:</label>
                                <input type="text" name="unitElectricity" id="addUnit" 
                                       required autocomplete="off" pattern="[1-9][0-9]{3,}">
                            </div>
                        </div>
                        <div class="input_field">
                            <table class="serviceInput">
                                <thead>
                                    <tr>
                                        <td>Tên phòng</td>
                                        <td>Số điện tiêu thụ</td>
                                        <td>Thành tiền</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <select name="rid">
                                                <c:forEach items="${requestScope.rooms}" var="r">
                                                    <option value="${r.rid}">phòng ${r.rid}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="text" id="addConsumed" name="elecno" class="elecAddNo" required
                                                   autocomplete="off" pattern="[0-9]+">
                                        </td>
                                        <td>
                                            <input type="text" id="addCash" name="cash" class="toAddCass" readonly>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="button_group">
                                <button class="confirm" type="reset">Tạo lại</button>
                                <button class="confirm" type="button" onclick="toCash();">Tính Tiền</button>
                                <button class="confirm" type="submit">Xác Nhận</button>
                            </div>
                        </div>
                    </div>
                </form>




                <div class="service_content" id="serviceContent">
                    <c:if test="${requestScope.services.size() > 0}">
                        <table id="serviceTable">
                            <thead>
                                <tr>
                                    <td>STT</td>
                                    <td>Tên phòng</td>
                                    <td>Tên khoản thu</td>
                                    <td>Tiền dịch vụ</td>
                                    <td>Tiền điện</td>
                                    <td>Thành tiền</td>
                                    <td>Xác nhận</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (int i = 0; i < services.size(); i++) {%>
                                <tr>
                                    <td><%=(i + 1)%></td>
                                    <td><%=(services.get(i).getRoom().getRid())%></td>
                                    <td><%=(services.get(i).getName())%></td>
                                    <td><%=(services.get(i).getServiceprice())%></td>
                                    <td><%=(services.get(i).getElecno() * services.get(i).getElecunit())%></td>
                                    <td><%=(services.get(i).getAmount())%></td>
                                    <td>
                                        <a href="service/confirm?rid=<%=(services.get(i).getRoom().getRid())%>&name=<%=(services.get(i).getName())%>&amount=<%=(services.get(i).getAmount())%>&id=<%=(services.get(i).getId())%>" 
                                        class="confirm" style="display: inline-block; padding: 5px; font-size: 15px"> 
                                            <i class="fa-solid fa-circle-check"></i>
                                            Xác nhận thu tiền
                                        </a>
                                        <a href="service/delete?id=<%=(services.get(i).getId())%>" 
                                           class="delete" style="display: inline-block; padding: 5px;
                                           font-size: 15px"><i class="fa-solid fa-trash-can"></i> Xóa</a>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${requestScope.services.size() == 0}">
                        <p>Không có khoản thu nào để hiển thị</p>
                    </c:if>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script>
                                    function check() {
                                        var regex = /^[1-9]{1}[0-9]+$/;
                                        var unitElectricity = document.getElementById('unitElectricity').value;
                                        if (!regex.test(unitElectricity) || parseInt(unitElectricity.trim(), 10) < 1000) {
                                            alert('Kiểm tra lại đơn giá!(Nhập vào số lớn hơn 1000)');
                                            return false;
                                        }
                                        var consumedElec = document.getElementsByClassName("elecNo");
                                        var toCass = document.getElementsByClassName("toCass");
                                        var total = 0;
                                        for (let i = 0; i < consumedElec.length; i++) {
                                            console.log(consumedElec[i].value);
                                            console.log(regex.test(consumedElec[i].value));
                                            if (!regex.test(consumedElec[i].value)) {
                                                alert('Số điện nhập vào phải là số không bắt đầu bằng 0. VD: Hãy nhập 1 , 10, 100, ...');
                                                return false;
                                            }
                                        }
                                        for (var i = 0; i < consumedElec.length; i++) {
                                            var price = parseInt(consumedElec[i].value, 10) * parseInt(unitElectricity, 10);
                                            var value = price.toString();
                                            toCass[i].value = value;
                                            total += price;
                                        }
                                        document.getElementById('total').innerHTML = total;
                                    }


                                    function checkSubmit() {
                                        var regex = /^[1-9]{1}[0-9]{3,}$/;
                                        var validated = true;
                                        var toCass = document.getElementsByClassName("toCass");
                                        var servicePrice = document.getElementById('servicePrice').value;
                                        var warning = "";
                                        for (let i = 0; i < toCass.length; i++) {
                                            if (toCass[i].value.length === 0 || toCass[i].value === null) {
                                                alert('Tính tiền trước khi xác nhận');
                                                return false;
                                            }
                                        }
                                        if (!regex.test(servicePrice)) {
                                            warning += "Kiểm tra giá dịch vụ"
                                            validated = false;
                                        }
                                        if (!validated) {
                                            alert(warning);
                                            return false;
                                        } else {
                                            return true;
                                        }
                                    }

                                    function showTab(tabId, navId) {
                                        var current = document.querySelector("#mainNav .button_active");
                                        current.className = current.className.replace("button_active", "");
                                        document.getElementById(navId).className += " button_active";
                                        var tabs = document.getElementsByClassName("tab");
                                        for (var i = 0; i < tabs.length; i++) {
                                            tabs[i].style.display = "none";
                                        }
                                        document.getElementById(tabId).style.display = "block";
                                    }

                                    function show(id, displayForm) {
                                        var formCreate = document.getElementById(id);
                                        if (formCreate.style.display === "none") {
                                            formCreate.style.display = displayForm;
                                        } else {
                                            formCreate.style.display = "none";
                                        }
                                    }

                                    function checkModify() {
                                        var regex = /^[1-9]{1}[0-9]{3,}$/;
                                        var unitElecModify = document.getElementById('unitElecModify').value;
                                        var servicePriceModify = document.getElementById('servicePriceModify').value;
                                        if (!regex.test(unitElecModify) || !regex.test(servicePriceModify)) {
                                            alert('Nhập vào số lớn hơn 1000!');
                                            console.log(unitElecModify);
                                            console.log(servicePriceModify);
                                            return false;
                                        }
                                    }

                                    function toCash() {
                                        var consume = document.getElementById('addConsumed').value.trim();
                                        var cash = document.getElementById('addCash');
                                        var addUnit = parseInt(document.getElementById('addUnit').value.trim(), 10);
                                        cash.value = parseInt(consume, 10) * addUnit;
                                    }


        </script>
    </body>
</html>
