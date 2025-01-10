using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrmsTeam2
{
    public partial class DashboardUser : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MyUser"] == null)
            {
                
                Response.Redirect("~/Login.aspx");
            }
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            conn.Open();
            string q = "select count(UserEmail) as usercount from UserRegistration";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            int usercount = int.Parse(rdr["usercount"].ToString());
            Label1.Text = usercount.ToString();


        }
    }
}