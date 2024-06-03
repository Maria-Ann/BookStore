<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="EditProducts.aspx.cs" Inherits="AnnMariaShaju_BookStore.EditProducts" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">

    <div class="container"><br />
      <h2 id ="product_head">Products</h2>
        <div class="form-group">
             <div class="col-sm-6 table-responsive">
                 <asp:GridView ID="grdProducts" runat="server"
                     DataSourceID="SqlDataSource1"
                     AutoGenerateColumns="false"
                     AllowPaging="True"
                     DataKeyNames="Book_Id"
                     CssClass="table table-bordered table-striped table-condensed">
                     <Columns>
                         <asp:BoundField DataField="Book_Id" HeaderText="Book_Id" ReadOnly="True" SortExpression="Book_Id"></asp:BoundField>
                         <asp:BoundField DataField="Book_Name" HeaderText="Book_Name" SortExpression="Book_Name"></asp:BoundField>
                         <asp:BoundField DataField="Genre_Name" HeaderText="Genre_Name" SortExpression="Genre_Name"></asp:BoundField>
                         <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                     </Columns>
                     <HeaderStyle CssClass="bg-table-head" ForeColor="White" BackColor="#7b7171" />
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle CssClass="pagerStyle" 
                       ForeColor="White" BackColor="#7b7171" HorizontalAlign="Center" />
                    <SelectedRowStyle CssClass="warning" />
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                     ConnectionString="<%$ ConnectionStrings:ConnectionString_BookStore %>"
                     SelectCommand="SELECT [Book_Id], [Book_Name], [Genre_Name] FROM [Books] ORDER BY [Book_Id]"></asp:SqlDataSource>
                   
                <p><asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        HeaderText="Please correct the following errors:" 
                        CssClass="text-danger" />
                <p><asp:Label ID="lblError" runat="server" 
                    EnableViewState="false" CssClass="text-danger"></asp:Label></p>   
             </div>
             <div class="col-sm-6">
                <asp:FormView ID="fvProduct" runat="server" DataKeyNames="Book_Id" 
                    DataSourceID="SqlDataSource2" OnItemDeleting="fvProduct_ItemDeleting" 
                    OnItemDeleted="fvProduct_ItemDeleted" OnItemInserted="fvProduct_ItemInserted" 
                    OnItemUpdated="fvProduct_ItemUpdated">
                    <EditItemTemplate>
                        <div class="container-fluid">
                            <div class="form-group">
                                <label for="NameTextBox">Book Name:</label>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" Display="Dynamic" 
                                    ControlToValidate="NameTextBox" CssClass="text-danger"
                                    ErrorMessage="Book Name is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Book_Name") %>' 
                                    CssClass="form-control" Width="500px" />
                            </div>
                            <div class="form-group">
                                <label for="DescriptionTextBox">Description:</label>
                                <asp:RequiredFieldValidator ID="rfvShortDesc" runat="server" 
                                    ControlToValidate="DescriptionTextBox" CssClass="text-danger" 
                                    Display="Dynamic"
                                    ErrorMessage="Description is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                                    Text='<%# Bind("Description") %>' Width="500px" CssClass="form-control" />
                            </div>
                            
                            <div class="form-group">
                                <label for="ddlCategory">Category:</label>
                              
                                <asp:DropDownList runat="server" ID="ddlCategory" 
                                    DataSourceID="SqlDataSource2" DataTextField="Genre_Name" 
                                    DataValueField="Genre_Name" SelectedValue='<%# Bind("Genre_Name") %>' 
                                    CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="ImageFileTextBox">Image File:</label>
                                <asp:TextBox ID="ImageFileTextBox" runat="server" 
                                    Text='<%# Bind("Book_Image") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="PriceTextBox">Price:</label>
                                <asp:RequiredFieldValidator ID="rfvPrice" runat="server" Display="Dynamic"  
                                    ControlToValidate="PriceTextBox" CssClass="text-danger"
                                    ErrorMessage="Price is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvPrice" runat="server" Display="Dynamic" 
                                    ControlToValidate="PriceTextBox" Type="Double" Operator="GreaterThan" 
                                    ErrorMessage="Price must be a number greater than zero." Text="*" 
                                    CssClass="text-danger" ValueToCompare="0.00"></asp:CompareValidator>
                                <asp:TextBox ID="PriceTextBox" runat="server" 
                                    Text='<%# Bind("Price") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="OnHandTextBox">Author:</label>
                                <asp:RequiredFieldValidator ID="rfvAuthor" runat="server" Display="Dynamic" 
                                    ControlToValidate="AuthorTextBox" CssClass="text-danger"
                                    ErrorMessage="Author is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' 
                                    CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </div>
                        </div>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div class="container-fluid">
                            <div class="form-group">
                                <label for="ProductIDTextBox">Book ID:</label>
                                <asp:RequiredFieldValidator ID="rfvBookId" runat="server" Display="Dynamic" 
                                    ControlToValidate="BookIdTextBox" CssClass="text-danger"
                                    ErrorMessage="ProductID is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="BookIdTextBox" runat="server" 
                                    Text='<%# Bind("Book_Id") %>' Width="500px" CssClass="form-control" />  
                            </div>
                            <div class="form-group">
                                <label for="NameTextBox">Book Name:</label>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" Display="Dynamic" 
                                    ControlToValidate="NameTextBox" CssClass="text-danger"
                                    ErrorMessage="Book Name is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="NameTextBox" runat="server" 
                                    Text='<%# Bind("Book_Name") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="DescriptionTextBox">Description:</label>
                                <asp:RequiredFieldValidator ID="rfvDesc" runat="server" 
                                    ControlToValidate="DescriptionTextBox" CssClass="text-danger" Display="Dynamic"
                                    ErrorMessage="Description is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                                    Text='<%# Bind("Description") %>' CssClass="form-control" />
                            </div>
                           
                            <div class="form-group">
                                <label for="ddlCategory">Category:</label>
                                <asp:DropDownList runat="server" ID="ddlCategory" 
                                    DataSourceID="SqlDataSource3" DataTextField="Genre_Name" 
                                    DataValueField="Genre_Name" SelectedValue='<%# Bind("Genre_Name") %>' 
                                    CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="ImageFileTextBox">Image File:</label>
                                <asp:TextBox ID="ImageFileTextBox" runat="server" 
                                    Text='<%# Bind("Book_Image") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="UnitPriceTextBox">Price:</label>
                                <asp:RequiredFieldValidator ID="rfvPrice" runat="server" Display="Dynamic"  
                                    ControlToValidate="PriceTextBox" CssClass="text-danger"
                                    ErrorMessage="Price is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvPrice" runat="server" Display="Dynamic" 
                                    ControlToValidate="PriceTextBox" Type="Double" Operator="GreaterThan" 
                                    ErrorMessage="Price must be a number greater than zero." Text="*" 
                                    CssClass="text-danger" ValueToCompare="0.00"></asp:CompareValidator>
                                <asp:TextBox ID="PriceTextBox" runat="server" 
                                    Text='<%# Bind("Price") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="AuthorTextBox">Author:</label>
                                <asp:RequiredFieldValidator ID="rfvAuthor" runat="server" Display="Dynamic" 
                                    ControlToValidate="AuthorTextBox" CssClass="text-danger"
                                    ErrorMessage="Author is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="AuthorTextBox" runat="server" 
                                    Text='<%# Bind("Author") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                    CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </div>
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <div class="list-group">
                            <div class="list-group-item bg-halloween">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <b><asp:Label ID="NameLabel" runat="server" 
                                            Text='<%# Bind("Book_Name") %>' /></b>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:Label ID="UnitPriceLabel" runat="server" 
                                            Text='<%# Bind("Price", "{0:c}") %>' /> each
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <asp:Label ID="ShortDescriptionLabel" runat="server" 
                                    Text='<%# Bind("Description") %>' />
                            </div>
                        </div>

                        <table class="table table-bordered">
                            <thead class="bg-halloween">
                                <tr>
                                    <th>Product ID</th>
                                    <th>Author</th>
                                    <th>Category</th>
                                    <th>Image File</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><asp:Label ID="ProductIDLabel" runat="server" 
                                        Text='<%# Eval("Book_Id") %>' /></td>
                                    <td><asp:Label ID="OnHandLabel" runat="server" 
                                        Text='<%# Bind("Author") %>' /></td>
                                    <td><asp:Label ID="CategoryIDLabel" runat="server" 
                                        Text='<%# Bind("Genre_Name") %>' /></td>
                                    <td><asp:Label ID="ImageFileLabel" runat="server" 
                                        Text='<%# Bind("Book_Image") %>' /></td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="list-group">
                            <div class="list-group-item">
                                <asp:LinkButton ID="EditButton" runat="server" 
                                    CausesValidation="False" CommandName="Edit" Text="Edit" />
                                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" 
                                    CausesValidation="False" CommandName="Delete" Text="Delete" />
                                &nbsp;<asp:LinkButton ID="NewButton" runat="server" 
                                    CausesValidation="False" CommandName="New" Text="New" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:FormView>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                   ConnectionString="<%$ ConnectionStrings:ConnectionString_BookStore %>" 
                    ConflictDetection="CompareAllValues" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT [Book_Id], [Book_Name], [Description], 
                            [Genre_Id], [Genre_Name], [Book_Image], 
                            [Price], [Author] 
                        FROM [Books] 
                        WHERE ([Book_Id] = @Book_Id)" 
                    DeleteCommand="DELETE FROM [Books] 
                        WHERE [Book_Id] = @original_Book_Id 
                          AND [Book_Name] = @original_Book_Name
                          AND [Description] LIKE  @original_Description
                          AND [Genre_Name] = @original_Genre_Name
                          AND (([Book_Image] = @original_Book_Image) 
                           OR ([Book_Image] IS NULL AND @original_Book_Image IS NULL))
                          AND [Price] = @original_Price 
                          AND [Author] = @original_Author" 
                    InsertCommand="INSERT INTO [Books] ([Book_Id], [Book_Name], 
                          [Description], [Genre_Name], 
                          [Book_Image], [Price], [Author]) 
                        VALUES (@Book_Id, @Book_Name, @Description, 
                         @Genre_Name, @Book_Image,  
                          @Price, @Author)" 
                    UpdateCommand="UPDATE [Books] SET [Book_Name] = @Book_Name, 
                          [Description] = @Description, 
                          [Genre_Name] = @Genre_Name, 
                          [Book_Image] = @Book_Image, 
                          [Price] = @Price, 
                          [Author] = @Author 
                        WHERE [Book_Id] = @original_Book_Id
                          AND [Book_Name] = @original_Book_Name
                          AND [Description] LIKE @original_Description 
                          AND [Genre_Name] = @original_Genre_Name 
                          AND (([Book_Image] = @original_Book_Image) 
                           OR ([Book_Image] IS NULL AND @original_Book_Image IS NULL))
                          AND [Price] = @original_Price
                          AND [Author] = @original_Author">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="grdProducts" Name="Book_Id" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_Book_Id" Type="String" />
                        <asp:Parameter Name="original_Book_Name" Type="String" />
                        <asp:Parameter Name="original_Description" Type="String" />
                        <asp:Parameter Name="original_Genre_Name" Type="String" />
                        <asp:Parameter Name="original_Book_Image" Type="String" />
                        <asp:Parameter Name="original_Price" Type="Decimal" />
                        <asp:Parameter Name="original_Author" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Book_Name" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Genre_Name" Type="String" />    
                        <asp:Parameter Name="Book_Image" Type="String" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="Author" Type="String" />
                        <asp:Parameter Name="original_Book_Id" Type="String" />
                        <asp:Parameter Name="original_Book_Name" Type="String" />
                        <asp:Parameter Name="original_Description" Type="String" />
                        <asp:Parameter Name="original_Genre_Name" Type="String" />
                        <asp:Parameter Name="original_Book_Image" Type="String" />
                        <asp:Parameter Name="original_Price" Type="Decimal" />
                        <asp:Parameter Name="original_Author" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Book_Id" Type="String" />
                        <asp:Parameter Name="Book_Name" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Genre_Name" Type="String" />
                        <asp:Parameter Name="Book_Image" Type="String" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="Author" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>  
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                   ConnectionString="<%$ ConnectionStrings:ConnectionString_BookStore %>" 
                    SelectCommand="SELECT [Genre_Id], [Genre_Name] 
                        FROM [Genre] ORDER BY [Genre_Name]">
                </asp:SqlDataSource> 
            </div>
        </div>
    </div>
</asp:Content>
