<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="AnnMariaShaju_BookStore.Admin" %>
 <asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
     <div class="container">
         <br />
      <h2 id ="product_head">Products</h2>
        <div class="form-group">
            <label class="col-xs-4 col-sm-offset-1 col-sm-3 control-label"> Choose a category:</label>
              <div class="col-xs-8 col-sm-5">
                  <asp:DropDownList ID="ddlCategoryAdmin" runat="server"
                      AutoPostBack="true" CssClass="form-control"
                      DataSourceID="SqlDataSource1" style="margin-bottom:20px" DataTextField="Genre_Name" DataValueField="Genre_Id">
                  </asp:DropDownList>
                  <asp:SqlDataSource runat="server" ID="SqlDataSource1"
                      ConnectionString="<%$ ConnectionStrings:ConnectionString_BookStore %>"
                      SelectCommand="SELECT [Genre_Id], [Genre_Name] FROM [Genre]"></asp:SqlDataSource>
              </div><br />
              <div class="form-group">
                <div class="col-xs-12 col-sm-offset-1 col-sm-9">
                    <asp:DataList ID="dlProductsAdmin" runat="server"
                        CssClass="table table-bordered table-striped table-condensed"
                        DataSourceID="SqlDataSource2" 
                        DataKeyField="Book_Id" 
                      >
                         <HeaderTemplate>
                            <span class="col-xs-3">ID</span>
                            <span class="col-xs-3">Product</span>
                               <span class="col-xs-3 text-right">Author</span>
                            <span class="col-xs-3 text-right">Unit Price</span>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Book_Id") %>' runat="server" 
                                ID="Book_IdLabel" CssClass="col-xs-3"/>
                            <asp:Label Text='<%# Eval("Book_Name") %>' runat="server" 
                                ID="Book_NameLabel"  CssClass="col-xs-3"/>
                            <asp:Label Text='<%# Eval("Author") %>' runat="server" 
                                ID="AuthorLabel" CssClass="col-xs-3 text-right" />
                            <asp:Label Text='<%# Eval("Price","{0:C}") %>' runat="server" 
                                ID="PriceLabel" CssClass="col-xs-3 text-right"/>
                        </ItemTemplate>
                           <HeaderStyle CssClass="bg-table-head"  ForeColor="White" BackColor="#7b7171" />
                    </asp:DataList>
                  
                    <asp:SqlDataSource runat="server" ID="SqlDataSource2"
                        ConnectionString="<%$ ConnectionStrings:ConnectionString_BookStore %>"
                        SelectCommand="SELECT [Book_Id], [Book_Name], [Book_Image], [Author], [Description], [Genre_Id], [Price] FROM [Books] WHERE ([Genre_Id] = @Genre_Id) ORDER BY [Genre_Id]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlCategoryAdmin" 
                                PropertyName="SelectedValue" Name="Genre_Id" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                  </div>
              </div>
        </div>
    </div>
</asp:Content>

