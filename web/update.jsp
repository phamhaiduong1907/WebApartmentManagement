<%-- 
    Document   : update
    Created on : Mar 13, 2022, 2:52:10 PM
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
        <title>Tạo mới hợp đồng</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <link rel="stylesheet" href="../css/global.css">
        <link rel="stylesheet" href="../css/create.css">
    </head>
    <body>
        <div class="container">
            <div class="container_head">
                <h1><i class="fa fa-pen-alt"></i> Thông Tin Người Thuê</h1>
            </div>
            <div class="container_content">
                <form action="update" method="POST" onsubmit="return checkSubmit()">
                    <div class="input_field">
                        <div class="personal_info name">
                            <label for="name">Họ và tên: </label>
                            <input type="text" id="name" name="name" value="${requestScope.customer.name}" 
                                   placeholder="Nguyễn Văn A ...">
                        </div>
                        <div class="personal_info birthday">
                            <label for="birthday">Ngày tháng năm sinh: </label>
                            <input type="date" id="birthday" name="dob" value="${requestScope.customer.dob}">
                        </div>
                        <div class="gender">
                            <label for="gender">Giới tính: </label>
                            <select name="gender" id="gender">
                                <option value="male" ${requestScope.customer.gender?"selected":""}>Nam</option>
                                <option value="female" ${requestScope.customer.gender?"":"selected"}>Nữ</option>
                            </select>
                        </div>
                        <div class="personal_info identification">
                            <label for="identification">Số chứng minh thư ( CCCD nếu có <span style="color: red;">*</span>
                                ): </label>
                            <input type="hidden" name="default_id" value="${requestScope.customer.id}"/>
                            <input type="text" name="id" id="identification" value="${requestScope.customer.id}"
                                   placeholder="VD: 034202000167">
                        </div>
                        <div class="personal_info phone">
                            <label for="phone">Số điện thoại: </label>
                            <input type="text" id="phone" value="${requestScope.customer.phone}" 
                                   name="phone" placeholder="0123-456-789">
                        </div>
                        <div class="personal_info address">
                            <label for="address">Địa chỉ thường trú ( Quê quán ) : </label>
                            <input type="text" id="address" placeholder="Số nhà, ngõ, đường ..." name="address"
                                   value="${requestScope.customer.address}">
                        </div>
                    </div>
                    <div class="room">
                        <p><i class="fa fa-info-circle"></i> phòng đang thuê: </p>
                        <select name="rid" id="roomSelect">
                            <option value="${requestScope.roomByID.rid}">Phòng ${requestScope.roomByID.rid}</option>
                            <c:forEach items="${requestScope.roomsWithContract}" var="r">
                                <option value="${r.rid}">Phòng ${r.rid}</option>
                            </c:forEach>
                        </select>
                        <p id="notice">(*)Tạo hợp đồng ở phòng mới trước khi thay đổi phòng thuê</p>
                    </div>
                    <button type="submit" id="send">xác nhận</button>
                </form>
            </div>
        </div>
        <script>
            function checkSubmit() {
                var validated = true;
                var name = document.getElementById("name").value;
                var dob = document.getElementById("birthday").value;
                var id = document.getElementById("identification").value;
                var phone = document.getElementById("phone").value;
                var address = document.getElementById("address").value; 
                var warning = "";
                var regexp = /^((?![0-9\~\!\@\#\$\%\^\&\*\(\)\_\+\=\-\[\]\{\}\;\:\"\\\/\<\>\?]).)+$/;
                if (!regexp.test(name)) {
                    warning += "Tên không hợp lệ\n";
                    validated = false;
                }
                if (!new RegExp('^([0-9]{9,12})$', 'g').test(id)) {
                    warning += "CCCD không hợp lệ(gồm 9 hoặc 12 số)\n";
                    validated = false;
                }
                if (!new RegExp('^([0][0-9]{9,10})$', 'g').test(phone)) {
                    warning += "Số điện thoại không hợp lệ(bắt đầu bằng 0 và dài 10 / 11 số)\n";
                    validated = false;
                }
                if (name === "" || dob === "" || id === "" || phone === "" || address === "") {
                    warning = "Điền đầy đủ thông tin trước khi xác nhận!";
                    validated = false;
                }
                
                if (validated) {
                    return true;
                } else {
                    alert(warning);
                    return false;
                }
            }
        </script>
    </body>
</html>
