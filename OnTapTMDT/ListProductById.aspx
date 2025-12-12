<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="ListProductById.aspx.cs" Inherits="OnTapTMDT.ListProductById" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
.product-list {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}

.product_card {
    width: 200px;
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 12px;
    background: #fff;
    text-align: center;
    transition: 0.2s;
}

.product_card:hover {
    transform: translateY(-5px);
    border-color: #007bff;
    box-shadow: 0 3px 8px rgba(0,0,0,0.15);
}

.product_card img {
    width: 100%;
    height: 150px;
    object-fit: cover;
    border-radius: 6px;
}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:DataList ID="dlProduct" runat="server"
    RepeatColumns="4"
    RepeatDirection="Horizontal"
    CssClass="product-list">
<ItemTemplate>
    <div class="product_card">
        <asp:HyperLink ID="lnkProduct" runat="server"
            NavigateUrl='<%# "ProductDetail.aspx?MaHoa=" + Eval("MaHoa") %>'
            style="text-decoration:none; color:black;">
            <asp:Image ID="imgProduct" runat="server"
                ImageUrl='<%# "~/Image/" + Eval("HinhAnh") %>' />
            <h4><%# Eval("TenHoa") %></h4>
            <p><%# Eval("DonGia", "{0:N0}") %> VNĐ</p>
        </asp:HyperLink>
    </div>
</ItemTemplate>
</asp:DataList>

</asp:Content>
