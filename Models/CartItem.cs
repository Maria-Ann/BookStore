using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AnnMariaShaju_BookStore.Models
{
    public class CartItem
    {
        public CartItem() { }

        public CartItem(Book book, int quantity)
        {
            this.Book = book;
            this.Quantity = quantity;
        }

        public Book Book { get; set; }
        public int Quantity { get; set; }

        public void AddQuantity(int quantity)
        {
            this.Quantity += quantity;
        }

        public string Display()
        {
            string displayString = string.Format("{0} ({1} at {2})",
                Book.Book_Name,
                Quantity.ToString(),
                Book.Price.ToString("c")
            );
            return displayString;
        }
    }

}