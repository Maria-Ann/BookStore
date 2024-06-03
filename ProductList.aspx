<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="AnnMariaShaju_BookStore.ProductList" %>
 <asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
     <div class="container"><br />
      <h2 id ="product_head">Our Products</h2>
       <div class="row">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="col-sm-3">
                    <div class="thumbnail" style="height: 350px;width:230px">
                        <a href='/Products/<%# Eval("Book_Id") %>'>
                            <img src='/Images/<%# Eval("Book_Image") %>' alt='<%# Eval("Book_Name") %>'  style="height: 270px;width:230px" /></a>
                        <div class="caption">
                            <h4><b><%# Eval("Book_Name") %></b></h4>
                            <p><b>Price: <%# Eval("Price", "{0:c}") %></b>
                           <%-- <br><br><%# Eval("Description") %></p>--%>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_BookStore %>" SelectCommand="SELECT * FROM [Books] ORDER BY [Book_Name]"></asp:SqlDataSource>
      </div>
    </div>


</asp:Content>
