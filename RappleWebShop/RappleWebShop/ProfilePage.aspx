<%@ Page Title="" Language="C#" MasterPageFile="~/Rapple.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="RappleWebShop.ProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container contentPlacement">
        <div class="text-center">
            <div runat="server" id="successDiv" Visible="False" class="col-md-offset-3">
                <h2 style="width: 500px;" class="alert alert-success"><span class="glyphicon glyphicon-check"></span>
                    <strong>Successfully updated!</strong></h2>
            </div>
            <h3 class="text-center">My Profile</h3>

            <div class="col-lg-offset-4 col-lg-4">
                <div class="input-group">
                    <asp:TextBox runat="server"
                        class="form-control input-group-lg"
                        Style="width: 300px; margin-top: 10px;"
                        placeholder="First Name"
                        ID="updateUserFirstName"
                        required=""
                        MaxLength="50" />
                    <br />
                    <asp:TextBox runat="server"
                        class="form-control input-group-lg"
                        Style="width: 300px; margin-top: 10px;"
                        placeholder="Last Name"
                        ID="updateUserLastName"
                        required=""
                        MaxLength="50" />
                </div>
                <div class="input-group">
                    <asp:TextBox runat="server"
                        class="form-control input-group-lg"
                        Style="width: 300px; margin-top: 10px;"
                        TextMode="Email"
                        placeholder="Email"
                        ID="updateUserEmail"
                        required=""
                        MaxLength="150" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                        runat="server"
                        ErrorMessage="Email form: example@domain.com"
                        ControlToValidate="updateUserEmail"
                        ValidationExpression="^[A-z0-9._%+-]+@[A-z0-9.-]+\.[A-z]{2,3}$"
                        Display="Dynamic"
                        CssClass="centerValidator" />
                    <asp:CustomValidator ID="CustomValidator1"
                        runat="server"
                        ErrorMessage="Email already exists"
                        Display="Dynamic"
                        CssClass="centerValidator"
                        OnServerValidate="ValidateEmail" />
                </div>

                <div class="input-group">
                    <asp:TextBox runat="server"
                        class="form-control input-group-lg"
                        Style="width: 300px; margin-top: 10px;"
                        TextMode="Number"
                        placeholder="Age"
                        ID="updateUserAge"
                        required=""
                        min="1" max="100" />
                </div>
                <div class="input-group">
                    <asp:TextBox runat="server"
                        class="form-control input-group-lg"
                        Style="width: 300px; margin-top: 10px;"
                        TextMode="Password"
                        placeholder="Set a new password"
                        ID="updateUserPassword"
                        MinLength="3"
                        MaxLength="35" />
                </div>
                <div class="container-fluid">
                    <asp:CheckBox runat="server"
                        class="text-center checkbox"
                        Text="Send me Rapple Offers"
                        ID="updateChbOffer" />
                </div>
                <div class="input-group">
                    <asp:TextBox runat="server"
                        class="form-control input-group-lg"
                        Style="width: 300px; margin-top: 10px; margin-bottom: 5px;"
                        placeholder="Type in your current password"
                        TextMode="Password"
                        ID="tboPasswordCheck"
                        required=""
                        MinLength="3"
                        MaxLength="35" />
                </div>
                <asp:Button runat="server"
                    Style="margin-left: 3px;"
                    class="btn btn-lg btn-primary btn-group-justified"
                    type="submit"
                    Text="Update"
                    ID="btnUpdateUser"
                    OnClick="btnUpdateUser_Click" />
            </div>
        </div>
    </div>
</asp:Content>
