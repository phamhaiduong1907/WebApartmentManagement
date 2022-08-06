<%-- 
    Document   : create
    Created on : Mar 7, 2022, 9:50:15 PM
    Author     : Hai Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tạo mới hợp đồng</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <link href="../css/global.css" rel="stylesheet" type="text/css"/>
        <link href="../css/create.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="container_head">
                <h1><i class="fa fa-pen-alt"></i> ĐIỀN THÔNG TIN TƯƠNG ỨNG VÀO BIỂU MẪU</h1>
            </div>
            <div class="container_content">
                <form action="insert" method="POST" id="myForm" onsubmit="return checkSubmit()">
                    <div class="input_field">
                        <div class="personal_info name">
                            <label for="name">Họ và tên: </label>
                            <input type="text" id="name" name="name" placeholder="Nguyễn Văn A ..." value="" required>
                        </div>
                        <div class="personal_info birthday">
                            <label for="birthday">Ngày tháng năm sinh: </label>
                            <input type="date" id="birthday" name="dob" value="" required>
                        </div>
                        <div class="gender">
                            <label for="gender">Giới tính: </label>
                            <select name="gender" id="gender">
                                <option value="male">Nam</option>
                                <option value="female">Nữ</option>
                            </select>
                        </div>
                        <div class="personal_info identification">
                            <label for="identification">Số chứng minh thư ( CCCD nếu có <span style="color: red;">*</span> ): </label>
                            <input type="text" name="id" id="identification" 
                                   placeholder="VD: 034202000167" value="" required>
                        </div>
                        <div class="personal_info phone">
                            <label for="phone">Số điện thoại: </label>
                            <input type="text" id="phone" 
                                   name="phone" placeholder="0123-456-789" value="" required>
                        </div>
                        <div class="personal_info address">
                            <label for="address">Địa chỉ thường trú ( Quê quán ) : </label>
                            <input type="text" id="address" placeholder="Số nhà, ngõ, đường ..." 
                                   name="address" value="" required>
                        </div>
                    </div>
                    <p style="text-transform: uppercase; padding: 20px 20px 0; font-weight: bold; font-size: 25px;"><i class="fa fa-info-circle"></i> Thông tin phòng thuê: </p>
                    <div class="default_field">
                        <input type="hidden" name="rid" value="${requestScope.roomByID.rid}">
                        <p><span>Mã phòng</span>: ${requestScope.roomByID.rid}</p>
                        <p><span>Loại phòng</span>: phòng ${requestScope.roomByID.type} người</p>
                        <p><span>Tiền phòng/tháng</span>: ${requestScope.roomByID.price} VNĐ</p>
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
                console.log(name);
                console.log(dob);
                console.log(id);
                console.log(phone);
                console.log(address);
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
