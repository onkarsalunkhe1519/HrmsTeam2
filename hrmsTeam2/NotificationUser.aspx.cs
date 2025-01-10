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
    public partial class NotificationUser : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNotifications();
            }
        }

        private void LoadNotifications()
        {
            string cs = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            conn = new SqlConnection(cs);

            string userEmail = Session["MyUser"].ToString(); // Current logged-in user
            SqlCommand cmd = new SqlCommand(
                "SELECT TOP 5 * FROM Notification WHERE Email = @Email ORDER BY NotificationDate DESC",
                conn
            );
            cmd.Parameters.AddWithValue("@Email", userEmail);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            notificationRepeater.DataSource = reader;
            notificationRepeater.DataBind();
            conn.Close();
        }
    }
}