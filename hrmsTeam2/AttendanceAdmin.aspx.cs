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
    public partial class AttendanceAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAttendanceData();
            }
        }

        private void LoadAttendanceData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Load monthly summary data
                DataTable monthlyData = new DataTable();
                using (SqlCommand cmd = new SqlCommand("GetMonthlyAttendance", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(monthlyData);
                }

                // Bind data to GridView
                GridView1.DataSource = monthlyData;
                GridView1.DataBind();

                // Update Payrolls table with attendance data
                UpdatePayrollsTable(monthlyData, conn);
            }
        }

        private void UpdatePayrollsTable(DataTable monthlyData, SqlConnection conn)
        {
            foreach (DataRow row in monthlyData.Rows)
            {
                string name = row["Name"].ToString();
                int presentDays = Convert.ToInt32(row["PresentDays"]);
                int absentDays = Convert.ToInt32(row["AbsentDays"]);
                int halfDays = Convert.ToInt32(row["HalfDays"]);

                using (SqlCommand updateCmd = new SqlCommand("UPDATE Payrolls SET PresentDays = @PresentDays, AbsentDays = @AbsentDays, HalfDays = @HalfDays WHERE Email = @Name", conn))
                {
                    updateCmd.Parameters.AddWithValue("@Name", name);
                    updateCmd.Parameters.AddWithValue("@PresentDays", presentDays);
                    updateCmd.Parameters.AddWithValue("@AbsentDays", absentDays);
                    updateCmd.Parameters.AddWithValue("@HalfDays", halfDays);

                    updateCmd.ExecuteNonQuery();
                }
            }
        }
    }
}
