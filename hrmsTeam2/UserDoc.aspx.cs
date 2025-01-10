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
    public partial class UserDoc : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            conn.Open();
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
        public void loadfile()
        {
            string userEmail = Session["MyUser"].ToString();
            

            string  query = "SELECT * FROM Documents"; // Admin sees all documents
            

            try
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (!reader.HasRows)
                {
                    Response.Write("<script>alert('No documents found for the current user.');</script>");
                }

                GridView1.DataSource = reader;
                GridView1.DataBind();
                reader.Close();
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error loading documents: {ex.Message}');</script>");
            }
        }

    }
}