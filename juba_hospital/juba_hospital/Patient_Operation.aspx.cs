using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace juba_hospital
{
    public partial class Patient_Operation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string deletepatient(string id, string pid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Delete job from jobs table
                    string jobQuery = "DELETE FROM [patient] WHERE [patientid] = @id";

                    using (SqlCommand cmd = new SqlCommand(jobQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@id", pid);

                        cmd.ExecuteNonQuery();
                    }


                    // Delete job from jobs table
                    string prescdelete = "DELETE FROM [prescribtion] WHERE [prescid] = @id";

                    using (SqlCommand cmd1 = new SqlCommand(prescdelete, con))
                    {
                        cmd1.Parameters.AddWithValue("@id", id);

                        cmd1.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions
                throw new Exception("Error deleting job", ex);
            }
        }
        [WebMethod]
        public static string updatepatient(string name, string id, string phone, string location, string doctor, string sex, string amount, string dob, string did)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Update patient table
                    string patientUpdateQuery = "UPDATE [patient] SET " +
                                                "[full_name] = @name, " +
                                                "[amount] = @amount, " +
                                                "[sex] = @sex, " +
                                                "[dob] = @dob, " +
                                                "[location] = @location, " +
                                                "[phone] = @phone " +
                                                "WHERE [patientid] = @id";

                    using (SqlCommand cmd = new SqlCommand(patientUpdateQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@phone", phone);
                        cmd.Parameters.AddWithValue("@location", location);
                        cmd.Parameters.AddWithValue("@doctor", doctor);
                        cmd.Parameters.AddWithValue("@sex", sex);
                        cmd.Parameters.AddWithValue("@amount", amount);
                        cmd.Parameters.AddWithValue("@dob", dob);

                        cmd.ExecuteNonQuery();
                    }

                    // Update prescription table
                    string prescriptionUpdateQuery = "UPDATE [prescribtion] SET " +
                                                     "[doctorid] = @doctor " +
                                                     "WHERE [patientid] = @id";

                    using (SqlCommand cmd1 = new SqlCommand(prescriptionUpdateQuery, con))
                    {
                        cmd1.Parameters.AddWithValue("@doctor", doctor);
                        cmd1.Parameters.AddWithValue("@id", id);

                        cmd1.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions
                throw new Exception("Error updating patient", ex);
            }
        }


        [WebMethod]
        public static object getdoctors(int doctorid)
        {
            List<ListItem> doctorList = new List<ListItem>();

            string selectedDoctorId = null;
            string selectedDoctorTitle = null;

            string queryAllDoctors = "SELECT doctorid, doctortitle FROM doctor";
            string querySelectedDoctor = "SELECT doctorid, doctortitle FROM doctor WHERE doctorid = @doctorid";

            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                // Fetch all doctors
                using (SqlCommand cmd = new SqlCommand(queryAllDoctors, con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            doctorList.Add(new ListItem
                            {
                                Value = sdr["doctorid"].ToString(),
                                Text = sdr["doctortitle"].ToString()
                            });
                        }
                    }
                    con.Close();
                }

                // Fetch the selected doctor details
                using (SqlCommand cmd = new SqlCommand(querySelectedDoctor, con))
                {
                    cmd.Parameters.AddWithValue("@doctorid", doctorid);
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.Read())
                        {
                            selectedDoctorId = sdr["doctorid"].ToString();
                            selectedDoctorTitle = sdr["doctortitle"].ToString();
                        }
                    }
                    con.Close();
                }
            }

            return new
            {
                doctorList = doctorList,
                selectedDoctorId = selectedDoctorId,
                selectedDoctorTitle = selectedDoctorTitle
            };
        }

    }
}