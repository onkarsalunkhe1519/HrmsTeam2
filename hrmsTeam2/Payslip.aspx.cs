using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text.pdf;
using iTextSharp.text;
using iTextSharp.tool.xml;

namespace hrmsTeam2
{
    public partial class Payslip : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            conn=new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            conn.Open();

            Button2.Enabled = false;
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string FetchEmail=TextBox1.Text;
            string FetchMonth = DropDownList3.SelectedValue;
            int FetchYear = int.Parse(DropDownList4.SelectedValue);
            string q = $"exec PayrollFetchByID '{FetchEmail}','{FetchMonth}','{FetchYear}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            if (rdr.Read())
            {
                Button2.Enabled = true;
                string Name = rdr["Name"].ToString();
                Label1.Text = Name;
                string Email = rdr["Email"].ToString();
                Label2.Text = Email;
                double BasicSalary = double.Parse(rdr["BasicSalary"].ToString());
                Label3.Text = BasicSalary.ToString();
                int PresentDays = int.Parse(rdr["PresentDays"].ToString());
                Label4.Text = PresentDays.ToString();
                int AbsentDays = int.Parse(rdr["AbsentDays"].ToString());
                Label5.Text = AbsentDays.ToString();
                int HalfDays = int.Parse(rdr["HalfDays"].ToString());
                Label6.Text = HalfDays.ToString();
                
                
                 
                if (FetchMonth=="January"|| FetchMonth == "March"|| FetchMonth == "May" || FetchMonth == "July" || FetchMonth == "August" || FetchMonth == "October" || FetchMonth == "December")
                {
                    int totalDaysInMonth = 31;
                    double dailySalary = BasicSalary / totalDaysInMonth;
                    double absentDeduction = AbsentDays * dailySalary;
                    double halfDayDeduction = HalfDays * (dailySalary / 2);
                    double NetPay = BasicSalary - absentDeduction - halfDayDeduction;
                    Label7.Text = NetPay.ToString("F2");
                    string q1 = $"exec UpdateNetPay '{NetPay}','{Email}','{FetchMonth}','{FetchYear}'";
                    SqlCommand cmd1 = new SqlCommand(q1, conn);
                    cmd1.ExecuteNonQuery();
                }
                if(FetchMonth == "April" || FetchMonth == "June" || FetchMonth == "September" || FetchMonth == "November")
                {
                    int totalDaysInMonth = 30;
                    double dailySalary = BasicSalary / totalDaysInMonth;
                    double absentDeduction = AbsentDays * dailySalary;
                    double halfDayDeduction = HalfDays * (dailySalary / 2);
                    double NetPay = BasicSalary - absentDeduction - halfDayDeduction;
                    Label7.Text = NetPay.ToString("F2");
                    string q1 = $"exec UpdateNetPay '{NetPay}','{Email}','{FetchMonth}','{FetchYear}'";
                    SqlCommand cmd1 = new SqlCommand(q1, conn);
                    cmd1.ExecuteNonQuery();
                }
                if(FetchMonth == "February")
                {
                    int totalDaysInMonth = 28;
                    double dailySalary = BasicSalary / totalDaysInMonth;
                    double absentDeduction = AbsentDays * dailySalary;
                    double halfDayDeduction = HalfDays * (dailySalary / 2);
                    double NetPay = BasicSalary - absentDeduction - halfDayDeduction;
                    Label7.Text = NetPay.ToString("F2");
                    string q1 = $"exec UpdateNetPay '{NetPay}','{Email}','{FetchMonth}','{FetchYear}'";
                    SqlCommand cmd1 = new SqlCommand(q1, conn);
                    cmd1.ExecuteNonQuery();
                }

                




            }

        }

        

        protected void Button2_Click(object sender, EventArgs e)
        {
            string FetchEmail = TextBox1.Text;
            string FetchMonth = DropDownList3.SelectedValue;
            int FetchYear = int.Parse(DropDownList4.SelectedValue);
            string q = $"exec PayrollFetchByID '{FetchEmail}','{FetchMonth}','{FetchYear}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                string Name = rdr["Name"].ToString();
               
                string Email = rdr["Email"].ToString();
                
                double BasicSalary = double.Parse(rdr["BasicSalary"].ToString());
               
                int PresentDays = int.Parse(rdr["PresentDays"].ToString());
                
                int AbsentDays = int.Parse(rdr["AbsentDays"].ToString());
              
                int HalfDays = int.Parse(rdr["HalfDays"].ToString());
                double NetPay = double.Parse(rdr["NetPay"].ToString());
                string relativePath = GenerateAndStorePayslip(Name, Email, FetchMonth, FetchYear, BasicSalary, PresentDays, AbsentDays, HalfDays, NetPay);
                SendPayslipEmail(Name, Email, FetchMonth, FetchYear, relativePath);
            }

        }

        public string GenerateAndStorePayslip(string Name, string Email, string Month, int Year, double BasicSalary, int PresentDays, int AbsentDays, int HalfDays, double NetPay)
        {
            
            string HTMLContent = $@"
<!DOCTYPE html>
<html xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <meta charset='UTF-8' />
    <meta name='viewport' content='width=device-width, initial-scale=1.0' />
    <title>Payslip</title>
    <style>
        body {{
            font-family: Arial, sans-serif;
            margin: 20px;
            color: #333;
        }}
        .container {{
            width: 600px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #f9f9f9;
        }}
        h1 {{
            text-align: center;
            color: #444;
        }}
        .section-title {{
            font-weight: bold;
            font-size: 16px;
            margin-top: 20px;
            color: #555;
        }}
        .details {{
            margin: 10px 0;
        }}
        .details span {{
            font-weight: bold;
            color: #555;
        }}
        .footer {{
            text-align: center;
            margin-top: 20px;
            font-size: 12px;
            color: #888;
        }}
    </style>
</head>
<body>
    <div class='container'>
        <h1>Payslip</h1>
        <div class='section-title'>Employee Details</div>
        <div class='details'><span>Name:</span> {Name}</div>
        <div class='details'><span>Email:</span> {Email}</div>
        <div class='details'><span>Month:</span> {Month}</div>
        <div class='details'><span>Year:</span> {Year}</div>

        <div class='section-title'>Attendance Details</div>
        <div class='details'><span>Present Days:</span> {PresentDays}</div>
        <div class='details'><span>Absent Days:</span> {AbsentDays}</div>
        <div class='details'><span>Half Days:</span> {HalfDays}</div>

        <div class='section-title'>Salary Details</div>
        <div class='details'><span>Basic Salary:</span> {BasicSalary:C2}</div>
        <div class='details'><span>Net Pay:</span> {NetPay:C2}</div>

        <div class='footer'>
            Generated on: {DateTime.Now:dd-MM-yyyy}
        </div>
    </div>
</body>
</html>";

            byte[] pdfBytes = GeneratePdfFromHtml(HTMLContent);

            
            
            string folderPath = "~/Payslips/";
            string relativePath = $"{folderPath}{Name}_{Month}_{Year}.pdf";
            string absolutePath = Server.MapPath(relativePath);

            
            string absoluteFolderPath = Server.MapPath(folderPath);
            if (!Directory.Exists(absoluteFolderPath))
            {
                Directory.CreateDirectory(absoluteFolderPath);
            }

            
            File.WriteAllBytes(absolutePath, pdfBytes);

            
            string q = $"exec UpdatePaySlipPath '{relativePath}','{Email}','{Month}','{Year}'";
            SqlCommand cmd1 = new SqlCommand(q, conn);
            cmd1.ExecuteNonQuery();





            return relativePath;

        }


        public byte[] GeneratePdfFromHtml(string htmlContent)
        {
            using (MemoryStream memoryStream = new MemoryStream())
            {
                Document document = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
                PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);
                document.Open();

                
                    using (StringReader stringReader = new StringReader(htmlContent))
                    {
                        
                        XMLWorkerHelper.GetInstance().ParseXHtml(writer, document, stringReader);
                    }
                
                

                document.Close();
                return memoryStream.ToArray();
            }
        }
        private void SendPayslipEmail(string Name, string Email, string Month, int Year, string relativePath)
        {
            string absolutePath = Server.MapPath(relativePath);
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("onkarsalunkhe1519@gmail.com");
            mail.To.Add(Email);
            mail.Subject = $"Pay Slip For Month {Month} {Year}";
            mail.Body = $"Dear {{Name}},\r\nPlease find your payslip for {{Month}} {{Year}} attached to this email.\r\nBest regards,\r\nHR Department";
            Attachment attachment = new Attachment(absolutePath);
            mail.Attachments.Add(attachment);
            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.Credentials = new NetworkCredential("onkarsalunkhe1519@gmail.com", "hxwwwrzpuaxpzwpb");
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }
    }
}