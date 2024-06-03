using AnnMariaShaju_BookStore.Models;
using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnnMariaShaju_BookStore
{
    public partial class CheckOut : System.Web.UI.Page
    {
        private Customer customer;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                customer = (Customer)Session["Customer"];
                LoadCustomerData();
            }
        }
        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                GetCustomerData();
                var url = FriendlyUrl.Href("~/Confirm");
                Response.Redirect(url);
                //Response.Redirect("~/Confirm.aspx");
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("Cart");
            Session.Remove("Customer");
            var url = FriendlyUrl.Href("~/Products");
            Response.Redirect(url);
            //Response.Redirect("~/Products.aspx");
        }
        private void LoadCustomerData()
        {
            if (customer != null)
            {
                txtFirstName.Text           = customer.FirstName;
                txtLastName.Text            = customer.LastName;
                txtEmail.Text               = customer.EmailAddress;
                txtPhone.Text               = customer.Phone;
                txtAddress.Text             = customer.Address;
                txtCity.Text                = customer.City;
                txtZip.Text                 = customer.Zip;
                ddlState.SelectedValue      = customer.State;
                txtNameOnCard.Text          = customer.NameOnCard;
                txtCardNo.Text              = customer.CardNo;
                txtExpDate.Text             = customer.CardExpiryDate;
                txtCVV.Text                 = customer.CVV;
            }
        }
        private void GetCustomerData()
        {
            if (customer == null) customer = new Customer();
            customer.FirstName      = txtFirstName.Text;
            customer.LastName       = txtLastName.Text;
            customer.EmailAddress   = txtEmail.Text;
            customer.Phone          = txtPhone.Text;
            customer.Address        = txtAddress.Text;
            customer.City           = txtCity.Text;
            customer.State          = ddlState.SelectedValue;
            customer.Zip            = txtZip.Text;
            customer.NameOnCard     = txtNameOnCard.Text;
            customer.CardNo         = txtCardNo.Text;
            customer.CardExpiryDate = txtExpDate.Text;
            customer.CVV            = txtCVV.Text;
            Session["Customer"] = customer;
        }
    }
}