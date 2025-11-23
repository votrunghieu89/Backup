<%@ Page Title="" Language="C#" MasterPageFile="~/TMDT_Lazada/17_11_2025/Site1.Master" AutoEventWireup="true" CodeBehind="ListProductById.aspx.cs" Inherits="TMDT22_9_2025.TMDT_Lazada._17_11_2025.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
     .product_card{
         border: 1px solid #ccc;
         padding: 10px;
         text-align: center;
         margin-bottom: 15px;
         margin-right: 20px;
         border-radius: 5px;
         box-shadow: 0 2px 6px rgba(0,0,0,0.1);
         transition: transform 0.2s, box-shadow 0.2s;
 }

 .product_card:hover {
     transform: translateY(-5px);
     box-shadow: 0 5px 15px rgba(0,0,0,0.2);
 }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="dlProduct" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" CellPadding="10">
        <ItemTemplate>
            <div class="product_card" style="border:1px solid #ccc; padding:10px; text-align:center; margin-bottom:10px;">
                <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# "~/TMDT_Lazada/Image/" + Eval("HinhAnh") %>' Width="150px" Height="150px" />
                <h4><%# Eval("TenHangHoa") %></h4>
                <p>Giá: <%# Eval("Gia", "{0:N0}") %> VNĐ</p>
                <p>Số lượng: <%# Eval("SoLuongTon") %></p>
                <asp:HyperLink ID="lnkDetail" runat="server" NavigateUrl='<%# Eval("maHangHoa", "ProductDetail.aspx?id={0}") %>' Text="Xem chi tiết"></asp:HyperLink>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

