<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="OnTapTMDT.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Khung detail */
.detail_container {
    display: flex;
    gap: 30px;
    align-items: flex-start;
    padding: 20px;
    max-width: 900px;
    margin: 0 auto; /* căn giữa Content */
}

/* Ảnh */
.detail_image img {
    width: 300px;
    height: 300px;
    object-fit: cover;
    border-radius: 8px;
    border: 1px solid #ddd;
}

/* Thông tin */
.detail_info {
    flex: 1;
}

.detail_info h2 {
    font-size: 24px;
    margin-bottom: 10px;
}

.detail_info .price {
    color: #d40000;
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 15px;
}

.detail_info .desc {
    font-size: 15px;
    color: #444;
    margin-bottom: 20px;
}

/* Buttons */
.action_btns {
    display: flex;
    gap: 15px;
    margin-top: 20px;
}

.btn-buy, .btn-cart {
    padding: 10px 18px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-weight: bold;
}

.btn-buy {
    background-color: #28a745;
    color: #fff;
}
.btn-buy:hover {
    background-color: #1f8436;
}

.btn-cart {
    background-color: #007bff;
    color: #fff;
}
.btn-cart:hover {
    background-color: #0056b3;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:DataList ID="dlProduct" runat="server" RepeatColumns="1" CellPadding="10">
        <ItemTemplate>
            <div class="detail_container">
                
                <!-- Hình sản phẩm -->
                <div class="detail_image">
                    <asp:Image ID="imgProduct" runat="server"
                        ImageUrl='<%# "~/Image/" + Eval("HinhAnh") %>' />
                </div>

                <!-- Thông tin sản phẩm -->
                <div class="detail_info">
                    <h2><%# Eval("TenHoa") %></h2>
                    <p class="price"><%# Eval("DonGia", "{0:N0}") %> VNĐ</p>
                    <p class="desc"><%# Eval("MoTa") %></p>

                    <div class="action_btns">
                        <asp:Button ID="btnBuy" runat="server" Text="Mua" CssClass="btn-buy"
                            OnClick="btnBuy_Click" />
                        <asp:Button ID="btnCard" runat="server" Text="Xem giỏ hàng" CssClass="btn-cart"
                            OnClick="btnCard_Click" />
                    </div>
                </div>

            </div>
        </ItemTemplate>
    </asp:DataList>

</asp:Content>

