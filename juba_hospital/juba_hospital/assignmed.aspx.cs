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
    public partial class assignmed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string deleteJob(string medid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Delete job from jobs table
                    string jobQuery = "DELETE FROM [medication] WHERE [medid] = @medid";

                    using (SqlCommand cmd = new SqlCommand(jobQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@medid", medid);

                        cmd.ExecuteNonQuery();
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
        public static string updateJob(string medid, string med_name, string dosage, string frequency, string duration, string special_inst)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Update jobs table
                    string jobQuery = "UPDATE [medication] SET " +
                          "[med_name] = @med_name," +
                            "[dosage] = @dosage," +
                            "[frequency] = @frequency," +
                        "[duration] = @duration," +
                           "[special_inst] = @special_inst" +
                        " WHERE [medid] = @medid";

                    using (SqlCommand cmd = new SqlCommand(jobQuery, con))
                    {

                        cmd.Parameters.AddWithValue("@med_name", med_name);
                        cmd.Parameters.AddWithValue("@dosage", dosage);
                        cmd.Parameters.AddWithValue("@frequency", frequency);
                        cmd.Parameters.AddWithValue("@duration", duration);
                        cmd.Parameters.AddWithValue("@special_inst", special_inst);
                        cmd.Parameters.AddWithValue("@medid", medid);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions
                throw new Exception("Error updating job information", ex);
            }
        }

















        [WebMethod]
        public static string submitdata(string status,string id, string med_name, string dosage, string frequency, string duration, string special_inst, string prescid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Insert into patient table
                    string patientquery = "INSERT INTO medication (med_name, dosage, frequency, duration, special_inst, prescid) VALUES (@med_name, @dosage, @frequency, @duration, @special_inst, @prescid);";

                    string patientUpdateQuery = "UPDATE [patient] SET " +
                                              "[patient_status] = @status " +
                                            "WHERE [patientid] = @id";


                    using (SqlCommand cmd = new SqlCommand(patientquery, con))
                    {
                        cmd.Parameters.AddWithValue("@med_name", med_name);
                        cmd.Parameters.AddWithValue("@dosage", dosage);
                        cmd.Parameters.AddWithValue("@frequency", frequency);
                        cmd.Parameters.AddWithValue("@duration", duration);
                        cmd.Parameters.AddWithValue("@special_inst", special_inst);
                        cmd.Parameters.AddWithValue("@prescid", prescid);
                        cmd.ExecuteNonQuery();
                    
                    }



                    using (SqlCommand cmd1 = new SqlCommand(patientUpdateQuery, con))
                    {
                        cmd1.Parameters.AddWithValue("@id", id);
                        cmd1.Parameters.AddWithValue("@status", status);

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

        public class labresukt
        {
            public string TestName { get; set; }
            public string TestValue { get; set; }
        }

        [WebMethod]
        public static labresukt[] lab_test(string prescid)
        {
            List<labresukt> details = new List<labresukt>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
    


SELECT lab_result_id, TestName, TestValue
FROM
(
    SELECT [lab_result_id]
          ,[Biochemistry]
          ,[Lipid_profile]
          ,[Low_density_lipoprotein_LDL]
          ,[High_density_lipoprotein_HDL]
          ,[Total_cholesterol]
          ,[Triglycerides]
          ,[Liver_function_test]
          ,[SGPT_ALT]
          ,[SGOT_AST]
          ,[Alkaline_phosphates_ALP]
          ,[Total_bilirubin]
          ,[Direct_bilirubin]
          ,[Albumin]
          ,[JGlobulin]
          ,[Renal_profile]
          ,[Urea]
          ,[Creatinine]
          ,[Uric_acid]
          ,[Electrolytes]
          ,[Sodium]
          ,[Potassium]
          ,[Chloride]
          ,[Calcium]
          ,[Phosphorous]
          ,[Magnesium]
          ,[Pancreases]
          ,[Amylase]
          ,[Hematology]
          ,[Hemoglobin]
          ,[Malaria]
          ,[ESR]
          ,[Blood_grouping]
          ,[Blood_sugar]
          ,[CBC]
          ,[Cross_matching]
          ,[Immunology_Virology]
          ,[TPHA]
          ,[Human_immune_deficiency_HIV]
          ,[Hepatitis_B_virus_HBV]
          ,[Hepatitis_C_virus_HCV]
          ,[Brucella_melitensis]
          ,[Brucella_abortus]
          ,[C_reactive_protein_CRP]
          ,[Rheumatoid_factor_RF]
          ,[Antistreptolysin_O_ASO]
          ,[Toxoplasmosis]
          ,[Typhoid_hCG]
          ,[Hpylori_antibody]
          ,[Parasitology]
          ,[Stool_occult_blood]
          ,[General_stool_examination]
          ,[Hormones]
          ,[Thyroid_profile]
          ,[Triiodothyronine_T3]
          ,[Thyroxine_T4]
          ,[Thyroid_stimulating_hormone_TSH]
          ,[Fertility_profile]
          ,[Progesterone_Female]
          ,[Follicle_stimulating_hormone_FSH]
          ,[Estradiol]
          ,[Luteinizing_hormone_LH]
          ,[Testosterone_Male]
          ,[Prolactin]
          ,[Seminal_Fluid_Analysis_Male_B_HCG]
          ,[Clinical_path]
          ,[Urine_examination]
          ,[Stool_examination]
          ,[Sperm_examination]
          ,[Virginal_swab_trichomonas_virginals]
          ,[Human_chorionic_gonadotropin_hCG]
          ,[Hpylori_Ag_stool]
          ,[Diabetes]
          ,[Fasting_blood_sugar]
          ,[Hemoglobin_A1c]
          ,[General_urine_examination]
    FROM [juba_clinick].[dbo].[lab_results]
    WHERE prescid = @search
) src
UNPIVOT
(
    TestValue FOR TestName IN 
    ([Biochemistry]
    ,[Lipid_profile]
    ,[Low_density_lipoprotein_LDL]
    ,[High_density_lipoprotein_HDL]
    ,[Total_cholesterol]
    ,[Triglycerides]
    ,[Liver_function_test]
    ,[SGPT_ALT]
    ,[SGOT_AST]
    ,[Alkaline_phosphates_ALP]
    ,[Total_bilirubin]
    ,[Direct_bilirubin]
    ,[Albumin]
    ,[JGlobulin]
    ,[Renal_profile]
    ,[Urea]
    ,[Creatinine]
    ,[Uric_acid]
    ,[Electrolytes]
    ,[Sodium]
    ,[Potassium]
    ,[Chloride]
    ,[Calcium]
    ,[Phosphorous]
    ,[Magnesium]
    ,[Pancreases]
    ,[Amylase]
    ,[Hematology]
    ,[Hemoglobin]
    ,[Malaria]
    ,[ESR]
    ,[Blood_grouping]
    ,[Blood_sugar]
    ,[CBC]
    ,[Cross_matching]
    ,[Immunology_Virology]
    ,[TPHA]
    ,[Human_immune_deficiency_HIV]
    ,[Hepatitis_B_virus_HBV]
    ,[Hepatitis_C_virus_HCV]
    ,[Brucella_melitensis]
    ,[Brucella_abortus]
    ,[C_reactive_protein_CRP]
    ,[Rheumatoid_factor_RF]
    ,[Antistreptolysin_O_ASO]
    ,[Toxoplasmosis]
    ,[Typhoid_hCG]
    ,[Hpylori_antibody]
    ,[Parasitology]
    ,[Stool_occult_blood]
    ,[General_stool_examination]
    ,[Hormones]
    ,[Thyroid_profile]
    ,[Triiodothyronine_T3]
    ,[Thyroxine_T4]
    ,[Thyroid_stimulating_hormone_TSH]
    ,[Fertility_profile]
    ,[Progesterone_Female]
    ,[Follicle_stimulating_hormone_FSH]
    ,[Estradiol]
    ,[Luteinizing_hormone_LH]
    ,[Testosterone_Male]
    ,[Prolactin]
    ,[Seminal_Fluid_Analysis_Male_B_HCG]
    ,[Clinical_path]
    ,[Urine_examination]
    ,[Stool_examination]
    ,[Sperm_examination]
    ,[Virginal_swab_trichomonas_virginals]
    ,[Human_chorionic_gonadotropin_hCG]
    ,[Hpylori_Ag_stool]
    ,[Diabetes]
    ,[Fasting_blood_sugar]
    ,[Hemoglobin_A1c]
    ,[General_urine_examination])
) unpvt
WHERE TestValue IS NOT NULL AND TestValue != '';


 ", con);
                cmd.Parameters.AddWithValue("@search", prescid);


                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        labresukt field = new labresukt();


                        field.TestName = dr["TestName"].ToString();
                        field.TestValue = dr["TestValue"].ToString();
                     

                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
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
    CONVERT(date, patient.dob) AS dob,
    CASE 
        WHEN prescribtion.status = 0 THEN 'waiting'
        WHEN prescribtion.status = 1 THEN 'processed'
        WHEN prescribtion.status = 2 THEN 'pending-xray'
        WHEN prescribtion.status = 3 THEN 'X-ray-Processed'
		 WHEN prescribtion.status = 4 THEN 'pending-lap'
	     WHEN prescribtion.status = 5 THEN 'lap-processed'
    END AS status
FROM 
    patient
INNER JOIN 
    prescribtion ON patient.patientid = prescribtion.patientid
INNER JOIN 
    doctor ON prescribtion.doctorid = doctor.doctorid
WHERE 
    doctor.doctorid = @search
    AND prescribtion.status  in (0,3,5);

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
                        
                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }
    }
}