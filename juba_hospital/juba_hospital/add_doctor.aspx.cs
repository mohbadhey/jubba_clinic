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
    public partial class add_doctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static ct[] datadisplay()
        {
            List<ct> details = new List<ct>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
           select doctorname,doctortitle,doctornumber,username,password from doctor
        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ct field = new ct();
                    field.full_name = dr["doctorname"].ToString();
                    field.doctortitle = dr["doctortitle"].ToString();
                    field.doctornumber = dr["doctornumber"].ToString();
                    field.username = dr["username"].ToString();
                    field.password = dr["password"].ToString();

                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }
        public class ct
        {
                public string full_name;
            public string doctortitle;
            public string username;
            public string password;
            public string doctornumber;

        }

        [WebMethod]
        public static string submitdata(string name, string title, string pass, string phone, string username)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Insert into patient table
                    string patientquery = "INSERT INTO doctor (doctorname, doctortitle, doctornumber, username, password) VALUES (@name, @title,@phone,@username, @pass );";
                    using (SqlCommand cmd = new SqlCommand(patientquery, con))
                    {
                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@title", title);
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