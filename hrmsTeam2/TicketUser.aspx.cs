using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrmsTeam2
{
    public partial class TicketUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblEmail.Text = Session["MyUser"]?.ToString();
                BindTickets();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = Session["MyUser"].ToString();
            string query = txtQuery.Text.Trim();

            // Check if Subject Query is empty
            if (string.IsNullOrEmpty(query))
            {
                lblError.Text = "Please enter a subject query before submitting.";
                return;
            }

            // Connection string
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(cs))
            {
                // SQL query to insert ticket with "Unresolved" status
                string sql = "INSERT INTO Tickets (Email, SubjectQuery, Status) VALUES (@Email, @Query, 'Unresolved')";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Query", query);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblError.Text = "";  // Clear error message if successful
                }
                catch (Exception ex)
                {
                    lblError.Text = "An error occurred while raising the ticket. Please try again.";
                    // Optionally, log the exception here
                }
            }

            // Refresh the ticket grid and clear the query textbox
            BindTickets();
            txtQuery.Text = string.Empty;
        }

        private void BindTickets()
        {
            string email = Session["MyUser"].ToString();
            string cs = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(cs))
            {
                string sql = "SELECT TicketID, Email, SubjectQuery, DateCreated, Status FROM Tickets WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@Email", email);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvTickets.DataSource = dt;
                gvTickets.DataBind();
            }
        }
    }
}