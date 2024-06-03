<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="AnnMariaShaju_BookStore.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="Css/Style.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

    <main>
        <div class="container">
            <h2 id ="product_head">Log In</h2>
            <form id="form1" runat="server" class="form-horizontal" defaultfocus="txtFirstname" defaultbutton="btnLogIn">
                <div class="form-group">
                    <div class="col-sm-2"></div>
                    <label class="col-sm-3">First Name</label> 
                    <div class="col-sm-5">
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                     <div class="col-sm-2">
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"  ErrorMessage="First Name Required" CssClass="text-danger"  Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2"></div>
                    <label class="col-sm-3">Last Name</label> 
                    <div class="col-sm-5">
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                     <div class="col-sm-2">
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server"  ErrorMessage="Last Name Required" CssClass="text-danger"  Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                    </div>
                </div>
                 <div class="form-group">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-3"></div>
                    <div class="col-sm-7">
                        <asp:Button ID="btnLogIn" runat="server" Text="Log In" CssClass="btn btn-success" OnClick="btnLogIn_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" CausesValidation="False" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </form>
        </div>
    </main>
</body>
</html>
