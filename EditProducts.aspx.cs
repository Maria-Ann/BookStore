using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnnMariaShaju_BookStore
{
    public partial class EditProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void grdProducts_PreRender(object sender, EventArgs e)
        {
            grdProducts.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void fvProduct_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            if (e.Values["Price"] != null)
                e.Values["Price"] = e.Values["Price"].ToString().Substring(1);
        }

        protected void fvProduct_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
                lblError.Text = ConcurrencyErrorMessage();
            else
                grdProducts.DataBind();
        }

        protected void fvProduct_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
                lblError.Text = ConcurrencyErrorMessage();
            else
                grdProducts.DataBind();
        }

        protected void fvProduct_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
            else
                grdProducts.DataBind();
        }

        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }
        private string ConcurrencyErrorMessage()
        {
            // Sample retry logic
            const int maxRetries = 3;
            int retries = 0;

            while (retries < maxRetries)
            {
                try
                {
                    break; // Exit loop if operation succeeds
                }
                catch (SqlException ex)
                {
                    if (ex.Number == 1205) // Deadlock error code
                    {
                        retries++; // Retry the operation
                                   // Optionally, add a delay before retrying to avoid immediate contention
                        System.Threading.Thread.Sleep(1000); // Wait for 1 second
                    }
                    else
                    {
                        // Handle other SQL exceptions
                        lblError.Text = DatabaseErrorMessage(ex.Message);
                        break;
                    }
                }
            }

            return "Another user may have updated that category. Please try again";
        }

    }
}