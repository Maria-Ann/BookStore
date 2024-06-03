<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="AnnMariaShaju_BookStore.Cart" %>
 <asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="row"><br />
        <div class="col-sm-12">
            <h1 id="cart_head">Your shopping cart</h1>
        </div>
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:ListBox ID="lstCart" runat="server" CssClass="form-control" Rows="6" BackColor="#E3E3DD" Font-Bold="True" Font-Size="Medium" Height="272px" ForeColor="Black"></asp:ListBox>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-group">
                <div class="row col-sm-12">
                    <asp:Button ID="btnRemove" runat="server" Text="Remove Item" onclick="btnRemove_Click" CssClass="btn btn-danger"  />
                </div><br />
                <div class="row col-sm-12">
                    <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" onclick="btnEmpty_Click" CssClass="btn btn-primary"/>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="form-group">
                <asp:Label ID="lblMessage" runat="server" EnableViewState="False" CssClass="text-info"></asp:Label>
            </div>
            <div class="form-group">
                <div class="col-sm-5"></div>
                <div class="col-sm-7">
                    <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" PostBackUrl="~/Products" CssClass="btn btn-warning" />
                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" onclick="btnCheckOut_Click" CssClass="btn btn-success"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>