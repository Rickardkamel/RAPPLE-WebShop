<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="RappleWebShop.LoginPage" %>

<!DOCTYPE html>
<link href="Content/bootstrap.min.css" rel="stylesheet" />
<script src="scripts/bootstrap.min.js"></script>
<script src="scripts/jquery-1.9.1.min.js"></script>
<link href="Content/Styles.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rapple Login</title>
</head>
<body class="body">
    <div class="container">

        <form runat="server" class="form-signin">
            <h2 class="text-center">Welcome to Rapple</h2>
            <h5 class="text-center">You need to log in to access the webshop!</h5>
            <div class="input-group">
                <asp:TextBox runat="server"
                    class="form-control input-group-lg"
                    Style="width: 300px;"
                    type="email"
                    placeholder="Email"
                    ID="userEmail"
                    required="" />
            </div>

            <div class="input-group">
                <asp:TextBox runat="server"
                    class="form-control input-group-lg"
                    Style="width: 300px; margin-top: 10px;"
                    type="password"
                    placeholder="Password"
                    ID="userPassword"
                    required="" />
            </div>
            <div class="text-center">
                <strong>
                    <asp:Label runat="server"
                        ID="lblWrongInput"
                        Text="Wrong password or email!"
                        Visible="False" />
                </strong>
            </div>
            <div>
                <h5 class="text-center"><a href="RegistrationPage.aspx">Don't have an account? Register here!</a></h5>
            </div>
            <asp:Button runat="server"
                class="btn btn-lg btn-primary btn-block"
                type="submit"
                Text="Sign In"
                OnClick="btnSignIn_Click"
                ID="btnSignIn" />
        </form>
    </div>
</body>
</html>
