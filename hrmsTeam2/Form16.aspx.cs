using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrmsTeam2
{
    public partial class Form16 : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

            if (!IsPostBack) // Ensure this runs only once on initial page load
            {
                PopulateUserEmails();
            }
        }

        private void PopulateUserEmails()
        {
            try
            {
                conn.Open();
                string query = "SELECT UserEmail FROM UserRegistration WHERE UserStatus = 'Active'";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                DropDownListEmails.Items.Clear(); // Clear existing items
                DropDownListEmails.Items.Add(new ListItem("-- Select Email --", "")); // Default option

                while (reader.Read())
                {
                    string email = reader["UserEmail"].ToString();
                    DropDownListEmails.Items.Add(new ListItem(email, email));
                }

                reader.Close();
            }
            catch (Exception ex)
            {
                // Handle exception (e.g., log it)
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
            finally
            {
                conn.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string email = DropDownListEmails.SelectedValue; // Get selected email from dropdown
            int year = int.Parse(DropDownList4.SelectedValue);
            string relativeFolderPath = "~/From16/";
            string absoluteFolderPath = Server.MapPath(relativeFolderPath);
            if (!Directory.Exists(absoluteFolderPath))
            {
                Directory.CreateDirectory(absoluteFolderPath);
            }
            string fileExtension = Path.GetExtension(FileUpload1.FileName);
            string fileName = $"{email}_{year}_Form16{fileExtension}";
            string relativeFilePath = relativeFolderPath + fileName;
            string absoluteFilePath = Server.MapPath(relativeFilePath);
            FileUpload1.SaveAs(absoluteFilePath);
            string query = $"exec InsertFrom16 '{email}', '{year}', '{relativeFilePath}'";
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Write("<script>alert('File uploaded successfully!');</script>");
        }
    }
}
