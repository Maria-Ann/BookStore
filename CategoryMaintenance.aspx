<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryMaintenance.aspx.cs" Inherits="AnnMariaShaju_BookStore.CategoryMaintenance" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
     <div class="container"><br />
      <h2 id ="product_head">Categories</h2>
        <div class="form-group">
            <div class="col-xs-12 table-responsive">
                <asp:GridView ID="grdCategories" runat="server"
                    AutoGenerateColumns="false"
                    CssClass="table table-bordered table-condensed table-hover"
                    DataSourceID="SqlDataSource1" DataKeyNames="Genre_Id"
                    AllowPaging="True"   
                    OnPreRender="grdCategories_PreRender" 
                    OnRowDeleted="grdCategories_RowDeleted" 
                    OnRowUpdated="grdCategories_RowUpdated">
                    <Columns>
                        <asp:BoundField DataField="Genre_Id" HeaderText="Genre_Id"
                            ReadOnly="True" SortExpression="Genre_Id">
                             <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Genre_Name" HeaderText="Genre_Name" 
                            SortExpression="Genre_Name">
                             <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                        <asp:CommandField ShowEditButton="True" CausesValidation="False" >
                             <ItemStyle CssClass="col-xs-1 text-danger" />
                        </asp:CommandField>
                         <asp:CommandField ShowDeleteButton="True" CausesValidation="False" >
                             <ItemStyle CssClass="col-xs-1 text-danger" />
                        </asp:CommandField>
                    </Columns>
                     <HeaderStyle CssClass="bg-table-head"  ForeColor="White" BackColor="#7b7171" />
                    <AlternatingRowStyle CssClass="altRow" />
                    <EditRowStyle CssClass="warning" />
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_BookStore %>" 
                    SelectCommand="SELECT [Genre_Id], [Genre_Name] FROM [Genre]" 
                    DeleteCommand="DELETE FROM [Genre] WHERE [Genre_Id] = @Genre_Id" 
                    InsertCommand="INSERT INTO [Genre] ([Genre_Id], [Genre_Name]) VALUES (@Genre_Id, @Genre_Name)" 
                    UpdateCommand="UPDATE [Genre] SET [Genre_Name] = @Genre_Name WHERE [Genre_Id] = @Genre_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Genre_Id" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Genre_Id" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Genre_Name" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Genre_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Genre_Id" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            </div>
         <div class="form-group">
              <div class="col-xs-12">
              <h3>Add New Category</h3><br />
                <p><asp:Label ID="lblError" runat="server" EnableViewState="false" 
                        CssClass="text-danger"></asp:Label></p>

                <div class="form-group">
                    <label for="txtID" class="col-sm-2">ID</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtID" runat="server" MaxLength="10" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-offset-3 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvID" runat="server" 
                            ControlToValidate="txtID" CssClass="text-danger" 
                            ErrorMessage="ID is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtGenreName" class="col-sm-2">Category Name</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtGenreName" runat="server" MaxLength="15" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-offset-2 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvGenreName" runat="server" 
                        ControlToValidate="txtGenreName" CssClass="text-danger" 
                        ErrorMessage="Category Name is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>   
                <div class="form-group">
                     <label for="txtGenreName" class="col-sm-2"></label>
                     <div class="col-sm-4">
                        <asp:Button ID="btnAdd" runat="server" Text="Add New Category" 
                          CssClass="btn btn-success" OnClick="btnAdd_Click" />
                    </div>
                </div>
               
            </div>  
         </div>
         </div>
</asp:Content>