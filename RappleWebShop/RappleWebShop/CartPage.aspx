<%@ Page Title="" Language="C#" MasterPageFile="~/Rapple.Master" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="RappleWebShop.CartPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-10">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th class="text-center">Price (SEK)</th>
                            <th class="text-center">Total (SEK)</th>
                            <th></th>
                        </tr>
                    </thead>

                    <asp:ListView runat="server"
                        ItemType="RappleWebShop.Logic.ShoppingCartItem"
                        ID="lviCartPage">
                        <ItemTemplate>
                            <tbody>
                                <tr>
                                    <td class="col-sm-6 col-md-4">
                                        <div class="media">
                                            <a class="thumbnail pull-left"
                                                href="ProductDescription.aspx?productname=<%# Item.Product.Name %>">
                                                <img class="media-object"
                                                    src="<%# Item.Product.ImagePath %>" style="width: 72px; height: 72px;">
                                            </a>
                                            <div class="media-body">
                                                <h4><%# Item.Product.Name %></h4>
                                                <h5>Apple</h5>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="col-sm-1 col-md-1" style="text-align: center">
                                        <asp:TextBox runat="server"
                                            TextMode="Number"
                                            class="form-control"
                                            ID="tboQuantity"
                                            value="<%# Item.Quantity %>">
                                        </asp:TextBox>
                                        <div>
                                            <asp:RangeValidator ID="RangeValidator1"
                                                runat="server"
                                                ErrorMessage="Can only be 0-100"
                                                Type="Integer"
                                                MinimumValue="0"
                                                MaximumValue="100"
                                                Display="Dynamic"
                                                ControlToValidate="tboQuantity"></asp:RangeValidator>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                                runat="server"
                                                ErrorMessage="Can't be empty"
                                                Display="Dynamic"
                                                ControlToValidate="tboQuantity"></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                    <td class="col-sm-1 col-md-1 text-center"><strong>
                                        <asp:Label runat="server"
                                            ID="lblProductPrice"><%# Item.Product.Price %></asp:Label></strong></td>
                                    <td class="col-sm-1 col-md-1 text-center"><strong>
                                        <asp:Label runat="server"
                                            ID="lblTotalPrice"><%# Item.Product.Price * Item.Quantity %></asp:Label></strong>
                                    </td>
                                    <td class="col-sm-1 col-md-1">
                                        <asp:Button runat="server"
                                            CssClass="btn btn-default"
                                            Text="Update"
                                            OnCommand="UpdateCart"
                                            CommandArgument="<%# Item.Product.ID %>" />
                                    </td>
                                    <td class="col-sm-1 col-md-1">
                                        <asp:Button runat="server"
                                            class="btn btn-danger"
                                            Text="Remove"
                                            OnCommand="RemoveItem"
                                            CommandArgument="<%# Item.Product.ID %>"></asp:Button>
                                    </td>
                                </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </table>
            </div>
        </div>
    </div>
    <strong>
        <asp:Label runat="server"
            CssClass="col-md-offset-9"
            ID="lblSumTotal"></asp:Label></strong>
    <asp:Button runat="server"
        ID="btnCheckout"
        Text="Checkout"
        CssClass="btn btn-success col-md-offset-10"
        Visible="False" OnClick="btnCheckout_Click" />
    <asp:Label runat="server"
        ID="lblEmptyCart"
        Visible="True"
        CssClass="col-lg-offset-4"
        Style="font-size: 25px;"
        Text="Your shopping cart is empty!"></asp:Label>
</asp:Content>
