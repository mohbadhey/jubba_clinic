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
    public partial class lab_waiting_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static ptclass[] pendlap()
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
    date_registered,
    doctor.doctortitle,
    patient.patientid,
    prescribtion.prescid,
    doctor.doctorid,
    patient.amount,
	lab_results.lab_result_id,
    CONVERT(date, patient.dob) AS dob,
    CASE 
        WHEN prescribtion.status = 0 THEN 'waiting'
        WHEN prescribtion.status = 1 THEN 'processed'
       	 WHEN prescribtion.status = 2 THEN 'pending-lap'
	     WHEN prescribtion.status = 3 THEN 'lap-processed'
    END AS status
FROM 
    patient
INNER JOIN 
    prescribtion ON patient.patientid = prescribtion.patientid
INNER JOIN 
    doctor ON prescribtion.doctorid = doctor.doctorid
	left JOIN 
    lab_results ON prescribtion.prescid = lab_results.prescid
WHERE 
 prescribtion.status  in (2,3)   order by patient.date_registered desc;

 

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
                        field.date_registered = dr["date_registered"].ToString();
                        
                        field.doctortitle = dr["doctortitle"].ToString();
                        field.doctorid = dr["doctorid"].ToString();
                        field.patientid = dr["patientid"].ToString();
                        field.prescid = dr["prescid"].ToString();
                        field.amount = dr["amount"].ToString();
                        field.dob = Convert.ToDateTime(dr["dob"]).ToString("yyyy-MM-dd");
                        field.status = dr["status"].ToString();
                        field.lab_result_id = dr["lab_result_id"].ToString();
                        
                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }
    }
}