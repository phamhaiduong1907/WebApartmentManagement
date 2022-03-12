<%-- 
    Document   : room
    Created on : Mar 7, 2022, 9:51:50 PM
    Author     : Hai Duong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Phòng ${requestScope.roomByID.rid}</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <link href="css/global.css" rel="stylesheet" type="text/css"/>
        <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
        <link href="css/room.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <nav class="headerNav navbar navbar-expand-lg container">
                <div class="container-fluid">
                    <a class="navLogo navbar-brand text-center" href="index">
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
                                <a class="nav-link" aria-current="page" href="index">Trang Chủ </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="detail">Chi Tiết </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="revenue">Thu Chi </a>
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
            <div class="room_heading">
                <h2>thông tin phòng thuê</h2>
            </div>
            <div class="room_content">
                <div class="room_info">
                    <span class="labelling">
                        Phòng thuê và hợp đồng
                    </span>
                    <div class="info_heading heading">
                        <h4>phòng ${requestScope.roomByID.rid}</h4>
                        <i class="fa fa-caret-down" id="clickButton"></i>
                    </div>
                    <div class="info_content" id="infoContent" style="display: none;">
                        <form action="contract/modify" method="${requestScope.roomByID.contract.startdate == null?"GET":"POST"}" onsubmit="return check();">
                            <div class="info_input">
                                <div class="info_item">
                                    <p>Mã phòng</p>
                                    <input type="hidden" name="rid" value="${requestScope.roomByID.rid}"/>
                                    <input type="text" value="${requestScope.roomByID.rid}" readonly/>
                                </div>
                                <div class="info_item">
                                    <p>Loại phòng</p>
                                    <input type="text" value="${requestScope.roomByID.type}" readonly/>
                                </div>
                                <div class="info_item">
                                    <p>Giá phòng/tháng</p>
                                    <input type="text" id="price" value="${requestScope.roomByID.price}" readonly>
                                </div>
                            </div>
                            <div class="contract_input">
                                <div class="contract_heading">
                                    <h2>* thông tin hợp đồng</h2>
                                </div>
                                <div class="contract_detail">
                                    <div class="contract_item">
                                        <p>Ngày bắt đầu</p>
                                        <input type="date" id="startdate" name="startdate" value="${requestScope.roomByID.contract.startdate}">
                                    </div>
                                    <div class="contract_item">
                                        <p>Ngày kết thúc</p>
                                        <input type="date" id="enddate" name="enddate" value="${requestScope.roomByID.contract.enddate}">
                                    </div>
                                    <div class="contract_item">
                                        <p>Tiền cọc</p>
                                        <input type="text" id="deposit" value="${requestScope.roomByID.deposit}" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="modify">
                                <c:if test="${requestScope.roomByID.contract.startdate == null}">
                                    <input type="submit" value="Tạo hợp đồng">
                                </c:if>
                                <c:if test="${requestScope.roomByID.contract.startdate != null}">
                                    <input type="submit" value="Chỉnh sửa HĐ">
                                    <a href="#" onclick="deleteContract();">Xoá hợp đồng</a>
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="room_member">
                    <span class="labelling">
                        Thông tin người thuê
                    </span>
                    <div class="member_heading heading">
                        <h4>Chi tiết</h4>
                    </div>
                    <div class="member_content">
                        <c:if test="${requestScope.roomByID.contract.customers.size() > 0}">
                            <table>
                                <tr>
                                    <td>Họ tên</td>
                                    <td>Giới tính</td>
                                    <td>Ngày sinh</td>
                                    <td>CCCD</td>
                                    <td>Địa chỉ</td>
                                    <td>Số điện thoại</td>
                                    <td></td>
                                </tr>
                                <c:forEach items="${requestScope.roomByID.contract.customers}" var="c">
                                    <tr>
                                        <td>${c.name}</td>
                                        <td>${c.gender?"nam":"nữ"}</td>
                                        <td>${c.dob}</td>
                                        <td>${c.id}</td>
                                        <td>${c.address}</td>
                                        <td>${c.phone}</td>
                                        <td>
                                            <a href="#">Chỉnh sửa</a>
                                            <a href="#" class="member_delete">Xóa</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:if>
                        <c:if test="${requestScope.roomByID.contract.customers.size() == 0}">
                            Không có người thuê để hiển thị<br>
                        </c:if>
                        <c:if test="${requestScope.roomByID.contract.customers.size() < requestScope.roomByID.type && 
                                      requestScope.roomByID.contract.startdate != null}">
                              <a href="" class="member_add"><i class="fa fa-plus-circle"></i> Thêm mới người thuê</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>


        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script>
                            var info = document.getElementById('infoContent');
                            var click = document.getElementById('clickButton');
                            click.addEventListener("click", function () {
                                if (info.style.display === 'none') {
                                    info.style.display = "block";
                                } else {
                                    info.style.display = "none";
                                }
                            })
                            function check() {
                                var startdate = document.getElementById('startdate').value;
                                var enddate = document.getElementById('enddate').value;
                                if (startdate === "" || enddate === "") {
                                    alert('Kiểm tra thông tin trước khi chỉnh sửa!');
                                    return false;
                                } else {
                                    let start = new Date(startdate);
                                    let end = new Date(enddate);
                                    let current = new Date();
                                    if (start >= end || end <= current) {
                                        alert('Kiểm tra lại thời hạn hợp đồng');
                                        return false;
                                    } else {
                                        let daysnum = (end.getTime() - start.getTime()) / (1000 * 3600 * 24);
                                        if (daysnum < 90) {
                                            alert('Thời hạn hợp đồng tối thiểu 3 tháng(90 ngày)');
                                            return false;
                                        } else {
                                            var result = confirm('Tạo hợp đồng ' + start.getDate() + '/' + (start.getMonth() + 1) + '/' +
                                                    (start.getYear() + 1900) + ' - ' + end.getDate() + '/' + (end.getMonth() + 1) + '/' +
                                                    (end.getYear() + 1900) + '?');
                                            if (result)
                                                return true;
                                            else
                                                return false;
                                        }
                                    }
                                }
                            }
                            function deleteContract(){
                                var result = confirm('Xóa hợp đồng sẽ làm mất thông tin về khách thuê phòng\nXác nhận xóa?');
                                if(result){
                                    window.location.href = "contract/delete?rid=${requestScope.roomByID.rid}";
                                }
                            }
        </script>
    </body>
</html>
