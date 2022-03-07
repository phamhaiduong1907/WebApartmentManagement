<%-- 
    Document   : room
    Created on : Mar 7, 2022, 9:51:50 PM
    Author     : Hai Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="css/room.css" rel="stylesheet" type="text/css"/>
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
                            <a class="nav-link" aria-current="page" href="index.html">Trang Chủ </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="detail.html">Chi Tiết </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="revenue.html">Thu Chi </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="service.html">Nhà xe</a>
                        </li>
                        <li class="nav-item user">
                            <i class="fa fa-user-circle"></i>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link log_out" href="#">Thoát</a>
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
                    <h4>phòng 101</h4>
                    <i class="fa fa-caret-down" id="clickButton"></i>
                </div>
                <div class="info_content" id="infoContent" style="display: none;">
                    <div class="info_input">
                        <div class="info_item">
                            <p>Mã phòng</p>
                            <input type="text" name="" id="" value="101">
                        </div>
                        <div class="info_item">
                            <p>Loại phòng</p>
                            <input type="text" name="" id="" value="2">
                        </div>
                        <div class="info_item">
                            <p>Giá phòng/tháng</p>
                            <input type="text" name="" id="" value="1.800.000">
                        </div>
                        <div class="info_item">
                            <p>Người đứng tên</p>
                            <select name="room_main_owner" id="">
                                <option value="Phạm Hải Dương">Phạm Hải Dương</option>
                                <option value="Nguyễn Văn A">Nguyễn Văn A</option>
                            </select>
                        </div>
                    </div>
                    <div class="contract_input">
                        <div class="contract_heading">
                            <h2>* thông tin hợp đồng</h2>
                        </div>
                        <div class="contract_detail">
                            <div class="contract_item">
                                <p>Ngày bắt đầu</p>
                                <input type="date" name="" id="" value="2020-09-11">
                            </div>
                            <div class="contract_item">
                                <p>Ngày kết thúc</p>
                                <input type="date" name="" id="" value="2021-06-11">
                            </div>
                            <div class="contract_item">
                                <p>Tiền cọc</p>
                                <input type="text" name="" id="" value="2.000.000">
                            </div>
                        </div>
                    </div>
                    <div class="modify">
                        <input type="submit" value="Chỉnh sửa">
                    </div>
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
                        <tr>
                            <td>Phạm Hải Dương</td>
                            <td>Nam</td>
                            <td>2002-07-19</td>
                            <td>034202000167</td>
                            <td>Thành phố Thái Bình, tỉnh Thái Bình</td>
                            <td>0967647308</td>
                            <td>
                                <a href="#">Chỉnh sửa</a>
                                <a href="#" class="member_delete">Xóa</a>
                            </td>
                        </tr>
                        <tr>
                            <td>Nguyễn Văn A</td>
                            <td>Nam</td>
                            <td>2002-09-25</td>
                            <td>034202005461</td>
                            <td>quận Đống Đa, Hà Nội</td>
                            <td>0967647308</td>
                            <td>
                                <a href="#">Chỉnh sửa</a>
                                <a href="#" class="member_delete">Xóa</a>
                            </td>
                        </tr>
                    </table>
                    <a href="" class="member_add"><i class="fa fa-plus-circle"></i> Thêm mới người thuê</a>
                </div>
            </div>
        </div>
    </div>
        
        
    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
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
    </script>
    </body>
</html>
