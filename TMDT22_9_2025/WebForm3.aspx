<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="TMDT22_9_2025.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <div>
                <asp:Label ID="Label2" runat="server" Text="Toan tu 1"></asp:Label>
                <asp:TextBox ID="txt1" runat="server"></asp:TextBox>
           </div>
            <div>
                <asp:Label ID="Label3" runat="server" Text="Toan tu 2"></asp:Label>
                <asp:TextBox ID="txt2" runat="server"></asp:TextBox>
            </div>
           <div>
                <asp:Label ID="Label4" runat="server" Text="Ket qua"></asp:Label>
                <asp:TextBox ID="txtResult" runat="server"></asp:TextBox>
           </div> 
           
             <asp:Label ID="Label1" runat="server" Text="Phep tinh"></asp:Label>
            <asp:Button ID="btnEqual" runat="server" Text="Button" />
           
        </div>
    </form>
</body>
</html>
