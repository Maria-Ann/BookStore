using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AnnMariaShaju_BookStore.Models
{
    public class Book
    {
        public string Book_Id { get; set; }
        public string Book_Name { get; set; }
        public string Author { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public string Genre_Id { get; set; }
        public string Book_Image { get; set; }

    }
}