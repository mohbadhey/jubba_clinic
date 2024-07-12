using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace juba_hospital
{
    public partial class doctor : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                // Redirect to the login page (assuming the login page URL is "login.aspx")
                Response.Redirect("login.aspx");
            }
            else
            {
                // Set the text of Label1 to the value of the std_id session variable
                Label1.Text = (string)Session["UserId"];
                label2.Text = (string)Session["id"];
                


            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            // Clear the session
            Session.Clear();
            Session.Abandon();
            // Redirect to login page
            Response.Redirect("login.aspx");
        }

    }
}