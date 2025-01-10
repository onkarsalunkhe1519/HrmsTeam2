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
    public partial class LeaveRequest : System.Web.UI.Page
    {
        
            private int totalLeaves = 24;
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            string email = Session["MyUser"].ToString();
            
            string query = "SELECT CL, PL, ML, SL FROM EmployeeLeaveBalances WHERE Email = @Email";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                SqlDataReader reader = cmd.ExecuteReader();

                int availableCL = 0, availablePL = 0, availableML = 0, availableSL = 0;
                if (reader.Read())
                {
                    availableCL = Convert.ToInt32(reader["CL"]);
                    availablePL = Convert.ToInt32(reader["PL"]);
                    availableML = Convert.ToInt32(reader["ML"]);
                    availableSL = Convert.ToInt32(reader["SL"]);
                    Label2.Text = availableCL.ToString();
                    Label3.Text = availablePL.ToString();
                    Label4.Text = availableML.ToString();
                    Label5.Text = availableSL.ToString();
                }
            }
            }

        protected void SubmitLeaveButton_Click(object sender, EventArgs e)
        {
            try
            {
                string leaveType = LeaveTypeDropDown.SelectedValue;
                DateTime startDate = DateTime.Parse(StartDateTextBox.Text);
                DateTime endDate = DateTime.Parse(EndDateTextBox.Text);
                string reason = ReasonTextBox.Text;
                string username = "user";
                string email = Session["MyUser"].ToString();

                if (startDate > endDate)
                {
                    LeaveStatusLabel.Text = "Invalid date range!";
                    return;
                }
                

                int leaveDays = 0;
                for (DateTime date = startDate; date <= endDate; date = date.AddDays(1))
                {
                    if (date.DayOfWeek != DayOfWeek.Saturday && date.DayOfWeek != DayOfWeek.Sunday)
                    {
                        leaveDays++;
                    }
                }

                string cs = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    conn.Open();

                    string query = "SELECT CL, PL, ML, SL FROM EmployeeLeaveBalances WHERE Email = @Email";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        SqlDataReader reader = cmd.ExecuteReader();

                        int availableCL = 0, availablePL = 0, availableML = 0, availableSL = 0;
                        if (reader.Read())
                        {
                            availableCL = Convert.ToInt32(reader["CL"]);
                            availablePL = Convert.ToInt32(reader["PL"]);
                            availableML = Convert.ToInt32(reader["ML"]);
                            availableSL = Convert.ToInt32(reader["SL"]);
                            Label2.Text = availableCL.ToString();
                            Label3.Text = availablePL.ToString();
                            Label4.Text = availableML.ToString();
                            Label5.Text = availableSL.ToString();
                        }
                        reader.Close();

                        int maxLeaveDays = 0;
                        if (leaveType == "CL")
                        {
                            maxLeaveDays = 2;
                        }
                        else if (leaveType == "PL")
                        {
                            maxLeaveDays = 18;
                        }
                        else if (leaveType == "SL")
                        {
                            maxLeaveDays = 2;
                        }
                        else if (leaveType == "ML")
                        {
                            maxLeaveDays = 2;
                        }
                        else
                        {
                            maxLeaveDays = 0;
                        }
                        
                        if (leaveDays > maxLeaveDays)
                        {
                            LeaveStatusLabel.Text = $"You can only request {maxLeaveDays} days for {leaveType}.";
                            Response.Write($"<script>alert('You are taking {leaveDays - maxLeaveDays} extra days for {leaveType} leave.');</script>");
                            string insertQuery = "exec sp_InsertLeaveRequest @Name, @Email, @LeaveType, @StartDate, @EndDate, @TotalDays, @Reason";
                            using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn))
                            {
                                insertCmd.Parameters.AddWithValue("@Name", username);
                                insertCmd.Parameters.AddWithValue("@Email", email);
                                insertCmd.Parameters.AddWithValue("@LeaveType", leaveType);
                                insertCmd.Parameters.AddWithValue("@StartDate", startDate);
                                insertCmd.Parameters.AddWithValue("@EndDate", endDate);
                                insertCmd.Parameters.AddWithValue("@TotalDays", leaveDays);
                                insertCmd.Parameters.AddWithValue("@Reason", reason);
                                insertCmd.ExecuteNonQuery();
                            }

                            totalLeaves -= leaveDays;
                           
                            LeaveStatusLabel.Text = "Leave request submitted successfully!";
                            Response.Write("<script>alert('Leave Requested Successfully')</script>");
                        }
                        

                        if (leaveDays > totalLeaves)
                        {
                            LeaveStatusLabel.Text = "Insufficient leave balance.";
                            return;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                LeaveStatusLabel.Text = $"Error: {ex.Message}";
                Response.Write($"<script>alert('Error: {ex.Message}')</script>");
            }
        }

    }
}
