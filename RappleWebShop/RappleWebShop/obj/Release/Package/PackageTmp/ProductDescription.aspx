<%@ Page Title="" Language="C#" MasterPageFile="~/Rapple.Master" AutoEventWireup="true" CodeBehind="ProductDescription.aspx.cs" Inherits="RappleWebShop.ProductDescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView runat="server"
        ID="lviProductDescription"
        ItemType="RappleWebShop.Models.Product">
        <ItemTemplate>
            <div class="contentPlacement">
                <img src="<%# Item.ImagePath %>" height="400" width="500" />
                <h3>Product Name: <%# Item.Name %></h3>
                <h3>Price: <%# Item.Price %>SEK</h3>
                <h3><%# Item.Details %></h3>

                <asp:TextBox runat="server"
                    Style="width: 75px; margin-bottom: 10px;"
                    TextMode="Number"
                    class="form-control"
                    ID="tboQuantity"
                    value="1">
                </asp:TextBox>
                <div>
                    <asp:RangeValidator ID="RangeValidator1"
                        runat="server"
                        ErrorMessage="Can only be 1-100"
                        Type="Integer"
                        MinimumValue="1"
                        MaximumValue="100"
                        Display="Dynamic"
                        ControlToValidate="tboQuantity"></asp:RangeValidator>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server"
                        ErrorMessage="Can't be empty"
                        Display="Dynamic"
                        ControlToValidate="tboQuantity"></asp:RequiredFieldValidator>
                </div>

                <asp:Button runat="server"
                    class="btn btn-success"
                    Text="Add to cart"
                    ID="btnAddToCart"
                    OnCommand="SendToSession"
                    CommandArgument="<%# Item.ID %>" />
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
