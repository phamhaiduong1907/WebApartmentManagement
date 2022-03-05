<%-- 
    Document   : login
    Created on : Mar 5, 2022, 5:00:47 PM
    Author     : Hai Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <link href="css/global.css" rel="stylesheet" type="text/css"/>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <%
            String warning = (String)request.getAttribute("warning");
        %>
    </head>
    <body>
        <div class="login">
            <h2 class="login_heading">đăng nhập</h2>
            <form action="login" class="form_login" autocomplete="off" method="POST">
                <div class="form_group">
                    <input type="text" class="form_input" placeholder="Tên đăng nhập" name="username">
                </div>
                <div class="form_group">
                    <input type="password" class="form_input" placeholder="Mật khẩu" name="password">
                </div>
                <div class="form_group">
                    <button type="submit" class="form_submit">
                        <span class="submit_text">Đăng nhập</span><i class="fa fa-arrow-right submit_icon"></i>
                    </button>
                </div>
            </form>
            <%if(warning!=null){%>
            <p id="message">* Sai tên đăng nhập hoặc mật khẩu, vui lòng kiểm tra lại</p>
            <%}%>
        </div>
    </body>
</html>
