<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebsiteXayDung.aspx.cs" Inherits="VoTrungHieu_0216.WebsiteXayDung" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f5f5f5;
        }

        /* --- HEADER --- */
        header {
            width: 100%;
            background: white;
            border-bottom: 2px solid #ddd;
        }

        .banner img {
            width: 100%;
            height: 220px;
            object-fit: cover;
        }

        /* --- NAV MENU --- */
        nav {
            background: #003366;
        }

        nav ul {
            display: flex;
            list-style: none;
        }

        nav ul li {
            padding: 15px 20px;
        }

        nav ul li a {
            color: white;
            font-weight: bold;
            text-decoration: none;
        }

        nav ul li:hover {
            background: #0055a5;
        }

        /* --- MAIN LAYOUT --- */
        .main {
            display: flex;
            padding: 20px;
            gap: 20px;
        }

        /* --- SIDEBAR --- */
        .sidebar {
            width: 22%;
            background: white;
            padding: 15px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .sidebar a {
            display: block;
            padding: 10px;
            margin-bottom: 8px;
            background: #eaeaea;
            border-radius: 4px;
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        .sidebar a:hover {
            background: #d5d5d5;
        }

        /* --- CONTENT --- */
        .content {
            flex: 1;
            background: white;
            padding: 20px;
            min-height: 200px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        /* --- FOOTER --- */
        footer {
            margin-top: 30px;
            background: #003366;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 16px;
        }
        .center-btn {
            text-align: center;
            margin-top: 20px;
        }
        .btnThongKe {
            padding: 10px 25px;
            background: #0078ff;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
        }
        .btnThongKe:hover {
            background: #005fcc;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <header>
               <div class="banner">
                   <asp:Image ID="Image2" runat="server" ImageUrl="~\Images\banner.jpg"/>
               </div>
                <nav>
                    <ul>
                        <li><asp:HyperLink ID="HyperLink1" runat="server">TRANG CHỦ</asp:HyperLink></li>
                        <li><asp:HyperLink ID="HyperLink2" runat="server">GIỚI THIỆU</asp:HyperLink></li>
                        <li><asp:HyperLink ID="HyperLink3" runat="server">VẬT TƯ</asp:HyperLink></li>
                        <li><asp:HyperLink ID="HyperLink4" runat="server">KHUYẾN MÃI</asp:HyperLink></li>
                        <li><asp:HyperLink ID="HyperLink5" runat="server">TIN TỨC </asp:HyperLink></li>
                        <li><asp:HyperLink ID="HyperLink6" runat="server">LIÊN HỆ</asp:HyperLink></li>
                    </ul>
                </nav>
        </header>
        <div class ="main">
              <div class="sidebar">
                  <asp:DataList ID="DataList1" runat="server">
                      <ItemTemplate>
                       <asp:HyperLink ID="HPNhaCC" 
                                       runat="server" 
                                       Text='<%# Eval("TenNCC") %>'>
                        </asp:HyperLink>
                      </ItemTemplate>
                  </asp:DataList>
              </div>
              <div class ="content">
                    <table style="width: 100%; border-collapse: collapse; margin-bottom: 20px;">
                        <tr>
                            <td style="padding: 12px; border: 1px solid #ddd; width: 50%; font-weight: bold;">
                                Tổng số Vật Tư
                            </td>
                            <td style="padding: 12px; border: 1px solid #ddd;">
                                <asp:Label ID="lblTongSoVatTu" runat="server" Text="0"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td style="padding: 12px; border: 1px solid #ddd; font-weight: bold;">
                                Tổng số lượng Vật Tư
                            </td>
                            <td style="padding: 12px; border: 1px solid #ddd;">
                                <asp:Label ID="lblTongSoLuong" runat="server" Text="0"></asp:Label>
                            </td>
                        </tr>
                    </table>

                      <div class="center-btn">
                            <asp:Button ID="btnThongKe" runat="server" CssClass="btnThongKe" Text="Thống kê" OnClick="btnThongKe_Click"/>
                      </div>
              </div>
          </div>
        <footer>
            Võ Trung Hiếu - 28219050216
        </footer>
        </div>
    </form>
</body>
</html>
