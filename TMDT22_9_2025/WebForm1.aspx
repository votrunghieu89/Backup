<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TMDT22_9_2025.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #btn1{
           background-color: darkblue;
           color:white;
        }
        .lb{
            color: aqua;
            font-size: 25px;
             
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="txt1" runat="server"></asp:TextBox>
        <asp:Button ID="btn1" runat="server" Text="Nhap vao day" OnClick="btn1_Click" />
        <br />
        <asp:Label CssClass="lb" ID="lb1" runat="server" Text="Day la label"></asp:Label>
    </form>
</body>
</html>
