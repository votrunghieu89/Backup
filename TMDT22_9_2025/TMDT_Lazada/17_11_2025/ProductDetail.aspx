<%@ Page Title="" Language="C#" MasterPageFile="~/TMDT_Lazada/17_11_2025/Site1.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="TMDT22_9_2025.TMDT_Lazada._17_11_2025.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:DataList ID="dlProduct" runat="server" RepeatColumns="8" RepeatDirection="Horizontal" CellPadding="10">
            <ItemTemplate>
                <div class="product_card" style="border:1px solid #ccc; padding:10px; text-align:center; margin-bottom:10px;">
                    <asp:Image ID="imgProduct" runat="server"  ImageUrl='<%# "~/TMDT_Lazada/Image/" + Eval("HinhAnh") %>'  Width="150px" Height="150px" />
                    <h4><%# Eval("TenHangHoa") %></h4>
                    <p>Giá: <%# Eval("Gia", "{0:N0}") %> VNĐ</p>
                    <p>Số lượng: <%# Eval("SoLuongTon") %></p>
                    <p>Mô tả: Đang update</p>
                </div>
            </ItemTemplate>
        </asp:DataList>
</asp:Content>
