<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateProduct.ascx.cs" Inherits="TMDT22_9_2025.TMDT_Lazada._17_11_2025.CreateProduct1" %>

<style>
    /* Popup panel */
    #<%= createProductPanel.ClientID %> {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 1000;
        background: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        width: 400px;
    }

    /* Title */
    #<%= createProductPanel.ClientID %> h2 {
        text-align: center;
        margin-bottom: 15px;
        font-family: Arial, sans-serif;
    }

    /* Input, dropdown */
    .form-control {
        width: 100%;
        padding: 8px 10px;
        margin: 6px 0;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
        font-size: 14px;
    }

    /* Image preview */
    .image-preview {
        width: 100%;
        max-height: 200px;
        display: none;
        margin-top: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        object-fit: contain;
    }

    /* Buttons */
    .btn-submit, .btn-cancel {
        height: 38px;
        border-radius: 5px;
        cursor: pointer;
        border: none;
        font-weight: bold;
    }

    .btn-submit {
        width: 130px;
        background-color: #4CAF50;
        color: white;
        transition: 0.2s;
    }

    .btn-submit:hover {
        background-color: #45a049;
        transform: translateY(-2px);
    }

    .btn-cancel {
        width: 60px;
        background-color: #f44336;
        color: white;
        margin-left: 10px;
        transition: 0.2s;
    }

    .btn-cancel:hover {
        background-color: #e53935;
        transform: translateY(-2px);
    }

    /* Button container */
    #<%= createProductPanel.ClientID %> .button-container {
        margin-top: 10px;
        display: flex;
        justify-content: space-between;
    }
</style>

<div id="createProductPanel" runat="server">
    <h2>Tạo sản phẩm</h2>

    <asp:TextBox ID="txtProductName" runat="server" Placeholder="Tên hàng hoá" CssClass="form-control"></asp:TextBox>
    <asp:TextBox ID="txtPrice" runat="server" Placeholder="Giá" CssClass="form-control"></asp:TextBox>
    <asp:TextBox ID="txtDescription" runat="server" Placeholder="Số lượng tồn" CssClass="form-control"></asp:TextBox>
    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control"></asp:DropDownList>

    <asp:FileUpload ID="fuProductImage" runat="server" onchange="previewImage(this);" /><br />
    <img id="imgPreview" runat="server" class="image-preview" src="#" alt="Preview" />

    <div class="button-container">
        <asp:Button ID="btnSubmit" runat="server" Text="Tạo sản phẩm" OnClick="btnSubmit_Click" CssClass="btn-submit" />
        <asp:Button ID="btnCancel" runat="server" Text="Hủy" OnClientClick="hideForm(); return false;" CssClass="btn-cancel" />
    </div>
</div>

<script>
    function previewImage(input) {
        const file = input.files[0];
        const preview = document.getElementById('<%= imgPreview.ClientID %>');
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                preview.src = e.target.result;
                preview.style.display = 'block';
            }
            reader.readAsDataURL(file);
        } else {
            preview.style.display = 'none';
        }
    }

    function showForm() {
        document.getElementById('<%= createProductPanel.ClientID %>').style.display = 'block';
    }

    function hideForm() {
        document.getElementById('<%= createProductPanel.ClientID %>').style.display = 'none';
        document.getElementById('<%= txtProductName.ClientID %>').value = '';
        document.getElementById('<%= txtPrice.ClientID %>').value = '';
        document.getElementById('<%= txtDescription.ClientID %>').value = '';
        document.getElementById('<%= imgPreview.ClientID %>').style.display = 'none';
        if(document.getElementById('<%= fuProductImage.ClientID %>')) 
        document.getElementById('<%= fuProductImage.ClientID %>').value = '';
    }
</script>
