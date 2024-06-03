using AnnMariaShaju_BookStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnnMariaShaju_BookStore
{
    public partial class Confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var customer = (Customer)Session["Customer"];

            //string message =
            //    "Contact information\n" +
            //    "    Email: " + customer.EmailAddress + "\n" +
            //    "    First name: " + customer.FirstName + "\n" +
            //    "    Last name: " + customer.LastName + "\n" +
            //    "    Phone number: " + customer.Phone + "\n" +
            //    "Billing address\n" +
            //    "    Address: " + customer.Address + "\n" +
            //    "    City: " + customer.City + "\n" +
            //    "    State: " + customer.State + "\n" +
            //    "    Zip code: " + customer.Zip + "\n" +
            //    "Card Details\n" +
            //    "    Address: " + customer.ShippingAddress + "\n" +
            //    "    City: " + customer.ShippingCity + "\n" +
            //    "    State: " + customer.ShippingState + "\n" +
            //    "    Zip code: " + customer.ShippingZip + "\n";

            //txtData.Text = message;

            lblEmail.Text           = customer.EmailAddress;
            lblFirstName.Text       = customer.FirstName;
            lblLastName.Text        = customer.LastName;
            lblPhoneNumber.Text     = customer.Phone;

            lblAddress.Text         = customer.Address;
            lblCity.Text            = customer.City;
            lblState.Text           = customer.State;
            lblZipCode.Text         = customer.Zip;

        }
    }
}