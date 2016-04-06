<%@ Page Title="" Language="C#" MasterPageFile="~/Rapple.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="RappleWebShop.ProductPage" %>

<%@ Import Namespace="RappleWebShop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ListView runat="server"
        ID="lviProductPage"
        ItemType="RappleWebShop.Models.Product">
        <ItemTemplate>
            <div class="container">
                <div class="item col-xs-4 col-lg-4 list-group-item">
                    <div>
                        <a href="ProductDescription.aspx?productname=<%# Item.Name %>">
                            <img width="250" height="200" src="<%# Item.ImagePath %>">
                        </a>
                        <div class="caption">
                            <div class="row">
                                <div class="col-xs-6 col-md-6">
                                    <h4 class="group inner list-group-item-heading"><%# Item.Name %></h4>
                                    <span id="showInfo<%#Item.ID%>"
                                        style="cursor: pointer; font-weight: bold;"
                                        onclick="showDetails(<%#Item.ID%>)">Show More 
                                <span id="x"
                                    class="glyphicon glyphicon-arrow-down"></span>
                                    </span>
                                    <div class="group inner list-group-item-text"
                                        hidden="true"
                                        id="test<%#Item.ID%>">
                                        <%# Item.Details %>
                                        <br />
                                        <a href="ProductDescription.aspx?productname=<%# Item.Name %>">Go to product description</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-md-6">
                                    <p class="lead">
                                        <%# Item.Price %>SEK
                                    </p>
                                </div>
                                <div class="col-xs-6 col-md-6">
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
                                        OnCommand="SendToSession"
                                        CommandArgument="<%# Item.ID %>"
                                        ID="btnAddToCart" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
