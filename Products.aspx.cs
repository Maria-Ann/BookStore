using AnnMariaShaju_BookStore.Models;
using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Data;
using System.Diagnostics;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnnMariaShaju_BookStore
{
    public partial class Products : System.Web.UI.Page
    {
        private Genre selectedGenre;
        private Book selectedBook;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["FirstName"] !=null)
                {
                    lblWelcome.Text = "Welcome Back , " + Session["FirstName"].ToString()+"!";
                }
                ddlGenres.DataBind();
                ddlBooks.DataBind();
            }

            selectedGenre = this.GetSelectedGenre();
           
            selectedBook = this.GetSelectedBook();
            if (selectedBook != null)
            {
                lblName.Text = selectedBook.Book_Name;
                lblAuthor.Text = selectedBook.Author;
                lblDescription.Text = selectedBook.Description;
                lblPrice.Text = "Price: " + selectedBook.Price.ToString("c");
                imgProduct.ImageUrl = "Images/" + selectedBook.Book_Image.Trim();
            }
        }

        protected void ddlGenres_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlBooks.DataBind(); 

            selectedGenre = this.GetSelectedGenre();
            selectedBook = this.GetSelectedBook();

            if (selectedBook != null)
            {
                lblName.Text = selectedBook.Book_Name;
                lblAuthor.Text = selectedBook.Author;
                lblDescription.Text = selectedBook.Description;
                lblPrice.Text = "Price: " + selectedBook.Price.ToString("c");
                imgProduct.ImageUrl = "Images/" + selectedBook.Book_Image.Trim();
            }
        }

        protected void ddlBooks_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedBook = this.GetSelectedBook();

            if (selectedBook != null)
            {
                lblName.Text = selectedBook.Book_Name;
                lblAuthor.Text = selectedBook.Author;
                lblDescription.Text = selectedBook.Description;
                lblPrice.Text = "Price: " + selectedBook.Price.ToString("c");
                imgProduct.ImageUrl = "Images/" + selectedBook.Book_Image.Trim();
            }
        }
        protected Genre GetSelectedGenre()
        {
            int genreId;
            if (int.TryParse(ddlGenres.SelectedValue, out genreId))
            {
                DataView genreTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                genreTable.RowFilter = "Genre_Id = " + genreId;
                if (genreTable.Count > 0)
                {
                    DataRowView row = genreTable[0];
                    Genre g = new Genre();
                    g.Genre_Id = (int)row["Genre_Id"];
                    g.Genre_Name = row["Genre_name"].ToString();
                    return g;
                }
            }
            return null;
        }

        protected Book GetSelectedBook()
        {
            int bookId;
            if (int.TryParse(ddlBooks.SelectedValue, out bookId))
            {
                DataView bookTable = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                bookTable.RowFilter = "Book_Id = " + bookId;
                if (bookTable.Count > 0)
                {
                    DataRowView row = bookTable[0];
                    Book b = new Book();
                    b.Book_Id = row["Book_Id"].ToString();
                    b.Book_Name = row["Book_Name"].ToString();
                    b.Author    = row["Author"].ToString();
                    b.Description = row["Description"].ToString();
                    string priceString = row["Price"].ToString();
                    decimal price;

                    if (decimal.TryParse(priceString, out price))
                    {
                        b.Price = price;
                    }
                    b.Book_Image = row["Book_Image"].ToString();
                    return b;
                }
            }
            return null;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Console.WriteLine("btnAdd clicked");
            if (Page.IsValid)
            {
               
                CartItemList cart = CartItemList.GetCart();
                CartItem cartItem = cart[selectedBook.Book_Id];

                if (cartItem == null)
                {
                    cart.AddItem(selectedBook,Convert.ToInt32(txtQuantity.Text));
                }
                else
                {
                    cartItem.AddQuantity(Convert.ToInt32(txtQuantity.Text));
                  
                }
                var url = FriendlyUrl.Href("~/Cart");
                Response.Redirect(url);
            }
        }
    }
}
