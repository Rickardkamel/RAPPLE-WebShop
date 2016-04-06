<%@ Page Title="" Language="C#" MasterPageFile="~/Rapple.Master" AutoEventWireup="true" CodeBehind="OrderHistoryPage.aspx.cs" Inherits="RappleWebShop.OrderHistoryPage" %>

<%@ Import Namespace="RappleWebShop.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-sm-5">
                <table class="table">
                    <thead>
                        <tr style="font-size: 18px;">
                            <th>Order Date</th>
                            <th class="text-center">Price</th>
                        </tr>
                    </thead>
                    <asp:ListView runat="server"
                        ItemType="RappleWebShop.Models.Order"
                        ID="lviOrderHistory">
                        <ItemTemplate>
                            <tbody>
                                <tr>
                                    <td class="col-sm-8 col-md-6">
                                        <div>
                                            <asp:Label runat="server"
                                                ID="lblOrderDate"><%# Item.OrderDate.ToString("yyyy-MM-dd") %></asp:Label>
                                        </div>
                                    </td>
                                    <td class="col-sm-1 col-md-1 text-center"><strong>
                                        <asp:Label runat="server"
                                            ID="lblOrderPrice"><%# Item.Price %></asp:Label></strong>
                                    </td>
                                </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <tr>
                                <td class="col-sm-8 col-md-12">
                                    <h2 class="col-lg-offset-3 text-center">No Orders Found!</h2>
                                </td>
                            </tr>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </table>
            </div>
        </div>
    </div>
    <strong>
        <asp:Label runat="server"
            CssClass="col-md-offset-4"
            ID="lblOrderTotal"></asp:Label></strong>
</asp:Content>
