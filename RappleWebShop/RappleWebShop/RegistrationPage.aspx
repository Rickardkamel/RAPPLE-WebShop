<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="RappleWebShop.RegistrationPage" %>

<!DOCTYPE html>
<link href="Content/bootstrap.min.css" rel="stylesheet" />
<script src="scripts/bootstrap.min.js"></script>
<script src="scripts/jquery-1.9.1.min.js"></script>
<link href="Content/Styles.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
</head>
<body class="body">
    <div class="container">
        <form runat="server" class="form-signin">
            <h3 class="text-center">Rapple Registration Page</h3>
            <div class="input-group">
                <asp:TextBox runat="server"
                    class="form-control input-group-lg"
                    Style="width: 150px; margin-top: 10px;"
                    placeholder="First Name"
                    ID="newUserFirstName"
                    required=""
                    MaxLength="50"/>
                <asp:TextBox runat="server"
                    class="form-control input-group-lg"
                    Style="width: 150px; margin-top: 10px;"
                    type="text"
                    placeholder="Last Name"
                    ID="newUserLastName"
                    required="" 
                    MaxLength="50"/>
            </div>
            <div class="input-group">
                <asp:TextBox runat="server"
                    class="form-control input-group-lg"
                    Style="width: 300px; margin-top: 10px;"
                    TextMode="Email"
                    placeholder="Your Email"
                    ID="newUserEmail"
                    required="" 
                    MaxLength="150"/>
                <strong>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                        runat="server"
                        ErrorMessage="Email form: example@domain.com"
                        ControlToValidate="newUserEmail"
                        ValidationExpression="^[A-z0-9._%+-]+@[A-z0-9.-]+\.[A-z]{2,3}$"
                        Display="Dynamic"
                        CssClass="centerValidator" />
                    <asp:CustomValidator ID="CustomValidator1"
                        runat="server"
                        ErrorMessage="Email already exists"
                        Display="Dynamic"
                        CssClass="centerValidator"
                        OnServerValidate="ValidateEmail" />
                </strong>
            </div>
            <div class="input-group">
                <asp:TextBox runat="server"
                    class="form-control input-group-lg"
                    Style="width: 300px; margin-top: 10px;"
                    TextMode="Number"
                    placeholder="Age"
                    ID="newUserAge"
                    required=""
                    min="1" max="100" />
            </div>
            <div class="input-group">
                <asp:TextBox runat="server"
                    class="form-control input-group-lg"
                    Style="width: 300px; margin-top: 10px;"
                    TextMode="Password"
                    placeholder="Password"
                    ID="newUserPassword1"
                    required="" 
                    MinLength="3"
                    MaxLength="35"/>
                <asp:TextBox runat="server"
                    class="form-control input-group-lg"
                    Style="width: 300px; margin-top: 10px; margin-bottom: 10px;"
                    TextMode="Password"
                    placeholder="Password (again)"
                    ID="newUserPassword2"
                    required="" 
                    MinLength="3"
                    MaxLength="35"/>
                <asp:CompareValidator ID="CompareValidator1"
                    runat="server" 
                    ErrorMessage="Your passwords did not match"
                    CssClass="centerValidator"
                    Display="Dynamic"
                    ControlToValidate="newUserPassword2"
                    ControlToCompare="newUserPassword1"></asp:CompareValidator>
            </div>
            <div class="container-fluid">
                <asp:CheckBox runat="server"
                    class="text-center checkbox"
                    Text="Send me Rapple Offers"
                    ID="chbOffer" />
            </div>

            <asp:Button runat="server"
                class="btn btn-lg btn-primary btn-block"
                type="submit"
                Text="Register"
                OnClick="btnRegister_Click"
                ID="btnRegister" />
            <div>
                <h5 class="text-center"><a href="LoginPage.aspx">Go back to login section!</a></h5>
            </div>
        </form>
    </div>
</body>
</html>
