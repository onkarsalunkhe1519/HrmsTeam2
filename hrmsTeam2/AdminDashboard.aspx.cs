using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace hrmsTeam2
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MyUser"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            // Initialize the connection
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            conn.Open();

            // Fetch and display active user count
            FetchActiveUserCount();

            // Fetch and display attendance data
            FetchAttendanceData();

            // Fetch and display leave status counts
            FetchLeaveStatusCounts();
        }

        private void FetchActiveUserCount()
        {
            string query = "SELECT COUNT(UserEmail) AS UserCount FROM UserRegistration WHERE UserStatus='Active'";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    int userCount = int.Parse(rdr["UserCount"].ToString());
                    Label1.Text = "Active Users: " + userCount.ToString();
                }
                rdr.Close();
            }
        }

        private void FetchAttendanceData()
        {
            using (SqlCommand cmd = new SqlCommand("GetMonthlyAttendanceSummary", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    int presentDays = int.Parse(rdr["TotalPresentDays"].ToString());
                    int absentDays = int.Parse(rdr["TotalAbsentDays"].ToString());
                    int halfDays = int.Parse(rdr["TotalHalfDays"].ToString());

                    PresentDaysLabel.Text = "Present Days: " + presentDays.ToString();
                    AbsentDaysLabel.Text = "Absent Days: " + absentDays.ToString();
                    HalfDaysLabel.Text = "Half Days: " + halfDays.ToString();
                }
                rdr.Close();
            }
        }

        private void FetchLeaveStatusCounts()
        {
            using (SqlCommand cmd = new SqlCommand("GetLeaveStatusCounts", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = cmd.ExecuteReader();

                int approvedCount = 0;
                int rejectedCount = 0;

                while (rdr.Read())
                {
                    string status = rdr["LeaveStatus"].ToString();
                    int count = int.Parse(rdr["LeaveCount"].ToString());

                    if (status == "Approved")
                        approvedCount = count;
                    else if (status == "Rejected")
                        rejectedCount = count;
                }
                rdr.Close();

                // Pass data to JavaScript for frontend chart rendering
                string script = $@"
                var leaveData = {{
                    approved: {approvedCount},
                    rejected: {rejectedCount}
                }};
                ";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ChartData", script, true);

                
            }
        }
    }
}
