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
    public partial class PayslipUser : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            conn.Open();
            Button1.Visible = false;
            Button2.Visible = false;
            Button3.Visible = false;
            Button4.Visible = false;

        }

        protected void DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Email = Session["MyUser"].ToString();// session
            string selectedMonth = DropDownList3.SelectedValue;
            string selectedYear = DropDownList4.SelectedValue;
            FetchPayslipData(Email,selectedMonth, int.Parse(selectedYear));
            FetchForm16Data(Email, int.Parse(selectedYear));
        }

        
        public void FetchPayslipData(string Email, string month, int year)
        {
            string q = $"exec FetchPayslip '{Email}','{month}','{year}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            SqlDataReader r = cmd.ExecuteReader();

            if (r.Read())
            {
                string Payslip=r["PayslipPath"].ToString();
                Label1.Text = "Payslip for " + month + " " + year;
                Button1.Visible = true;
                Button2.Visible = true;
                Button2.Enabled = true;
            }
            else
            {
                Label1.Text = "No payslip available.";
                

                Button1.Visible = false;
                Button2.Visible = false;
                
            }
        }
        

        public void FetchForm16Data(string Email, int year)
        {
            string q = $"exec FetchForm16 '{Email}', {year}";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader r = cmd.ExecuteReader();

            if (r.Read())
            {
                string form16Path = r["Form16Path"].ToString();
                Label2.Text = "Form 16 for " + year;
                Button3.Visible = true; // View Form 16
                Button4.Visible = true; // Download Form 16
                Button4.Enabled = true;
            }
            else
            {
                Label2.Text = "No Form 16 available.";
                Button3.Visible = false;
                Button4.Visible = false;
            }

            r.Close();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string Email = Session["MyUser"].ToString(); 
            string selectedMonth = DropDownList3.SelectedValue;
            string selectedYear = DropDownList4.SelectedValue;
            string q = $"exec FetchPayslip '{Email}','{selectedMonth}','{selectedYear}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader r = cmd.ExecuteReader();
            if (r.Read())
            {
                string payslipPath = r["PayslipPath"].ToString();
                Response.Redirect(payslipPath);
                
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string Email = Session["MyUser"].ToString(); 
            string selectedMonth = DropDownList3.SelectedValue;
            string selectedYear = DropDownList4.SelectedValue;
            string q = $"exec FetchPayslip '{Email}','{selectedMonth}','{selectedYear}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader r = cmd.ExecuteReader();
            if (r.Read())
            {
                string payslipPath = r["PayslipPath"].ToString();
                string fileName = System.IO.Path.GetFileName(payslipPath);
                string fileFullPath = Server.MapPath(payslipPath);
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.TransmitFile(fileFullPath);
                Response.End();
            }
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string Email = Session["MyUser"].ToString();
            string selectedMonth = DropDownList3.SelectedValue;
            string selectedYear = DropDownList4.SelectedValue;
            string q = $"exec FetchForm16 '{Email}','{selectedYear}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader r = cmd.ExecuteReader();
            if (r.Read())
            {
                string Form16Path = r["Form16Path"].ToString();
                Response.Redirect(Form16Path);

            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string Email = Session["MyUser"].ToString();
            
            string selectedYear = DropDownList4.SelectedValue;
            string q = $"exec FetchForm16 '{Email}','{selectedYear}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader r = cmd.ExecuteReader();
            if (r.Read())
            {
                string Form16Path = r["Form16Path"].ToString();
                string fileName = System.IO.Path.GetFileName(Form16Path);
                string fileFullPath = Server.MapPath(Form16Path);
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.TransmitFile(fileFullPath);
                Response.End();
            }
        }
    }
}