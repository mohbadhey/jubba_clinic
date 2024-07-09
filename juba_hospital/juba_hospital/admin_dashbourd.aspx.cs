using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static juba_hospital.admin_dashbourd;

namespace juba_hospital
{
    public partial class admin_dashbourd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class cust
        {
            public string inpatient { get; set; }

        }

        public class ip
        {
            public string in_patients { get; set; }

        }
        public class op
        {
            public string op_patients { get; set; }

        }
        public class amount1
        {
            public string amount { get; set; }

        }
        [WebMethod]
        public static amount1[] amount()
        {
            List<amount1> details = new List<amount1>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
   

select sum(amount) as amount from patient
        ", con);


                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    amount1 field = new amount1();
                    field.amount = dr["amount"].ToString();
                    details.Add(field);
                }
            }
            return details.ToArray();
        }
        [WebMethod]
        public static op[] op_patients()
        {
            List<op> details = new List<op>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
   


	               SELECT 
  count(*) as   op_patients
   FROM 
       patient
   INNER JOIN 
       prescribtion ON patient.patientid = prescribtion.patientid
   INNER JOIN 
       doctor ON prescribtion.doctorid = doctor.doctorid
where patient.patient_status = 0;
        ", con);


                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    op field = new op();
                    field.op_patients = dr["op_patients"].ToString();
                    details.Add(field);
                }
            }
            return details.ToArray();
        }
        [WebMethod]
        public static ip[] inpatient()
        {
            List<ip> details = new List<ip>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
   


	               SELECT 
  count(*) as   in_patients
   FROM 
       patient
   INNER JOIN 
       prescribtion ON patient.patientid = prescribtion.patientid
   INNER JOIN 
       doctor ON prescribtion.doctorid = doctor.doctorid
where patient.patient_status = 1;
        ", con);


                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ip field = new ip();
                    field.in_patients = dr["in_patients"].ToString();
                    details.Add(field);
                }
            }
            return details.ToArray();
        }

        [WebMethod]
        public static cust[] doctors()
        {
            List<cust> details = new List<cust>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
   

select count(*) as doctortotal from doctor

        ", con);


                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    cust field = new cust();
                    field.inpatient = dr["doctortotal"].ToString();
                    details.Add(field);
                }
            }
            return details.ToArray();
        }


    }
}