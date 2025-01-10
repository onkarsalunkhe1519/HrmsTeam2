using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrmsTeam2
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text, email = TextBox2.Text, contact = TextBox3.Text, password = TextBox4.Text;
            string urole = "User", status = "Active", uimg = null; // Initialize uimg to null
            string hashPassword = HashPassword(password);

            if (FileUpload1.HasFile)
            {
                string fileExtension = Path.GetExtension(FileUpload1.FileName).ToLower();
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };

                if (allowedExtensions.Contains(fileExtension))
                {
                    // Generate a unique filename to avoid conflicts
                    string fileName = Guid.NewGuid().ToString() + fileExtension;

                    // Get the directory and ensure it exists
                    string directoryPath = Server.MapPath("ProfilePhoto/");
                    if (!Directory.Exists(directoryPath))
                    {
                        Directory.CreateDirectory(directoryPath);
                    }

                    // Save the file to the server
                    string savePath = Path.Combine(directoryPath, fileName);
                    FileUpload1.SaveAs(savePath);

                    // Set the image path for storage in the database
                    uimg = "ProfilePhoto/" + fileName;
                }
                else
                {
                    Response.Write("<script>alert('Only image files (.jpg, .jpeg, .png, .gif) are allowed.');</script>");
                    return; // Exit early if invalid file extension
                }
            }
            else
            {
                Response.Write("<script>alert('Please upload an image.');</script>");
                return; // Exit early if no file is uploaded
            }

            // Check if the user already exists
            string qf = $"exec FindExistingUser '{email}'";
            SqlCommand command = new SqlCommand(qf, conn);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                Response.Write("<script>alert('User already exists.');</script>");
            }
            else
            {
                reader.Close(); // Close the reader before executing another command

                // Insert the new user into the database
                string q = $"exec SignUp '{name}', '{email}', '{contact}', '{hashPassword}', '{urole}', '{status}', '{uimg}'";
                SqlCommand cmd = new SqlCommand(q, conn);
                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('User registered successfully.');</script>");
            }
        }


        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2")); // Convert to hexadecimal
                }
                return builder.ToString();
            }
        }
    }
}