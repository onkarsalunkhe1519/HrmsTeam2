using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrmsTeam2
{
    public partial class Events : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            conn.Open();
            if (!IsPostBack)
            {
                LoadEvents();
            }
            TextBox2.Enabled = false;
            TextBox3.Enabled = false;

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "Holiday")
            {
                TextBox2.Enabled = false;
                TextBox3.Enabled = false;
            }
            else
            {
                TextBox2.Enabled = true;
                TextBox3.Enabled = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string EventName = TextBox1.Text;
            string EventType = DropDownList1.SelectedValue;
            string Name = null;
            string Email = null;
            string StartDate;
            string EndDate;
            if (EventType=="Birthday")
            {
                Name = TextBox2.Text;
                Email = TextBox3.Text;
                StartDate=TextBox4.Text.ToString();
                EndDate= TextBox5.Text.ToString();
                string q = $"Insert into Events values('{Name}','{Email}','{EventName}','{EventType}','{StartDate}','{EndDate}')";
                SqlCommand cmd=new SqlCommand(q,conn);
                cmd.ExecuteNonQuery();

            }
            else
            {
                StartDate = TextBox4.Text.ToString();
                EndDate = TextBox5.Text.ToString();
                string q = $"Insert into Events values('{Name}','{Email}','{EventName}','{EventType}','{StartDate}','{EndDate}')";
                SqlCommand cmd = new SqlCommand(q, conn);
                cmd.ExecuteNonQuery();
            }
            LoadEvents();
        }
        private void LoadEvents()
        {
            string query = "SELECT Eid, EventName, EventType, StartDate, EndDate FROM Events";
            SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int eventId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            string query = "DELETE FROM Events WHERE Eid = @Eid";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Eid", eventId);

            cmd.ExecuteNonQuery();

            // Reload the events after deletion
            LoadEvents();
        }
    }
}