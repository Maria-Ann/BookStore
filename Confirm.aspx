<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="AnnMariaShaju_BookStore.Confirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Book Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Css/Style.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <style>
    #body_confirm {
      font-family: Arial, sans-serif;
      background-color: #f7f7f7;
      margin: 0;
      padding: 20px;
    }

    .container {
      max-width: 600px;
      margin: 0 auto;
      background-color: #ffffff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    }

    h1 {
      color: forestgreen;
      margin-bottom: 20px;
      text-align:center;
    }

    p {
      color: #666666;
      line-height: 1.5;
       text-align:center;
    }

    .order-details {
      margin-top: 30px;
      background-color: #f7f7f7;
      padding: 10px;
      border-radius: 5px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 10px;
      text-align: left;
      border-bottom: 1px solid #dddddd;
    }

    th {
      background-color: #f2f2f2;
    }
    .center{
         display: flex;
      justify-content: center;
    }
  </style>
</head>
<body Id="body_confirm">
    <form id="form1" runat="server">
        <div class="container" >
             <h1>Order Placed</h1>
             <p>Thank you for placing your order! Here are the details:</p>
            <div class="order-details">
              <table>
                <tr>
                    <th>Contact information</th>
                    <th></th>
                    <th></th>
                </tr>
                  <tr>
                      <td>
                           Email : <asp:Label ID="lblEmail" runat="server" ></asp:Label>
                         
                      </td>
                  </tr>
                   <tr>
                      <td>
                           First Name : <asp:Label ID="lblFirstName" runat="server" ></asp:Label>
                         
                      </td>
                  </tr>
                    <tr>
                      <td>
                           Last Name : <asp:Label ID="lblLastName" runat="server" ></asp:Label>
                         
                      </td>
                  </tr>
                   <tr>
                      <td>
                           Phone Number : <asp:Label ID="lblPhoneNumber" runat="server" ></asp:Label>
                      </td>
                  </tr>
                  <tr>
                    <th>Billing Address</th>
                    <th></th>
                    <th></th>
                  </tr>
                   <tr>
                      <td>
                           Address : <asp:Label ID="lblAddress" runat="server" ></asp:Label>
                         
                      </td>
                  </tr>
                   <tr>
                      <td>
                           City : <asp:Label ID="lblCity" runat="server" ></asp:Label>
                         
                      </td>
                  </tr>
                   <tr>
                      <td>
                           State : <asp:Label ID="lblState" runat="server" ></asp:Label>
                         
                      </td>
                  </tr>
                   <tr>
                      <td>
                           Zip code : <asp:Label ID="lblZipCode" runat="server" ></asp:Label>
                         
                      </td>
                  </tr>
              </table>
            </div>
        </div><br />
        <div class="form-group center">
            <asp:Button ID="btnContinue" runat="server" CssClass="btn btn-default" PostBackUrl="~/Products.aspx" Text="Continue Shopping" />
        </div>
    </form>
</body>
</html>
