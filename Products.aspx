<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="AnnMariaShaju_BookStore.Products" %>
 <asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
     <div class="container"><br />
      <h2 id ="product_head">Products</h2>
        <div class="row col-sm-12">
            <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" Font-Size="medium" ForeColor="#0066CC"></asp:Label><br />
        </div>
       <div class="row col-sm-12">
       <div class="col-sm-12">
        <div class="form-group">
          <label class="control-label col-sm-2">Please select a category:</label>
          <div class="col-sm-10">
              <asp:DropDownList ID="ddlGenres" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlGenres_SelectedIndexChanged"  DataTextField="Genre_Name" DataValueField="Genre_Id" DataSourceID="SqlDataSource1"></asp:DropDownList>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_BookStore %>" SelectCommand="SELECT * FROM [Genre]"></asp:SqlDataSource>
          </div>
        </div>
           <br />

           <div class="form-group">
          <label class="control-label col-sm-2">Please select a book:</label>
          <div class="col-sm-10">
              <asp:DropDownList ID="ddlBooks" runat="server" CssClass="form-control" AutoPostBack="true"  OnSelectedIndexChanged="ddlBooks_SelectedIndexChanged" DataTextField="Book_Name" DataValueField="Book_Id" DataSourceID="SqlDataSource2" ></asp:DropDownList>
              <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:ConnectionString_BookStore %>" SelectCommand="SELECT * FROM [Books] WHERE ([Genre_Id] = @Genre_Id)">
               <SelectParameters>
                   <asp:ControlParameter ControlID="ddlGenres" PropertyName="SelectedValue" DefaultValue="1" Name="Genre_Id" Type="Int32"></asp:ControlParameter>
               </SelectParameters>
           </asp:SqlDataSource>          
          </div>
        </div><br />
        <div class="col-sm-3">
            <asp:Image ID="imgProduct" runat="server" Height="250px" Width="200px" />
        </div>
        <div class="col-sm-9">
            <div class="form-group">
                <div class="col-sm-12">
                    <h4><asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label></h4>
                </div>
            </div>
        
              <div class="form-group">
                <div class="col-sm-12">
                    <asp:Label ID="lblAuthor" runat="server" Font-Italic="True"></asp:Label>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-12">
                    <asp:Label ID="lblDescription" runat="server"></asp:Label>
                </div>
              </div>

             <div class="form-group">
                <div class="col-sm-12">
                    <asp:Label ID="lblPrice" runat="server" Font-Bold="True"></asp:Label>
                </div>
             </div>
             <div class="form-group">
                 <div class="row col-sm-12">
                    <label class="col-sm-2">Quantity:</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtQuantity" runat="server" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-6">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  CssClass="text-danger" ErrorMessage="Please Enter Quantity" ControlToValidate="txtQuantity" Display="Dynamic" ></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="Quantity must range from 1 to 500." MaximumValue="500" MinimumValue="1" Type="Integer" ></asp:RangeValidator>
                    </div>
                 </div>
             </div>
             <div class="form-group">
               <div class="row col-sm-12">
                    <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" onclick="btnAdd_Click" CssClass="btn btn-success"  />
                    <asp:Button ID="btnCart" runat="server" Text="Go to Cart" PostBackUrl="~/Cart" CausesValidation="False" CssClass="btn btn-warning" />
                </div>
            </div>
          </div>
        </div>
      </div><br />
    </div>
</asp:Content>

