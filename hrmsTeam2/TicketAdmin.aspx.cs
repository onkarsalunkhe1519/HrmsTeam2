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
    public partial class TicketAdmin : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            conn = new SqlConnection(cs);

            if (!IsPostBack)
            {
                BindTickets();
            }
        }

        private void BindTickets()
        {
            using (SqlCommand cmd = new SqlCommand("GetTicketsWithAssignedBy", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvAdminTickets.DataSource = dt;
                gvAdminTickets.DataBind();
            }
        }

        protected void btnReply_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int ticketID = Convert.ToInt32(btn.CommandArgument);

            hfTicketID.Value = ticketID.ToString();
            pnlSolution.Visible = true;
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string solution = txtSolution.Text.Trim();

            // Validate that the solution is not empty
            if (string.IsNullOrEmpty(solution))
            {
                lblError.Text = "Please provide a solution before sending.";  // Error message display
                lblError.ForeColor = System.Drawing.Color.Red;
                return;
            }

            int ticketID = Convert.ToInt32(hfTicketID.Value);
            string resolvedBy = "Admin"; // Replace with logged-in admin username

            using (SqlCommand cmd = new SqlCommand("updateTicketSolution", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TicketID", ticketID);
                cmd.Parameters.AddWithValue("@Solution", solution);
                cmd.Parameters.AddWithValue("@ResolvedBy", resolvedBy);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                catch (Exception ex)
                {
                    lblError.Text = "An error occurred while submitting the solution. Please try again."; // Error message
                }
            }

            pnlSolution.Visible = false;
            BindTickets();
        }
    }
}