using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace juba_hospital
{
    public partial class assingxray : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string submitxray(string xrname, string xrydescribtion, string id, string typeimg)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;


            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Insert into medication table
                    string medicationQuery = @"
                INSERT INTO xray (
                    xryname, xrydescribtion,prescid,type
                ) VALUES (
                    @xryname, @xrydescribtion, @prescid, @typeimg
                )";

                    string patientUpdateQuery = "UPDATE [prescribtion] SET " +
                                                "[xray_status] = 1" +
                                              "WHERE [prescid] = @id";

                    using (SqlCommand cmd = new SqlCommand(medicationQuery, con))
                    {


                        cmd.Parameters.AddWithValue("@xryname", xrname);
                        cmd.Parameters.AddWithValue("@xrydescribtion", xrydescribtion);
                        
                                     cmd.Parameters.AddWithValue("@typeimg", typeimg);

                        cmd.Parameters.AddWithValue("@prescid", id);
                

                        cmd.ExecuteNonQuery();
                    }
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
                // Handle exceptions and return the error message with detailed information
                return "Error in submitdata method: " + ex.Message + " - " + ex.StackTrace;
            }
        }








        [WebMethod]
        public static string updatepatient(string id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Update patient table
                    string patientUpdateQuery = "UPDATE [prescribtion] SET " +
                                                "[status] = 2 " +
                                              "WHERE [prescid] = @id";

                    using (SqlCommand cmd = new SqlCommand(patientUpdateQuery, con))
                    {

                        cmd.Parameters.AddWithValue("@id", id);


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
        public static string submitdata(

    string id, string presc,
    string flexCheckGeneralUrineExamination, string flexCheckProgesteroneFemale, string flexCheckAmylase, string flexCheckMagnesium,
    string flexCheckPhosphorous, string flexCheckCalcium, string flexCheckChloride, string flexCheckPotassium,
    string flexCheckSodium, string flexCheckUricAcid, string flexCheckCreatinine, string flexCheckUrea,
    string flexCheckJGlobulin, string flexCheckAlbumin, string flexCheckTotalBilirubin, string flexCheckAlkalinePhosphatesALP,
    string flexCheckSGOTAST, string flexCheckSGPTALT, string flexCheckLiverFunctionTest, string flexCheckTriglycerides,
    string flexCheckTotalCholesterol, string flexCheckHemoglobinA1c, string flexCheckHDL, string flexCheckLDL,
 string flexCheckFSH, string flexCheckEstradiol, string flexCheckLH,
    string flexCheckTestosteroneMale, string flexCheckProlactin, string flexCheckSeminalFluidAnalysis, string flexCheckBHCG,
    string flexCheckUrineExamination, string flexCheckStoolExamination, string flexCheckHemoglobin, string flexCheckMalaria,
    string flexCheckESR, string flexCheckBloodGrouping, string flexCheckBloodSugar, string flexCheckCBC,
    string flexCheckCrossMatching, string flexCheckTPHA, string flexCheckHIV, string flexCheckHBV,
    string flexCheckHCV, string flexCheckBrucellaMelitensis, string flexCheckBrucellaAbortus, string flexCheckCRP,
    string flexCheckRF, string flexCheckASO, string flexCheckToxoplasmosis, string flexCheckTyphoid,
    string flexCheckHpyloriAntibody, string flexCheckStoolOccultBlood, string flexCheckGeneralStoolExamination, string flexCheckThyroidProfile,
    string flexCheckT3, string flexCheckT4, string flexCheckTSH, string flexCheckSpermExamination,
    string flexCheckVirginalSwab, string flexCheckTrichomonasVirginals, string flexCheckHCG, string flexCheckHpyloriAgStool,
    string flexCheckFastingBloodSugar ,  string flexCheckDirectBilirubin)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;


            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Insert into medication table
                    string medicationQuery = @"
                INSERT INTO lab_test (
                    prescid, General_urine_examination, Progesterone_Female, Amylase, Magnesium, Phosphorous,
                    Calcium, Chloride, Potassium, Sodium, Uric_acid, Creatinine, Urea, JGlobulin, Albumin,
                    Total_bilirubin, Alkaline_phosphates_ALP, SGOT_AST, SGPT_ALT, Triglycerides,
                    Total_cholesterol, Hemoglobin_A1c, High_density_lipoprotein_HDL, Low_density_lipoprotein_LDL,
                    Follicle_stimulating_hormone_FSH, Estradiol, Luteinizing_hormone_LH, Testosterone_Male,
                    Prolactin, Seminal_Fluid_Analysis_Male_B_HCG, Urine_examination, Stool_examination, Hemoglobin, Malaria,
                    ESR, Blood_grouping, Blood_sugar, CBC, Cross_matching, TPHA, Human_immune_deficiency_HIV,
                    Hepatitis_B_virus_HBV, Hepatitis_C_virus_HCV, Brucella_melitensis, Brucella_abortus, C_reactive_protein_CRP,
                    Rheumatoid_factor_RF, Antistreptolysin_O_ASO, Toxoplasmosis, Typhoid_hCG, Hpylori_antibody, Stool_occult_blood,
                    General_stool_examination, Thyroid_profile, Triiodothyronine_T3, Thyroxine_T4, Thyroid_stimulating_hormone_TSH,
                    Sperm_examination, Virginal_swab_trichomonas_virginals, Human_chorionic_gonadotropin_hCG, Hpylori_Ag_stool,
                    Fasting_blood_sugar , Direct_bilirubin
                ) VALUES (
                    @prescid, @General_urine_examination, @Progesterone_Female, @Amylase, @Magnesium, @Phosphorous,
                    @Calcium, @Chloride, @Potassium, @Sodium, @Uric_acid, @Creatinine, @Urea, @JGlobulin, @Albumin,
                    @Total_bilirubin, @Alkaline_phosphates_ALP, @SGOT_AST, @SGPT_ALT,  @Triglycerides,
                    @Total_cholesterol, @Hemoglobin_A1c, @High_density_lipoprotein_HDL, @Low_density_lipoprotein_LDL,
      @Follicle_stimulating_hormone_FSH, @Estradiol, @Luteinizing_hormone_LH, @Testosterone_Male,
                    @Prolactin, @Seminal_Fluid_Analysis_Male_B_HCG, @Urine_examination, @Stool_examination, @Hemoglobin, @Malaria,
                    @ESR, @Blood_grouping, @Blood_sugar, @CBC, @Cross_matching, @TPHA, @Human_immune_deficiency_HIV,
                    @Hepatitis_B_virus_HBV, @Hepatitis_C_virus_HCV, @Brucella_melitensis, @Brucella_abortus, @C_reactive_protein_CRP,
                    @Rheumatoid_factor_RF, @Antistreptolysin_O_ASO, @Toxoplasmosis, @Typhoid_hCG, @Hpylori_antibody, @Stool_occult_blood,
                    @General_stool_examination, @Thyroid_profile, @Triiodothyronine_T3, @Thyroxine_T4, @Thyroid_stimulating_hormone_TSH,
                    @Sperm_examination, @Virginal_swab_trichomonas_virginals, @Human_chorionic_gonadotropin_hCG, @Hpylori_Ag_stool,
                    @Fasting_blood_sugar,@Direct_bilirubin
                )";

                    string patientUpdateQuery = "UPDATE [prescribtion] SET " +
                                                "[status] = 2 " +
                                              "WHERE [prescid] = @presc";

                    using (SqlCommand cmd = new SqlCommand(medicationQuery, con))
                    {

                        
                                     cmd.Parameters.AddWithValue("@Direct_bilirubin", flexCheckDirectBilirubin);

                        cmd.Parameters.AddWithValue("@prescid", presc);
                        cmd.Parameters.AddWithValue("@General_urine_examination", flexCheckGeneralUrineExamination);
                        cmd.Parameters.AddWithValue("@Progesterone_Female", flexCheckProgesteroneFemale);
                        cmd.Parameters.AddWithValue("@Amylase", flexCheckAmylase);
                        cmd.Parameters.AddWithValue("@Magnesium", flexCheckMagnesium);
                        cmd.Parameters.AddWithValue("@Phosphorous", flexCheckPhosphorous);
                        cmd.Parameters.AddWithValue("@Calcium", flexCheckCalcium);
                        cmd.Parameters.AddWithValue("@Chloride", flexCheckChloride);
                        cmd.Parameters.AddWithValue("@Potassium", flexCheckPotassium);
                        cmd.Parameters.AddWithValue("@Sodium", flexCheckSodium);
                        cmd.Parameters.AddWithValue("@Uric_acid", flexCheckUricAcid);
                        cmd.Parameters.AddWithValue("@Creatinine", flexCheckCreatinine);
                        cmd.Parameters.AddWithValue("@Urea", flexCheckUrea);
                        cmd.Parameters.AddWithValue("@JGlobulin", flexCheckJGlobulin);
                        cmd.Parameters.AddWithValue("@Albumin", flexCheckAlbumin);
                        cmd.Parameters.AddWithValue("@Total_bilirubin", flexCheckTotalBilirubin);
                        cmd.Parameters.AddWithValue("@Alkaline_phosphates_ALP", flexCheckAlkalinePhosphatesALP);
                        cmd.Parameters.AddWithValue("@SGOT_AST", flexCheckSGOTAST);
                        cmd.Parameters.AddWithValue("@SGPT_ALT", flexCheckSGPTALT);
                 
                        cmd.Parameters.AddWithValue("@Triglycerides", flexCheckTriglycerides);
                        cmd.Parameters.AddWithValue("@Total_cholesterol", flexCheckTotalCholesterol);
                        cmd.Parameters.AddWithValue("@Hemoglobin_A1c", flexCheckHemoglobinA1c);
                        cmd.Parameters.AddWithValue("@High_density_lipoprotein_HDL", flexCheckHDL);
                        cmd.Parameters.AddWithValue("@Low_density_lipoprotein_LDL", flexCheckLDL);
                 
                        cmd.Parameters.AddWithValue("@Follicle_stimulating_hormone_FSH", flexCheckFSH);
                        cmd.Parameters.AddWithValue("@Estradiol", flexCheckEstradiol);
                        cmd.Parameters.AddWithValue("@Luteinizing_hormone_LH", flexCheckLH);
                        cmd.Parameters.AddWithValue("@Testosterone_Male", flexCheckTestosteroneMale);
                        cmd.Parameters.AddWithValue("@Prolactin", flexCheckProlactin);
                        cmd.Parameters.AddWithValue("@Seminal_Fluid_Analysis_Male_B_HCG", flexCheckSeminalFluidAnalysis);
                        cmd.Parameters.AddWithValue("@Urine_examination", flexCheckUrineExamination);
                        cmd.Parameters.AddWithValue("@Stool_examination", flexCheckStoolExamination);
                        cmd.Parameters.AddWithValue("@Hemoglobin", flexCheckHemoglobin);
                        cmd.Parameters.AddWithValue("@Malaria", flexCheckMalaria);
                        cmd.Parameters.AddWithValue("@ESR", flexCheckESR);
                        cmd.Parameters.AddWithValue("@Blood_grouping", flexCheckBloodGrouping);
                        cmd.Parameters.AddWithValue("@Blood_sugar", flexCheckBloodSugar);
                        cmd.Parameters.AddWithValue("@CBC", flexCheckCBC);
                        cmd.Parameters.AddWithValue("@Cross_matching", flexCheckCrossMatching);
                        cmd.Parameters.AddWithValue("@TPHA", flexCheckTPHA);
                        cmd.Parameters.AddWithValue("@Human_immune_deficiency_HIV", flexCheckHIV);
                        cmd.Parameters.AddWithValue("@Hepatitis_B_virus_HBV", flexCheckHBV);
                        cmd.Parameters.AddWithValue("@Hepatitis_C_virus_HCV", flexCheckHCV);
                        cmd.Parameters.AddWithValue("@Brucella_melitensis", flexCheckBrucellaMelitensis);
                        cmd.Parameters.AddWithValue("@Brucella_abortus", flexCheckBrucellaAbortus);
                        cmd.Parameters.AddWithValue("@C_reactive_protein_CRP", flexCheckCRP);
                        cmd.Parameters.AddWithValue("@Rheumatoid_factor_RF", flexCheckRF);
                        cmd.Parameters.AddWithValue("@Antistreptolysin_O_ASO", flexCheckASO);
                        cmd.Parameters.AddWithValue("@Toxoplasmosis", flexCheckToxoplasmosis);
                        cmd.Parameters.AddWithValue("@Typhoid_hCG", flexCheckTyphoid);
                        cmd.Parameters.AddWithValue("@Hpylori_antibody", flexCheckHpyloriAntibody);
                        cmd.Parameters.AddWithValue("@Stool_occult_blood", flexCheckStoolOccultBlood);
                        cmd.Parameters.AddWithValue("@General_stool_examination", flexCheckGeneralStoolExamination);
                        cmd.Parameters.AddWithValue("@Thyroid_profile", flexCheckThyroidProfile);
                        cmd.Parameters.AddWithValue("@Triiodothyronine_T3", flexCheckT3);
                        cmd.Parameters.AddWithValue("@Thyroxine_T4", flexCheckT4);
                        cmd.Parameters.AddWithValue("@Thyroid_stimulating_hormone_TSH", flexCheckTSH);
                        cmd.Parameters.AddWithValue("@Sperm_examination", flexCheckSpermExamination);
                        cmd.Parameters.AddWithValue("@Virginal_swab_trichomonas_virginals", flexCheckVirginalSwab);
                        cmd.Parameters.AddWithValue("@Human_chorionic_gonadotropin_hCG", flexCheckHCG);
                        cmd.Parameters.AddWithValue("@Hpylori_Ag_stool", flexCheckHpyloriAgStool);
                        cmd.Parameters.AddWithValue("@Fasting_blood_sugar", flexCheckFastingBloodSugar);

                        cmd.ExecuteNonQuery();
                    }

                    using (SqlCommand cmd1 = new SqlCommand(patientUpdateQuery, con))
                    {

                        cmd1.Parameters.AddWithValue("@id", id);
                        cmd1.Parameters.AddWithValue("@presc", presc);
                        
                        cmd1.ExecuteNonQuery();
                    }



                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions and return the error message with detailed information
                return "Error in submitdata method: " + ex.Message + " - " + ex.StackTrace;
            }
        }


    }
}