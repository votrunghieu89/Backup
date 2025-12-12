<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormTest.aspx.cs" Inherits="OnTapTMDT.WebFormTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang Web Bán Hoa</title>
    <style>
        /* Thiết lập cơ bản */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Container chính (3 cột) */
        .main {
            display: flex; /* Kích hoạt Flexbox cho bố cục ngang */
            width: 900px; /* Chiều rộng cố định cho dễ căn chỉnh */
            margin: 20px auto; /* Căn giữa container trên trang */
            border: 1px solid black; 
        }

        /* 1. Cột Danh Mục (Sidebar) */
        .sidebar {
            width: 25%; /* Chiếm 1/4 chiều rộng */
            padding: 10px;
            border-right: 1px solid black;
        }
        .sidebar h3 {
            margin-top: 0;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar li {
            margin-bottom: 5px;
        }
        .sidebar a {
            text-decoration: underline;
            color: blue;
        }

        /* 2. Cột Nội Dung Chính (Content) */
        .content {
            width: 50%; /* Chiếm 1/2 chiều rộng */
            padding: 10px;
            border-right: 1px solid black;
        }

        /* 3. Cột Đăng Nhập (Login Form) */
        .login_form {
            width: 25%; /* Chiếm 1/4 chiều rộng */
            padding: 10px;
            text-align: left; /* Căn chỉnh nội dung trong cột */
        }
        
      
        .login_form input[type="text"], 
        .login_form input[type="password"] {
            width: 90%; /* Chiều rộng của ô nhập liệu */
            box-sizing: border-box; /* Tính cả padding và border vào chiều rộng */
            margin-top: 2px;
        }
        .button_container {
            display:flex;
            justify-content: center
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            
            <div class="sidebar">
                <h3>Danh mục Loại</h3>
                <ul>
                    <li><a href="#">Hoa Cưới</a></li>
                    <li><a href="#">Hoa sinh nhật</a></li>
                    <li><a href="#">Hoa sự kiện</a></li>
                    <li><a href="#">Hoa chia buồn</a></li>
                    <li><a href="#">Hoa khai trương</a></li>
                </ul>
            </div>
            
            <div class="content">
                Nơi bỏ thông tin
            </div>
            
            <div class="login_form">
                
                <div>Thông tin đăng nhập</div>
                
                <asp:Label ID="Label_TenDN" runat="server" Text="Tên đăng nhập:"></asp:Label>
                <asp:TextBox ID="Txt_TenDN" runat="server"></asp:TextBox>
                
                <asp:Label ID="Label_MatKhau" runat="server" Text="Mật khẩu:"></asp:Label>
                <asp:TextBox ID="Txt_MatKhau" runat="server" TextMode="Password"></asp:TextBox>
                
                <div style="margin-top: 5px; margin-bottom: 10px;">
                    <asp:CheckBox ID="Chk_GhiNho" runat="server" Text="Ghi nhớ mật khẩu" />
                </div>
                
                <div class="button_container">
                    <asp:Button ID="Btn_Login" runat="server" Text="Đăng nhập" OnClick="Btn_Login_Click" />
                </div>
            </div>
            
        </div>
    </form>
</body>
</html>