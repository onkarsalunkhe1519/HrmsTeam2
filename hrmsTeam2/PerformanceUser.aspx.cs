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
    public partial class PerformanceUser : System.Web.UI.Page
    {
        SqlConnection conn;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                // Initialize database connection
                string cs = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
                conn = new SqlConnection(cs);
                conn.Open();

               
            }
            catch (Exception ex)
            {
                // Handle any connection errors
                ShowErrorMessage("Database connection error: " + ex.Message);
            }
        }

        // Separate method to check notification status for better organization
        

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                // Verify user session
                if (Session["UserId"] == null)
                {
                    ShowErrorMessage("User session expired. Please log in again.");
                    return;
                }

                int userId = (int)Session["UserId"];
                DateTime submittedDate = DateTime.Now;

                // Get the review ID
                int reviewId = GetReviewId(userId);
                if (reviewId <= 0)
                {
                    ShowErrorMessage("No review found for the user.");
                    return;
                }

                // Process all answers using direct TextBox references
                ProcessAnswers(userId, submittedDate);

                // Update review status and reset notification
                UpdateReviewStatus(reviewId);
                

                ShowSuccessMessage("Performance review submitted successfully!");
            }
            catch (Exception ex)
            {
                ShowErrorMessage("Error submitting review: " + ex.Message);
            }
        }

        // Helper method to get review ID
        private int GetReviewId(int userId)
        {
            using (SqlCommand cmd = new SqlCommand("exec getReview @UserId, @Status", conn))
            {
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@Status", 0);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        return reader["review_id"] != DBNull.Value ? Convert.ToInt32(reader["review_id"]) : 0;
                    }
                    return 0;
                }
            }
        }

        // Process answers using direct TextBox references
        private void ProcessAnswers(int userId, DateTime submittedDate)
        {
            // Direct access to TextBox controls using their IDs
            TextBox[] answerBoxes = new TextBox[]
            {
                q1, q2, q3, q4, q5, q6, q7, q8, q9, q10
            };

            for (int i = 0; i < answerBoxes.Length; i++)
            {
                if (answerBoxes[i] != null)
                {
                    string answerText = answerBoxes[i].Text.Trim();

                    // Use parameterized query to properly handle data types
                    using (SqlCommand cmd = new SqlCommand("exec InsertAnswer @QuestionId, @AnswerText, @UserId, @SubmittedDate", conn))
                    {
                        cmd.Parameters.AddWithValue("@QuestionId", i + 1);  // Integer - no quotes
                        cmd.Parameters.AddWithValue("@AnswerText", answerText);  // String - handled properly
                        cmd.Parameters.AddWithValue("@UserId", userId);  // Integer - no quotes
                        cmd.Parameters.AddWithValue("@SubmittedDate", submittedDate);  // DateTime - handled properly
                        cmd.ExecuteNonQuery();
                    }
                }
            }
        }


        // Update review status
        private void UpdateReviewStatus(int reviewId)
        {
            using (SqlCommand cmd = new SqlCommand("exec UpdateReview @Status, @ReviewId", conn))
            {
                cmd.Parameters.AddWithValue("@Status", 1);
                cmd.Parameters.AddWithValue("@ReviewId", reviewId);
                cmd.ExecuteNonQuery();
            }
        }

        // Reset notification status
        
        // Helper methods for showing messages
        private void ShowErrorMessage(string message)
        {
            Response.Write($"<script>alert('{message}');</script>");
        }

        private void ShowSuccessMessage(string message)
        {
            Response.Write($"<script>alert('{message}');</script>");
        }

        // Clean up database connection
        protected override void OnUnload(EventArgs e)
        {
            if (conn != null && conn.State == System.Data.ConnectionState.Open)
            {
                conn.Close();
            }
            base.OnUnload(e);
        }
    }
}