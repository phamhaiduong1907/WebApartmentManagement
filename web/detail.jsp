<%-- 
    Document   : detail
    Created on : Mar 7, 2022, 9:43:27 PM
    Author     : Hai Duong
--%>

<%@page import="model.Room"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách phòng trọ</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <link href="css/global.css" rel="stylesheet" type="text/css"/>
        <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
        <link href="css/detail.css" rel="stylesheet" type="text/css"/>
        <%
            ArrayList<Room> rooms = (ArrayList<Room>) request.getAttribute("rooms");
            ArrayList<Room> roomByStatus = (ArrayList<Room>) request.getAttribute("roomByStatus");
        %>
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
                                <a class="nav-link log_out" href="logout">Thoát</a>
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
                    <form action="detail" method="POST" id="formSearch">
                        <div id="searchTool">
                            <span><i class="fa fa-arrow-alt-circle-right"></i> Chọn mã phòng:</span>
                            <select name="rid" id="rid" onchange="submitForm();">
                                <option value="-1">Tất cả</option>
                                <c:forEach items="${requestScope.rooms}" var="r">
                                    <option value="${r.rid}" ${requestScope.roomByID.rid == r.rid ?"selected":""}>
                                        Phòng ${r.rid}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div id="statusFilter">
                            <span><i class="fa fa-arrow-alt-circle-right"></i> Trạng thái phòng:</span>
                            <select name="status" id="status" onchange="submitForm();">
                                <option value="all">Tất cả</option>
                                <option value="true" ${requestScope.status.equals("true")?"selected":""}>Phòng đã thuê</option>
                                <option value="false" ${requestScope.status.equals("false")?"selected":""}>Phòng trống</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="room_add">
                    <a href="#"><i class="fa fa-plus-circle"></i> Thêm phòng trọ</a>
                </div>
                <div class="content_detail">
                    <c:if test="${(requestScope.rooms.size() > 0 || requestScope.rooms != null) && requestScope.roomByID == null && requestScope.roomByStatus == null}">
                        <table>
                            <tr>
                                <td>STT</td>
                                <td>Mã phòng</td>
                                <td>Loại phòng</td>
                                <td>Ngày thuê</td>
                                <td>Ngày trả</td>
                                <td>Trạng thái</td>
                                <td>Số người thuê</td>
                                <td></td>
                            </tr>
                            <%for (int i = 0; i < rooms.size(); i++) {%>
                            <tr>
                                <td><%=(i + 1)%></td>
                                <td><%=(rooms.get(i).getRid())%></td>
                                <td><%=(rooms.get(i).getType())%></td>
                                <%if (rooms.get(i).getContract().getStartdate() == null) {%>
                                <td>-</td>
                                <td>-</td>
                                <%} else {%>
                                <td><%=(rooms.get(i).getContract().getStartdate())%></td>
                                <td><%=(rooms.get(i).getContract().getEnddate())%></td>
                                <%}%>
                                <td><%=(rooms.get(i).getContract().getCustomers().size() > 0) ? "Phòng đang thuê" : "Phòng trống"%></td>
                                <td><%=(rooms.get(i).getContract().getCustomers().size())%></td>
                                <td>
                                    <a href="#" class="room_detail">Chi tiết</a>
                                    <a href="#" class="room_delete" onclick="">Xóa</a>
                                </td>
                            </tr>  
                            <%}%>
                        </table>
                    </c:if>
                    <c:if test="${requestScope.roomByID != null}">
                        <table>
                            <tr>
                                <td>STT</td>
                                <td>Mã phòng</td>
                                <td>Loại phòng</td>
                                <td>Ngày thuê</td>
                                <td>Ngày trả</td>
                                <td>Trạng thái</td>
                                <td>Số người thuê</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>${requestScope.roomByID.rid}</td>
                                <td>${requestScope.roomByID.type}</td>
                                <td>${requestScope.roomByID.contract.startdate}</td>
                                <td>${requestScope.roomByID.contract.enddate}</td>
                                <td>${requestScope.roomByID.contract.customers.size()>0?"Phòng đang thuê":"Phòng trống"}</td>
                                <td>${requestScope.roomByID.contract.customers.size()}</td>
                                <td>
                                    <a href="#" class="room_detail">Chi tiết</a>
                                    <a href="#" class="room_delete" onclick="">Xóa</a>
                                </td>
                            </tr>
                        </table>
                    </c:if>
                    <c:if test="${requestScope.roomByStatus != null}">
                        <table>
                            <tr>
                                <td>STT</td>
                                <td>Mã phòng</td>
                                <td>Loại phòng</td>
                                <td>Ngày thuê</td>
                                <td>Ngày trả</td>
                                <td>Trạng thái</td>
                                <td>Số người thuê</td>
                                <td></td>
                            </tr>
                            <%for (int i = 0; i < roomByStatus.size(); i++) {%>
                            <tr>
                                <td><%=(i + 1)%></td>
                                <td><%=(roomByStatus.get(i).getRid())%></td>
                                <td><%=(roomByStatus.get(i).getType())%></td>
                                <%if (roomByStatus.get(i).getContract().getStartdate() == null) {%>
                                <td>-</td>
                                <td>-</td>
                                <%} else {%>
                                <td><%=(roomByStatus.get(i).getContract().getStartdate())%></td>
                                <td><%=(roomByStatus.get(i).getContract().getEnddate())%></td>
                                <%}%>
                                <td><%=(roomByStatus.get(i).getContract().getCustomers().size() > 0) ? "Phòng đang thuê" : "Phòng trống"%></td>
                                <td><%=(roomByStatus.get(i).getContract().getCustomers().size())%></td>
                                <td>
                                    <a href="#" class="room_detail">Chi tiết</a>
                                    <a href="#" class="room_delete" onclick="">Xóa</a>
                                </td>
                            </tr>  
                            <%}%>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>


        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script>
                                function submitForm() {
                                    document.getElementById('formSearch').submit();
                                }
        </script>
    </body>
</html>
