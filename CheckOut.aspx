<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="AnnMariaShaju_BookStore.CheckOut" %>
 <asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
     <div class="container"><br />
      <h2 id ="product_head">Checkout</h2>
        <h3>CONTACT INFORMATION</h3><br />
        <div class="form-group">
            <label class="col-sm-3">Email Address</label> 
            <div class="col-sm-5">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="rfvEmail1" runat="server" CssClass="text-danger" Display="Dynamic"  ErrorMessage="Email Address Required" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail1" runat="server"  ErrorMessage="Email address" CssClass="text-danger" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ControlToValidate="txtEmail">Must be a valid email address</asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3">Email Re-enter</label> 
            <div class="col-sm-5">
                <asp:TextBox ID="txtEmailRe" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="rfvEmail2" runat="server" CssClass="text-danger" Display="Dynamic" ErrorMessage="Email Re-entry Required" ControlToValidate="txtEmailRe"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvEmail2" runat="server" ErrorMessage="Email re-entry" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtEmailRe" ControlToCompare="txtEmail">Must match first email address</asp:CompareValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3">Firstname</label> 
            <div class="col-sm-5">
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"  ErrorMessage="First Name Required" CssClass="text-danger"  Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3">Lastname</label> 
            <div class="col-sm-5">
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server"  ErrorMessage="Last Name Required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
             </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3">Phone Number</label> 
            <div class="col-sm-5">
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ErrorMessage="Phone Number Required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ErrorMessage="Phone number" CssClass="text-danger" Display="Dynamic" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ControlToValidate="txtPhone">Use this format: 123-456-7890</asp:RegularExpressionValidator>
            </div>
        </div>
         <h3>BILLING ADDRESS</h3><br />
         <div class="form-group">
            <label class="col-sm-3">Address</label> 
            <div class="col-sm-5">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="rfvStreetAddress" runat="server" ErrorMessage="Billing Address Required"  CssClass="text-danger" Display="Dynamic" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3">City</label> 
            <div class="col-sm-5">
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="Billing City Required"  CssClass="text-danger" Display="Dynamic" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3">State</label> 
            <div class="col-sm-5">
                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" AutoPostBack="True" DataTextField="StateName" DataValueField="StateCode" DataSourceID="SqlDataSource1"></asp:DropDownList><asp:SqlDataSource runat="server" ID="SqlDataSource3"></asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:ConnectionString_BookStore %>" SelectCommand="SELECT * FROM [States] ORDER BY [StateCode]"></asp:SqlDataSource>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="Billing State Required" CssClass="text-danger" Display="Dynamic" ControlToValidate="ddlState"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3">Zip Code</label> 
            <div class="col-sm-5">
                <asp:TextBox ID="txtZip" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="Zip Code Required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtZip"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="rev" runat="server" ErrorMessage="Invalid zip code format. Please enter a valid zip code" ValidationExpression="^[ABCEGHJKLMNPRSTVXY]\d[A-Z] \d[A-Z]\d$" ControlToValidate="txtZip" ></asp:RegularExpressionValidator>
            </div>
        </div>

         <h3>CARD DETAILS</h3><br />
         <div class="form-group">
            <label class="col-sm-3">Name on Card</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtNameOnCard" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="rfvNameOnCard" runat="server" ErrorMessage="Name On Card Required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtNameOnCard"></asp:RequiredFieldValidator>
            </div>
         </div>
         <div class="form-group">
            <label class="col-sm-3">Card Number</label> 
            <div class="col-sm-5">
                <asp:TextBox ID="txtCardNo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
               <asp:RequiredFieldValidator ID="rfvtxtCardNo" runat="server" ErrorMessage="Card Number is Required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtCardNo"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="revtxtCardNo" runat="server" ErrorMessage="Please enter Card Number in 4556 7890 1234 5678 format" CssClass="text-danger" ControlToValidate="txtCardNo" ValidationExpression="\b(?:4\d{3}|5[1-5]\d{2}|6011|3[47]\d{2})[-\s]?\d{4}[-\s]?\d{4}[-\s]?\d{4}\b"></asp:RegularExpressionValidator>

            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3">CVV</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtCVV" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="rfvCVV" runat="server" ErrorMessage="CVV Required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtCVV"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revCVV" runat="server" ErrorMessage="Please enter 4 digit CVV" CssClass="text-danger" ControlToValidate="txtCVV" ValidationExpression="^\d{4}$"></asp:RegularExpressionValidator>
            </div>
         </div>
         <div class="form-group">
            <label class="col-sm-3">Card Expires On</label> 
          <div class="col-sm-5">
              <asp:TextBox ID="txtExpDate" runat="server" type="Date" CssClass="form-control"></asp:TextBox>
          </div>
               <div class="col-sm-4">
               <asp:RequiredFieldValidator ID="rfvExpDate" runat="server" ErrorMessage="Expiry Date Required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtExpDate"></asp:RequiredFieldValidator>
               </div>
        </div><br/>

         <div class="form-group">
            <div class="col-sm-3"></div>
            <div class="col-sm-7">
                <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" CssClass="btn btn-success" OnClick="btnCheckOut_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" CssClass="btn btn-danger" CausesValidation="False" OnClick="btnCancel_Click" />
                <asp:LinkButton ID="lbtnContinueShopping" runat="server" CssClass="btn" PostBackUrl="~/Products" CausesValidation="False">Continue Shopping</asp:LinkButton>
            </div>
        </div>
     </div>
 </asp:Content>