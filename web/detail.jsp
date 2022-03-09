<%-- 
    Document   : detail
    Created on : Mar 7, 2022, 9:43:27 PM
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
        <link href="css/detail.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <nav class="headerNav navbar navbar-expand-lg container">
                <div class="container-fluid">
                    <a class="navLogo navbar-brand text-center" href="../index.html">
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
                                <a class="nav-link log_out" href="#">Thoát</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div id="main">
            <div class="main_heading">
                <p>Chi tiết phòng thuê</p>
            </div>
            <div class="main_content">
                <div class="search_form">
                    <form action="">
                        <div class="filter_option" onchange="methodSelect();">
                            <span>Tìm kiếm theo:</span>
                            <select name="methodSelect" id="methodSelect">
                                <option value="all">Tất cả</option>
                                <option value="rid">Mã phòng</option>
                                <option value="status">Trạng thái</option>
                            </select>
                        </div>
                    </form>
                    <div class="filter">
                        <form action="" id="searchTool" onchange="submitForm('searchTool');">
                            <span><i class="fa fa-arrow-alt-circle-right"></i> Chọn mã phòng:</span>
                            <select name="rid" id="rid">
                                <option value="-1">Tất cả</option>
                                <option value="101">P101</option>
                                <option value="102">P102</option>
                                <option value="103">P103</option>
                            </select>
                        </form>
                        <form action="" id="statusFilter" onchange="submitForm('statusFilter');">
                            <span><i class="fa fa-arrow-alt-circle-right"></i> Trạng thái phòng:</span>
                            <select name="status" id="status">
                                <option value="all">Tất cả</option>
                                <option value="true">Phòng đầy</option>
                                <option value="false">Phòng trống</option>
                            </select>
                        </form>
                    </div>  
                </div>
                <div class="room_add">
                    <a href="#"><i class="fa fa-plus-circle"></i> Thêm phòng trọ</a>
                </div>
                <div class="content_detail">
                    <table>
                        <tr>
                            <td>STT</td>
                            <td>Mã phòng</td>
                            <td>Loại phòng</td>
                            <td>Ngày thuê</td>
                            <td>Ngày trả</td>
                            <td>Trạng thái</td>
                            <td>Người đứng tên</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>101</td>
                            <td>2</td>
                            <td>2020/09/11</td>
                            <td>2021/03/25</td>
                            <td>Phòng trống</td>
                            <td>Phạm Hải Dương</td>
                            <td>
                                <a href="#" class="room_detail">Chi tiết</a>
                                <a href="#" class="room_delete" onclick="">Xóa</a>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>101</td>
                            <td>2</td>
                            <td>2020/09/11</td>
                            <td>2021/03/25</td>
                            <td>Phòng trống</td>
                            <td>-</td>
                            <td>
                                <a href="#" class="room_detail">Chi tiết</a>
                                <a href="#" class="room_delete" onclick="">Xóa</a>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>101</td>
                            <td>2</td>
                            <td>2020/09/11</td>
                            <td>2021/03/25</td>
                            <td>Phòng trống</td>
                            <td>Phạm Hải Dương</td>
                            <td>
                                <a href="#" class="room_detail">Chi tiết</a>
                                <a href="#" class="room_delete" onclick="">Xóa</a>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>101</td>
                            <td>2</td>
                            <td>2020/09/11</td>
                            <td>2021/03/25</td>
                            <td>Phòng trống</td>
                            <td>Phạm Hải Dương</td>
                            <td>
                                <a href="#" class="room_detail">Chi tiết</a>
                                <a href="#" class="room_delete" onclick="">Xóa</a>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>101</td>
                            <td>2</td>
                            <td>2020/09/11</td>
                            <td>2021/03/25</td>
                            <td>Phòng trống</td>
                            <td>Phạm Hải Dương</td>
                            <td>
                                <a href="#" class="room_detail">Chi tiết</a>
                                <a href="#" class="room_delete" onclick="">Xóa</a>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>101</td>
                            <td>2</td>
                            <td>2020/09/11</td>
                            <td>2021/03/25</td>
                            <td>Phòng trống</td>
                            <td>Phạm Hải Dương</td>
                            <td>
                                <a href="#" class="room_detail">Chi tiết</a>
                                <a href="#" class="room_delete" onclick="">Xóa</a>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>101</td>
                            <td>2</td>
                            <td>2020/09/11</td>
                            <td>2021/03/25</td>
                            <td>Phòng trống</td>
                            <td>Phạm Hải Dương</td>
                            <td>
                                <a href="#" class="room_detail">Chi tiết</a>
                                <a href="#" class="room_delete" onclick="">Xóa</a>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>101</td>
                            <td>2</td>
                            <td>2020/09/11</td>
                            <td>2021/03/25</td>
                            <td>Phòng trống</td>
                            <td>Phạm Hải Dương</td>
                            <td>
                                <a href="#" class="room_detail">Chi tiết</a>
                                <a href="#" class="room_delete" onclick="">Xóa</a>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>101</td>
                            <td>2</td>
                            <td>2020/09/11</td>
                            <td>2021/03/25</td>
                            <td>Phòng trống</td>
                            <td>Phạm Hải Dương</td>
                            <td>
                                <a href="#" class="room_detail">Chi tiết</a>
                                <a href="#" class="room_delete" onclick="">Xóa</a>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>101</td>
                            <td>2</td>
                            <td>2020/09/11</td>
                            <td>2021/03/25</td>
                            <td>Phòng trống</td>
                            <td>Phạm Hải Dương</td>
                            <td>
                                <a href="#" class="room_detail">Chi tiết</a>
                                <a href="#" class="room_delete" onclick="">Xóa</a>
                            </td>
                        </tr>

                    </table>
                </div>
            </div>
        </div>


        <script src="../js/jquery-3.6.0.min.js"></script>
        <script src="../js/bootstrap.bundle.min.js"></script>
        <script>
            function submitForm(id) {
                var form = document.getElementById(id);
                form.submit();
            }

            function methodSelect(){
                var method = document.getElementById('methodSelect');
                var searchById = document.getElementById('searchTool');
                var searchByStatus = document.getElementById('statusFilter');
                if(method.value == 'all'){
                    searchById.style.display='none';
                    searchByStatus.style.display = 'none';
                }else if(method.value == 'rid'){
                    searchById.style.display='block';
                    searchByStatus.style.display = 'none';
                }else{
                    searchById.style.display='none';
                    searchByStatus.style.display = 'block';
                }
            }
        </script>
    </body>
</html>
