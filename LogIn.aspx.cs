using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnnMariaShaju_BookStore
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string firstName = txtFirstName.Text;
                string lastName = txtLastName.Text;
                Session["FirstName"] = firstName;
                Session["LastName"] = lastName;
                Response.Redirect("~/Products.aspx");
            }
        }
    }
}