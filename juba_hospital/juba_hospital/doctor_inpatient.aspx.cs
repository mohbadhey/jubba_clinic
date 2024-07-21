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
    public partial class doctor_inpatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static string submitdata(string id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                

                    string patientUpdateQuery = "UPDATE [patient] SET " +
                                              "[patient_status] = 3 " +
                                            "WHERE [patientid] = @id";


                 



                    using (SqlCommand cmd1 = new SqlCommand(patientUpdateQuery, con))
                    {
                        cmd1.Parameters.AddWithValue("@id", id);
                

                        cmd1.ExecuteNonQuery();

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
        public static ptclass[] medic(string search)
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
        WHEN prescribtion.xray_status = 1 THEN 'pending_image'
        WHEN prescribtion.xray_status = 2 THEN 'image_processed'
    END AS status_xray,
	    CASE 
    WHEN patient.patient_status = 0 THEN 'Out Patient'
       WHEN patient.patient_status = 1 THEN 'In Patient'
END AS patient_status
FROM 
    patient
INNER JOIN 
    prescribtion ON patient.patientid = prescribtion.patientid
INNER JOIN 
    doctor ON prescribtion.doctorid = doctor.doctorid
LEFT JOIN 
    xray ON prescribtion.prescid = xray.prescid
WHERE 
    doctor.doctorid = 5 and patient.patient_status  = 1
ORDER BY 
    patient.date_registered DESC;


 ", con);
                cmd.Parameters.AddWithValue("@search", search);


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
                        field.patient_status = dr["patient_status"].ToString();
                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }





        [WebMethod]
        public static ptclass[] patientwait(string search)
        {
            List<ptclass> details = new List<ptclass>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
  
	                 SELECT 
       patient.full_name, 
       patient.sex,
       patient.location,
       patient.phone,
       CONVERT(date, patient.date_registered) AS date_registered,
       doctor.doctortitle,
       patient.patientid,
      prescribtion.prescid,
       doctor.doctorid,
       patient.amount,
       CONVERT(date, patient.dob) AS dob,
	     CASE 
      WHEN patient.patient_status = 0 THEN 'Out Patient'
         WHEN patient.patient_status = 1 THEN 'In Patient'
  END AS patient_status
   FROM 
       patient
   INNER JOIN 
       prescribtion ON patient.patientid = prescribtion.patientid
   INNER JOIN 
       doctor ON prescribtion.doctorid = doctor.doctorid
where patient.patient_status = 1 and doctor.doctorid = @search;

 ", con);
                cmd.Parameters.AddWithValue("@search", search);


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
                        field.prescid = dr["prescid"].ToString();
                        field.amount = dr["amount"].ToString();
                        field.patient_status = dr["patient_status"].ToString();
                        field.dob = Convert.ToDateTime(dr["dob"]).ToString("yyyy-MM-dd");

                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }
    }
}