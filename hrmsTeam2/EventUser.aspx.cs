using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;

namespace hrmsTeam2
{
    public partial class EventUser : System.Web.UI.Page
    {
        [WebMethod(EnableSession = true)] // Enable session to access Session variables
        public static List<object> GetEvents()
        {
            List<object> events = new List<object>();

            // Get the current user's email from session
            string userEmail = HttpContext.Current.Session["MyUser"] as string;

            if (string.IsNullOrEmpty(userEmail))
            {
                // If no user is logged in, return an empty list
                return events;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT 
                        Name, 
                        EventName, 
                        EventType, 
                        StartDate, 
                        EndDate 
                    FROM Events
                    UNION ALL
                    SELECT 
                        Name, 
                        LeaveType AS EventName, 
                        CASE 
                            WHEN LeaveStatus = 'Approved' THEN 'Leave Approved'
                            WHEN LeaveStatus = 'Pending' THEN 'Leave Pending'
                            WHEN LeaveStatus = 'Rejected' THEN 'Leave Rejected'
                        END AS EventType,
                        StartDate, 
                        EndDate 
                    FROM LeaveRequests
                    WHERE Email = @UserEmail"; // Filter leave requests for the logged-in user

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserEmail", userEmail);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    string eventType = reader["EventType"].ToString();
                    string eventTitle = reader["EventName"].ToString();
                    string color;

                    // Assign color based on event type
                    if (eventType == "Birthday")
                    {
                        eventTitle = $"{reader["Name"]}'s Birthday";
                        color = "blue"; // Birthday events
                    }
                    else if (eventType == "Holiday")
                    {
                        color = "red"; // Holiday events
                    }
                    else if (eventType == "Leave Approved")
                    {
                        color = "green"; // Approved leaves
                    }
                    else if (eventType == "Leave Pending")
                    {
                        color = "yellow"; // Pending leaves
                    }
                    else if (eventType == "Leave Rejected")
                    {
                        color = "red"; // Rejected leaves
                    }
                    else
                    {
                        color = "gray"; // Default color
                    }

                    events.Add(new
                    {
                        title = eventTitle,
                        start = Convert.ToDateTime(reader["StartDate"]).ToString("yyyy-MM-dd"),
                        end = Convert.ToDateTime(reader["EndDate"]).AddDays(1).ToString("yyyy-MM-dd"), // Add 1 day to include the end date
                        color = color
                    });
                }
            }

            return events;
        }
    }
}
