<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMDT.aspx.cs" Inherits="TMDT22_9_2025.TMDT_Lazada.TMDT" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /* Reset CSS */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}

body {
    background-color: #f5f5f5;
}

.container {
    width: 100%;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* Header */
header {
    background-color: #ff6600;
    color: white;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 60px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

header .logo img {
    height: 60px;
    width: auto;
}

nav ul {
    list-style: none;
    display: flex;
    gap: 30px;
}

nav ul li {
    display: inline-block;
}

nav ul li a {
    color: white;
    text-decoration: none;
    font-weight: bold;
    transition: 0.3s;
    font-size: 16px;
    cursor: pointer;
}

nav ul li a:hover {
    color: #222;
}

/* Banner */
.banner {
    background: url('Image/img2.png') no-repeat center center/cover;
    height: 250px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 32px;
    font-weight: bold;
}

/* Main Content */
.main {
    display: flex;
    flex: 1;
    margin: 20px 60px;
    gap: 20px;
}

/* Sidebar */
.sidebar {
    width: 25%;
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 6px rgba(0,0,0,0.1);
    min-height: 400px;
}

/* Content */
.content {
    width: 75%;
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 6px rgba(0,0,0,0.1);
    min-height: 400px;
}

/* Footer */
footer {
    background-color: #222;
    color: white;
    text-align: center;
    padding: 20px 0;
    font-size: 14px;
}

/* Responsive */
@media (max-width: 768px) {
    header {
        flex-direction: column;
        align-items: flex-start;
        padding: 10px 20px;
    }
    nav ul {
        flex-direction: column;
        width: 100%;
        gap: 10px;
    }
    .main {
        flex-direction: column;
        margin: 20px;
    }
    .sidebar, .content {
        width: 100%;
    }
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class ="container">
            <header>
                <asp:HyperLink class="logo" ID="HyperLink1" runat="server">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/TMDT_Lazada/Image/R-removebg-preview.png"/>
                </asp:HyperLink>
                <nav>
                    <ul>
                        <li>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl ="~/TMDT_Lazada/17_11_2025/Home.aspx">Home</asp:HyperLink>
                        </li>
                        <li>
                             <asp:HyperLink ID="HyperLink3" runat="server">Don Hang</asp:HyperLink>
                        </li>
                        <li>
                             <asp:HyperLink ID="HyperLink4" runat="server">Ma Hang</asp:HyperLink>
                        </li>
                         <li>
                             <asp:HyperLink ID="HyperLink5" runat="server">Loai Hang</asp:HyperLink>
                         </li>
                          <li>
                             <asp:HyperLink ID="HyperLink6" runat="server">Khach Hang</asp:HyperLink>
                         </li>
                    </ul>
                </nav>
            </header>
            <div class ="banner">
            </div>
            <div class ="main">
                <div class ="sidebar">

                </div>
                <div class = "content">

                </div>
            </div>
            <footer>
                ALOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
            </footer>
        </div>
    </form>
</body>
</html>
