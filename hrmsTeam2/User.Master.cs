using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrmsTeam2
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MyUser"] == null)
            {
                // If not logged in, hide the Logout button
                Button1.Visible = false;
            }
            else
            {
                // If logged in, show the Logout button
                Button1.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["MyUser"]=null;
            Response.Redirect("Login.aspx");
        }
    }
}