using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static juba_hospital.add_doctor;

namespace juba_hospital
{
    public partial class add_registre : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static rt[] datadisplay()
        {
            List<rt> details = new List<rt>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
        select * from registre
        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    rt field = new rt();
                    field.full_name = dr["fullname"].ToString();
        
                    field.phone = dr["phone"].ToString();
                    field.username = dr["username"].ToString();
                    field.password = dr["password"].ToString();

                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }



        public class rt
        {
            public string full_name;
            public string phone;
            public string username;
            public string password;
  

        }


        [WebMethod]
        public static string submitdata(string name, string pass, string phone, string username)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Insert into patient table
                    string patientquery = "INSERT INTO registre (fullname, phone, username, password) VALUES (@name, @phone ,@username, @pass);";
                    using (SqlCommand cmd = new SqlCommand(patientquery, con))
                    {
                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@pass", pass);
                        cmd.Parameters.AddWithValue("@phone", phone);
                        cmd.Parameters.AddWithValue("@username", username);

                        cmd.ExecuteNonQuery();

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
    }
}