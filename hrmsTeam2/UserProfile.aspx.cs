using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrmsTeam2
{
    public partial class UserProfile : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            conn.Open();
            if (!IsPostBack)
            {
                LoadUserData();
                loadfile();
            }


        }

        private void LoadUserData()
        {
            string userEmail = Session["MyUser"].ToString();
            string query = $"SELECT UserName, UserEmail, ContactNo, EContact, PasswordHash, UserRole, UserStatus, UserImg FROM UserRegistration WHERE UserEmail = '{userEmail}'";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                txtUsername.Text = reader["Username"].ToString();
                txtEmail.Text = reader["UserEmail"].ToString();
                txtContact.Text = reader["ContactNo"].ToString();
                txtEContact.Text = reader["EContact"].ToString();
                
                txtRole.Text = reader["UserRole"].ToString();
                txtStatus.Text = reader["UserStatus"].ToString();

                // Set profile picture
                string imgPath = reader["UserImg"].ToString();
                if (!string.IsNullOrEmpty(imgPath))
                {
                    imgProfile.ImageUrl = imgPath;
                }
                else
                {
                    imgProfile.ImageUrl = "~/Images/default-profile.png"; // Default image if no user image exists
                }
            }
            reader.Close();
        }
        protected void btnUploadProfilePic_Click(object sender, EventArgs e)
        {
            if (FileUploadProfile.HasFile)
            {
                string userEmail = Session["MyUser"].ToString();
                string folderPath = Server.MapPath("~/ProfilePictures/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string fileName = $"{Path.GetFileNameWithoutExtension(FileUploadProfile.FileName)}_{DateTime.Now.Ticks}{Path.GetExtension(FileUploadProfile.FileName)}";
                string relativePath = "~/ProfilePictures/" + fileName;
                string fullPath = folderPath + fileName;

                // Save the uploaded file
                FileUploadProfile.SaveAs(fullPath);

                // Update the database with the new image path
                string query = $"UPDATE UserRegistration SET UserImg = '{relativePath}' WHERE UserEmail = '{userEmail}'";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();

                // Reload user data including EContact
                LoadUserData();

                // Show success message
                Response.Write("<script>alert('Profile picture updated successfully!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Please select an image to upload.');</script>");
            }
        }





        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string userEmail = Session["MyUser"].ToString();
            string query = $@"
        UPDATE UserRegistration 
        SET 
            Username = '{txtUsername.Text}', 
            ContactNo = '{txtContact.Text}', 
            EContact = '{txtEContact.Text}' 
             
        WHERE 
            UserEmail = '{userEmail}'";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();

            // Reload the updated data
            LoadUserData();

            // Show success message
            Response.Write("<script>alert('Profile updated successfully!');</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string userEmail = Session["MyUser"].ToString();
            string doctype = DropDownList1.SelectedValue;
            string folderpath = Server.MapPath("~/UploadedFiles/");
            if (!Directory.Exists(folderpath))
            {
                Directory.CreateDirectory(folderpath);
            }
            string fileName = $"{doctype}_{userEmail}_{Path.GetFileName(FileUpload1.FileName)}";
            string relativePath = "~/UploadedFiles/" + fileName;
            string filepath = folderpath + fileName;
            FileUpload1.SaveAs(filepath);


            string q = $"exec DocumentInsertTask4 '{userEmail}','{doctype}','{fileName}','{relativePath}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            loadfile();

        }
        public void loadfile()
        {
            string userEmail = Session["MyUser"].ToString();
            string query = $"SELECT * FROM Documents where Email='{userEmail}'";
            SqlCommand c = new SqlCommand(query, conn);
            SqlDataReader r = c.ExecuteReader();
            GridView1.DataSource = r;
            GridView1.DataBind();

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label l1 = GridView1.Rows[e.RowIndex].FindControl("Label3") as Label;
            int pid = int.Parse(l1.Text);
            string q = $"exec deletedoctask3 {pid}";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            loadfile();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            loadfile();

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                string argument = e.CommandArgument.ToString();
                int fileId = int.Parse(argument);
                string q = $"exec FetchDoconkar {fileId}";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    string filePath = rdr["FilePath"].ToString();
                    string serverPath = Server.MapPath(filePath);

                    if (File.Exists(serverPath))
                    {
                        byte[] fileData = File.ReadAllBytes(serverPath);
                        string fileName = Path.GetFileName(filePath);

                        Response.ContentType = "application/octet-stream";
                        Response.AddHeader("Content-Disposition", $"attachment; filename={fileName}");
                        Response.BinaryWrite(fileData);
                        Response.End();
                    }
                }
            }
        }
    }
}