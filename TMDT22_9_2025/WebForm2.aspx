<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="TMDT22_9_2025.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
     .div1 {
        height: 550px;
        display: flex;
        flex-direction: column;   
        justify-content: center; 
        align-items: center;     
        gap: 15px;               
        }

        #lbl1 {
            font-size: 25px;
            color: blue;
        }

        .btn-group {
            display: flex;
            gap: 10px;   
        }
        .rectangula{
            width:200px;
            height:200px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: yellow;
        }
        .color{
             flex-direction: column;   
            gap: 10px;
            margin-top: 50px;
        }

        
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <div class="div1">
        <asp:Label ID="lbl1" runat="server" Text="Label"></asp:Label>
        <div class="btn-group">
        <asp:Button ID="btn1" runat="server" Text="Home" OnClick="btn1_Click" />
        <asp:Button ID="btn2" runat="server" Text="Previous" OnClick="btn2_Click" />
        <asp:Button ID="btn3" runat="server" Text="Next" OnClick="btn3_Click1" style="height: 29px" />
        
    </div>
              <div>
     <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
     <br />
     <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
 </div>
    <div class ="color">
     <label>Chọn màu</label>
     <asp:Button ID="Button2" runat="server" Text="Màu xanh" OnClick="Button2_Click" />
     <asp:Button ID="Button3" runat="server" Text="Màu đỏ " OnClick="Button3_Click" style="height: 29px" />
     <asp:Button ID="Button4" runat="server" Text="Màu tím" OnClick="Button4_Click" style="height: 29px" />
     </div>
     <div id="rectangula" runat="server" class="rectangula"></div>
 
</div>
    </form>
    
</body>
</html>
