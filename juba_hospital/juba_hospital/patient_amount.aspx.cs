using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static juba_hospital.waitingpatients;

namespace juba_hospital
{
    public partial class patient_amount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string updatepatient( string id, string amount)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Update patient table
                    string patientUpdateQuery = "UPDATE [patient] SET " +
                                   
                                                "[amount] = @amount " +
                              
                                                "WHERE [patientid] = @id";

                    using (SqlCommand cmd = new SqlCommand(patientUpdateQuery, con))
                    {
                  
                        cmd.Parameters.AddWithValue("@id", id);
               
                        cmd.Parameters.AddWithValue("@amount", amount);


                        cmd.ExecuteNonQuery();
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
        public static ptclass[] medic()
        {
            List<ptclass> details = new List<ptclass>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
     
     

	SELECT 
    patient.patientid,
    patient.full_name, 
    patient.sex,
    patient.location,
    patient.phone,
    CONVERT(date, patient.date_registered) AS date_registered,
    doctor.doctortitle,
    patient.patientid,
    prescribtion.prescid,
    doctor.doctorid,
    doctor.doctortitle,
    patient.amount,
    xray.xrayid,
    CONVERT(date, patient.dob) AS dob,
    CASE 
        WHEN prescribtion.status = 0 THEN 'waiting'
        WHEN prescribtion.status = 1 THEN 'processed'
        WHEN prescribtion.status = 2 THEN 'pending-lap'
        WHEN prescribtion.status = 3 THEN 'lap-processed'
    END AS status,
    CASE 
        WHEN prescribtion.xray_status = 0 THEN 'waiting'
        WHEN prescribtion.xray_status = 1 THEN 'pending_scan'
        WHEN prescribtion.xray_status = 2 THEN 'scan_processed'
    END AS status_xray
FROM 
    patient
INNER JOIN 
    prescribtion ON patient.patientid = prescribtion.patientid
INNER JOIN 
    doctor ON prescribtion.doctorid = doctor.doctorid
LEFT JOIN 
    xray ON prescribtion.prescid = xray.prescid

ORDER BY 
    patient.date_registered DESC;

 ", con);
             

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        ptclass field = new ptclass();


                        field.full_name = dr["full_name"].ToString();
                        field.sex = dr["sex"].ToString();
                        field.location = dr["location"].ToString();
                        field.phone = dr["phone"].ToString();
                        field.date_registered = Convert.ToDateTime(dr["date_registered"]).ToString("yyyy-MM-dd");
                        field.doctortitle = dr["doctortitle"].ToString();
                        field.doctorid = dr["doctorid"].ToString();
                        field.patientid = dr["patientid"].ToString();
                        field.doctortitle = dr["doctortitle"].ToString();
                        field.prescid = dr["prescid"].ToString();
                        field.amount = dr["amount"].ToString();
                        field.dob = Convert.ToDateTime(dr["dob"]).ToString("yyyy-MM-dd");
                        field.status = dr["status"].ToString();
                        field.xray_status = dr["status_xray"].ToString();
                        field.xrayid = dr["xrayid"].ToString();

                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }
    }
}