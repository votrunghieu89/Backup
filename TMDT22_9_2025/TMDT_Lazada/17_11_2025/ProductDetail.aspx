<%@ Page Title="" Language="C#" MasterPageFile="~/TMDT_Lazada/17_11_2025/Site1.Master" 
    AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" 
    Inherits="TMDT22_9_2025.TMDT_Lazada._17_11_2025.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .product_card{
            border:1px solid #ccc;
            padding:10px;
            text-align:center;
            margin-bottom:15px;
            border-radius:5px;
            box-shadow:0 2px 6px rgba(0,0,0,0.1);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .product_card:hover {
            transform: translateY(-5px);
            box-shadow:0 5px 15px rgba(0,0,0,0.2);
        }
        .edit-panel{
            border:1px solid #333;
            padding:15px;
            margin-bottom:20px;
            background-color:#f8f8f8;
            width:350px;
        }
        .edit-panel input, .edit-panel select{
            width:100%;
            margin-bottom:10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Datalist sản phẩm -->
    <asp:DataList ID="dlProduct" runat="server"
        RepeatColumns="8" RepeatDirection="Horizontal" CellPadding="10"
        OnItemCommand="dlProduct_ItemCommand">
        <ItemTemplate>
            <div class="product_card">
                <asp:Image ID="imgProduct" runat="server"  
                    ImageUrl='<%# "~/TMDT_Lazada/Image/" + Eval("HinhAnh") %>'  
                    Width="150px" Height="150px" />
                <h4><%# Eval("TenHangHoa") %></h4>
                <p>Giá: <%# Eval("Gia", "{0:N0}") %> VNĐ</p>
                <p>Số lượng: <%# Eval("SoLuongTon") %></p>
                <p>Mô tả: Đang update</p>
                <div class="UD">
                  <asp:Button ID="btnEdit" runat="server" Text="Sửa"
                        CommandName="Edit"
                        CommandArgument='<%# Eval("maHangHoa") %>' />
                   <asp:Button ID="btnDelete" runat="server" Text="Xoá"
                        CommandName="Delete"
                        CommandArgument='<%# Eval("maHangHoa") %>' />
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>

    <!-- Panel Edit sản phẩm -->
    <asp:Panel ID="editProductPanel" runat="server" Visible="false" CssClass="edit-panel">
        <h2>Sửa sản phẩm</h2>
        <asp:HiddenField ID="hfProductId" runat="server" />

        <asp:TextBox ID="txtEditName" runat="server" Placeholder="Tên hàng hoá" CssClass="form-control"></asp:TextBox>
        <asp:TextBox ID="txtEditPrice" runat="server" Placeholder="Giá" CssClass="form-control"></asp:TextBox>
        <asp:TextBox ID="txtEditStock" runat="server" Placeholder="Số lượng tồn" CssClass="form-control"></asp:TextBox>

        <asp:DropDownList ID="ddlEditCategory" runat="server" CssClass="form-control"></asp:DropDownList>

        <asp:FileUpload ID="fuEditImage" runat="server" /><br />
        <asp:Image ID="imgEditPreview" runat="server" Width="150" Height="150" />

        <div class="button-container">
            <asp:Button ID="btnUpdate" runat="server" Text="Lưu thay đổi" OnClick="btnUpdate_Click" CssClass="btn-submit" />
            <asp:Button ID="btnCancelEdit" runat="server" Text="Hủy" OnClick="btnCancelEdit_Click" CssClass="btn-cancel" />
        </div>
    </asp:Panel>

</asp:Content>
