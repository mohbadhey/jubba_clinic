using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace juba_hospital
{
    public partial class Add_patients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string submitdata(string name, string number, string date, string gender, string doctor, string location, string amount)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Insert into patient table
                    string patientquery = "INSERT INTO patient (full_name, dob, sex, location, amount, phone) VALUES (@name, @date, @gender, @location, @amount, @number); SELECT SCOPE_IDENTITY();";
                    using (SqlCommand cmd = new SqlCommand(patientquery, con))
                    {
                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@number", number);
                        cmd.Parameters.AddWithValue("@date", date);
                        cmd.Parameters.AddWithValue("@gender", gender);
                        cmd.Parameters.AddWithValue("@location", location);
                        cmd.Parameters.AddWithValue("@amount", amount);

                        int patient_id = Convert.ToInt32(cmd.ExecuteScalar()); // Retrieve the auto-generated primary key value

                        // Insert into prescribtion table
                        string presquery = "INSERT INTO prescribtion (patientid, doctorid) VALUES (@patient_id, @doctor);";
                        using (SqlCommand mtidCmd = new SqlCommand(presquery, con))
                        {
                            mtidCmd.Parameters.AddWithValue("@doctor", doctor);
                            mtidCmd.Parameters.AddWithValue("@patient_id", patient_id);

                            mtidCmd.ExecuteNonQuery();
                        }
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions and return the error message
                return "Error in submitdata method: " + ex.Message;
            }
        }

        [WebMethod]
        public static bool CheckIdExists(int phone)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "SELECT COUNT(*) FROM patient WHERE phone = @number";

                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@number", phone);

                        int count = Convert.ToInt32(command.ExecuteScalar());
                        return count > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in CheckIdExists method", ex);
            }
        }
        [WebMethod]
        public static List<ListItem> getdoctor()
        {
            string query = "  select doctorid,doctortitle from doctor";
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    List<ListItem> customers = new List<ListItem>();
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            customers.Add(new ListItem
                            {
                                Value = sdr["doctorid"].ToString(),
                                Text = sdr["doctortitle"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return customers;
                }
            }
        }
    }
}