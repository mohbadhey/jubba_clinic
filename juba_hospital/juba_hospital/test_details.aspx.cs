using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static juba_hospital.assignmed;
using static juba_hospital.lap_operation;

namespace juba_hospital
{
    public partial class test_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static ptclass1[] editlabmedic(string prescid)
        {
            List<ptclass1> details = new List<ptclass1>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"

 SELECT 
    lab_results.lab_result_id,
    lab_results.Low_density_lipoprotein_LDL,
    lab_results.High_density_lipoprotein_HDL,
    lab_results.Total_cholesterol,
    lab_results.Triglycerides,
    lab_results.SGPT_ALT,
    lab_results.SGOT_AST,
    lab_results.Alkaline_phosphates_ALP,
    lab_results.Total_bilirubin,
    lab_results.Direct_bilirubin,
    lab_results.Albumin,
    lab_results.JGlobulin,
    lab_results.Urea,
    lab_results.Creatinine,
    lab_results.Uric_acid,
    lab_results.Sodium,
    lab_results.Potassium,
    lab_results.Chloride,
    lab_results.Calcium,
    lab_results.Phosphorous,
    lab_results.Magnesium,
    lab_results.Amylase,
    lab_results.Hemoglobin,
    lab_results.Malaria,
    lab_results.ESR,
    lab_results.Blood_grouping,
    lab_results.Blood_sugar,
    lab_results.CBC,
    lab_results.Cross_matching,
    lab_results.TPHA,
    lab_results.Human_immune_deficiency_HIV,
    lab_results.Hepatitis_B_virus_HBV,
    lab_results.Hepatitis_C_virus_HCV,
    lab_results.Brucella_melitensis,
    lab_results.Brucella_abortus,
    lab_results.C_reactive_protein_CRP,
    lab_results.Rheumatoid_factor_RF,
    lab_results.Antistreptolysin_O_ASO,
    lab_results.Toxoplasmosis,
    lab_results.Typhoid_hCG,
    lab_results.Hpylori_antibody,
    lab_results.Stool_occult_blood,
    lab_results.General_stool_examination,
    lab_results.Thyroid_profile,
    lab_results.Triiodothyronine_T3,
    lab_results.Thyroxine_T4,
    lab_results.Thyroid_stimulating_hormone_TSH,
    lab_results.Progesterone_Female,
    lab_results.Follicle_stimulating_hormone_FSH,
    lab_results.Estradiol,
    lab_results.Luteinizing_hormone_LH,
    lab_results.Testosterone_Male,
    lab_results.Prolactin,
    lab_results.Seminal_Fluid_Analysis_Male_B_HCG,
    lab_results.Urine_examination,
    lab_results.Stool_examination,
    lab_results.Sperm_examination,
    lab_results.Virginal_swab_trichomonas_virginals,
    lab_results.Human_chorionic_gonadotropin_hCG,
    lab_results.Hpylori_Ag_stool,
    lab_results.Fasting_blood_sugar,
    lab_results.Hemoglobin_A1c,
    lab_results.General_urine_examination,
    lab_results.prescid
FROM 
    patient
INNER JOIN 
    prescribtion ON patient.patientid = prescribtion.patientid
INNER JOIN 
    doctor ON prescribtion.doctorid = doctor.doctorid
LEFT JOIN 
    lab_results ON prescribtion.prescid = lab_results.prescid
WHERE 
    lab_results.prescid = @search;


 ", con);
                cmd.Parameters.AddWithValue("@search", prescid);


                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        ptclass1 field = new ptclass1();


                        field.med_id = dr["lab_result_id"].ToString();
                        field.Low_density_lipoprotein_LDL = dr["Low_density_lipoprotein_LDL"].ToString();
                        field.High_density_lipoprotein_HDL = dr["High_density_lipoprotein_HDL"].ToString();
                        field.Total_cholesterol = dr["Total_cholesterol"].ToString();
                        field.Triglycerides = dr["Triglycerides"].ToString();
                        field.SGPT_ALT = dr["SGPT_ALT"].ToString();
                        field.SGOT_AST = dr["SGOT_AST"].ToString();
                        field.Alkaline_phosphates_ALP = dr["Alkaline_phosphates_ALP"].ToString();
                        field.Total_bilirubin = dr["Total_bilirubin"].ToString();
                        field.Direct_bilirubin = dr["Direct_bilirubin"].ToString();
                        field.Albumin = dr["Albumin"].ToString();
                        field.JGlobulin = dr["JGlobulin"].ToString();
                        field.Urea = dr["Urea"].ToString();
                        field.Creatinine = dr["Creatinine"].ToString();
                        field.Uric_acid = dr["Uric_acid"].ToString();
                        field.Sodium = dr["Sodium"].ToString();
                        field.Potassium = dr["Potassium"].ToString();
                        field.Chloride = dr["Chloride"].ToString();
                        field.Calcium = dr["Calcium"].ToString();
                        field.Phosphorous = dr["Phosphorous"].ToString();
                        field.Magnesium = dr["Magnesium"].ToString();
                        field.Amylase = dr["Amylase"].ToString();
                        field.Hemoglobin = dr["Hemoglobin"].ToString();
                        field.Malaria = dr["Malaria"].ToString();
                        field.ESR = dr["ESR"].ToString();
                        field.Blood_grouping = dr["Blood_grouping"].ToString();
                        field.Blood_sugar = dr["Blood_sugar"].ToString();
                        field.CBC = dr["CBC"].ToString();
                        field.Cross_matching = dr["Cross_matching"].ToString();
                        field.TPHA = dr["TPHA"].ToString();
                        field.Human_immune_deficiency_HIV = dr["Human_immune_deficiency_HIV"].ToString();
                        field.Hepatitis_B_virus_HBV = dr["Hepatitis_B_virus_HBV"].ToString();
                        field.Hepatitis_C_virus_HCV = dr["Hepatitis_C_virus_HCV"].ToString();
                        field.Brucella_melitensis = dr["Brucella_melitensis"].ToString();
                        field.Brucella_abortus = dr["Brucella_abortus"].ToString();
                        field.C_reactive_protein_CRP = dr["C_reactive_protein_CRP"].ToString();
                        field.Rheumatoid_factor_RF = dr["Rheumatoid_factor_RF"].ToString();
                        field.Antistreptolysin_O_ASO = dr["Antistreptolysin_O_ASO"].ToString();
                        field.Toxoplasmosis = dr["Toxoplasmosis"].ToString();
                        field.Typhoid_hCG = dr["Typhoid_hCG"].ToString();
                        field.Hpylori_antibody = dr["Hpylori_antibody"].ToString();
                        field.Stool_occult_blood = dr["Stool_occult_blood"].ToString();
                        field.General_stool_examination = dr["General_stool_examination"].ToString();
                        field.Thyroid_profile = dr["Thyroid_profile"].ToString();
                        field.Triiodothyronine_T3 = dr["Triiodothyronine_T3"].ToString();
                        field.Thyroxine_T4 = dr["Thyroxine_T4"].ToString();
                        field.Thyroid_stimulating_hormone_TSH = dr["Thyroid_stimulating_hormone_TSH"].ToString();
                        field.Progesterone_Female = dr["Progesterone_Female"].ToString();
                        field.Follicle_stimulating_hormone_FSH = dr["Follicle_stimulating_hormone_FSH"].ToString();
                        field.Estradiol = dr["Estradiol"].ToString();
                        field.Luteinizing_hormone_LH = dr["Luteinizing_hormone_LH"].ToString();
                        field.Testosterone_Male = dr["Testosterone_Male"].ToString();
                        field.Prolactin = dr["Prolactin"].ToString();
                        field.Seminal_Fluid_Analysis_Male_B_HCG = dr["Seminal_Fluid_Analysis_Male_B_HCG"].ToString();
                        field.Urine_examination = dr["Urine_examination"].ToString();
                        field.Stool_examination = dr["Stool_examination"].ToString();
                        field.Sperm_examination = dr["Sperm_examination"].ToString();
                        field.Virginal_swab_trichomonas_virginals = dr["Virginal_swab_trichomonas_virginals"].ToString();
                        field.Human_chorionic_gonadotropin_hCG = dr["Human_chorionic_gonadotropin_hCG"].ToString();
                        field.Hpylori_Ag_stool = dr["Hpylori_Ag_stool"].ToString();
                        field.Fasting_blood_sugar = dr["Fasting_blood_sugar"].ToString();
                        field.Hemoglobin_A1c = dr["Hemoglobin_A1c"].ToString();
                        field.General_urine_examination = dr["General_urine_examination"].ToString();



                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }

        [WebMethod]
        public static string submitdata(

  string prescid, string id,
string flexCheckGeneralUrineExamination1, string flexCheckProgesteroneFemale1, string flexCheckAmylase1, string flexCheckMagnesium1,
string flexCheckPhosphorous1, string flexCheckCalcium1, string flexCheckChloride1, string flexCheckPotassium1,
string flexCheckSodium1, string flexCheckUricAcid1, string flexCheckCreatinine1, string flexCheckUrea1,
string flexCheckJGlobulin1, string flexCheckAlbumin1, string flexCheckTotalBilirubin1, string flexCheckAlkalinePhosphatesALP1,
string flexCheckSGOTAST1, string flexCheckSGPTALT1, string flexCheckLiverFunctionTest1, string flexCheckTriglycerides1,
string flexCheckTotalCholesterol1, string flexCheckHemoglobinA1c1, string flexCheckHDL1, string flexCheckLDL1,
string flexCheckFSH1, string flexCheckEstradiol1, string flexCheckLH1,
string flexCheckTestosteroneMale1, string flexCheckProlactin1, string flexCheckSeminalFluidAnalysis1, string flexCheckBHCG1,
string flexCheckUrineExamination1, string flexCheckStoolExamination1, string flexCheckHemoglobin1, string flexCheckMalaria1,
string flexCheckESR1, string flexCheckBloodGrouping1, string flexCheckBloodSugar1, string flexCheckCBC1,
string flexCheckCrossMatching1, string flexCheckTPHA1, string flexCheckHIV1, string flexCheckHBV1,
string flexCheckHCV1, string flexCheckBrucellaMelitensis1, string flexCheckBrucellaAbortus1, string flexCheckCRP1,
string flexCheckRF1, string flexCheckASO1, string flexCheckToxoplasmosis1, string flexCheckTyphoid1,
string flexCheckHpyloriAntibody1, string flexCheckStoolOccultBlood1, string flexCheckGeneralStoolExamination1, string flexCheckThyroidProfile1,
string flexCheckT31, string flexCheckT41, string flexCheckTSH1, string flexCheckSpermExamination1,
string flexCheckVirginalSwab1, string flexCheckTrichomonasVirginals1, string flexCheckHCG1, string flexCheckHpyloriAgStool1,
string flexCheckFastingBloodSugar1, string flexCheckDirectBilirubin1

)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;


            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Insert into medication table
                    string medicationQuery = @"
                INSERT INTO lab_results (
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
                                                "[status] = 5 " +
                                              "WHERE [prescid] = @presc";

                    using (SqlCommand cmd = new SqlCommand(medicationQuery, con))
                    {


                        cmd.Parameters.AddWithValue("@Direct_bilirubin", flexCheckDirectBilirubin1);

                        cmd.Parameters.AddWithValue("@prescid", prescid);
                        cmd.Parameters.AddWithValue("@General_urine_examination", flexCheckGeneralUrineExamination1);
                        cmd.Parameters.AddWithValue("@Progesterone_Female", flexCheckProgesteroneFemale1);
                        cmd.Parameters.AddWithValue("@Amylase", flexCheckAmylase1);
                        cmd.Parameters.AddWithValue("@Magnesium", flexCheckMagnesium1);
                        cmd.Parameters.AddWithValue("@Phosphorous", flexCheckPhosphorous1);
                        cmd.Parameters.AddWithValue("@Calcium", flexCheckCalcium1);
                        cmd.Parameters.AddWithValue("@Chloride", flexCheckChloride1);
                        cmd.Parameters.AddWithValue("@Potassium", flexCheckPotassium1);
                        cmd.Parameters.AddWithValue("@Sodium", flexCheckSodium1);
                        cmd.Parameters.AddWithValue("@Uric_acid", flexCheckUricAcid1);
                        cmd.Parameters.AddWithValue("@Creatinine", flexCheckCreatinine1);
                        cmd.Parameters.AddWithValue("@Urea", flexCheckUrea1);
                        cmd.Parameters.AddWithValue("@JGlobulin", flexCheckJGlobulin1);
                        cmd.Parameters.AddWithValue("@Albumin", flexCheckAlbumin1);
                        cmd.Parameters.AddWithValue("@Total_bilirubin", flexCheckTotalBilirubin1);
                        cmd.Parameters.AddWithValue("@Alkaline_phosphates_ALP", flexCheckAlkalinePhosphatesALP1);
                        cmd.Parameters.AddWithValue("@SGOT_AST", flexCheckSGOTAST1);
                        cmd.Parameters.AddWithValue("@SGPT_ALT", flexCheckSGPTALT1);

                        cmd.Parameters.AddWithValue("@Triglycerides", flexCheckTriglycerides1);
                        cmd.Parameters.AddWithValue("@Total_cholesterol", flexCheckTotalCholesterol1);
                        cmd.Parameters.AddWithValue("@Hemoglobin_A1c", flexCheckHemoglobinA1c1);
                        cmd.Parameters.AddWithValue("@High_density_lipoprotein_HDL", flexCheckHDL1);
                        cmd.Parameters.AddWithValue("@Low_density_lipoprotein_LDL", flexCheckLDL1);

                        cmd.Parameters.AddWithValue("@Follicle_stimulating_hormone_FSH", flexCheckFSH1);
                        cmd.Parameters.AddWithValue("@Estradiol", flexCheckEstradiol1);
                        cmd.Parameters.AddWithValue("@Luteinizing_hormone_LH", flexCheckLH1);
                        cmd.Parameters.AddWithValue("@Testosterone_Male", flexCheckTestosteroneMale1);
                        cmd.Parameters.AddWithValue("@Prolactin", flexCheckProlactin1);
                        cmd.Parameters.AddWithValue("@Seminal_Fluid_Analysis_Male_B_HCG", flexCheckSeminalFluidAnalysis1);
                        cmd.Parameters.AddWithValue("@Urine_examination", flexCheckUrineExamination1);
                        cmd.Parameters.AddWithValue("@Stool_examination", flexCheckStoolExamination1);
                        cmd.Parameters.AddWithValue("@Hemoglobin", flexCheckHemoglobin1);
                        cmd.Parameters.AddWithValue("@Malaria", flexCheckMalaria1);
                        cmd.Parameters.AddWithValue("@ESR", flexCheckESR1);
                        cmd.Parameters.AddWithValue("@Blood_grouping", flexCheckBloodGrouping1);
                        cmd.Parameters.AddWithValue("@Blood_sugar", flexCheckBloodSugar1);
                        cmd.Parameters.AddWithValue("@CBC", flexCheckCBC1);
                        cmd.Parameters.AddWithValue("@Cross_matching", flexCheckCrossMatching1);
                        cmd.Parameters.AddWithValue("@TPHA", flexCheckTPHA1);
                        cmd.Parameters.AddWithValue("@Human_immune_deficiency_HIV", flexCheckHIV1);
                        cmd.Parameters.AddWithValue("@Hepatitis_B_virus_HBV", flexCheckHBV1);
                        cmd.Parameters.AddWithValue("@Hepatitis_C_virus_HCV", flexCheckHCV1);
                        cmd.Parameters.AddWithValue("@Brucella_melitensis", flexCheckBrucellaMelitensis1);
                        cmd.Parameters.AddWithValue("@Brucella_abortus", flexCheckBrucellaAbortus1);
                        cmd.Parameters.AddWithValue("@C_reactive_protein_CRP", flexCheckCRP1);
                        cmd.Parameters.AddWithValue("@Rheumatoid_factor_RF", flexCheckRF1);
                        cmd.Parameters.AddWithValue("@Antistreptolysin_O_ASO", flexCheckASO1);
                        cmd.Parameters.AddWithValue("@Toxoplasmosis", flexCheckToxoplasmosis1);
                        cmd.Parameters.AddWithValue("@Typhoid_hCG", flexCheckTyphoid1);
                        cmd.Parameters.AddWithValue("@Hpylori_antibody", flexCheckHpyloriAntibody1);
                        cmd.Parameters.AddWithValue("@Stool_occult_blood", flexCheckStoolOccultBlood1);
                        cmd.Parameters.AddWithValue("@General_stool_examination", flexCheckGeneralStoolExamination1);
                        cmd.Parameters.AddWithValue("@Thyroid_profile", flexCheckThyroidProfile1);
                        cmd.Parameters.AddWithValue("@Triiodothyronine_T3", flexCheckT31);
                        cmd.Parameters.AddWithValue("@Thyroxine_T4", flexCheckT41);
                        cmd.Parameters.AddWithValue("@Thyroid_stimulating_hormone_TSH", flexCheckTSH1);
                        cmd.Parameters.AddWithValue("@Sperm_examination", flexCheckSpermExamination1);
                        cmd.Parameters.AddWithValue("@Virginal_swab_trichomonas_virginals", flexCheckVirginalSwab1);
                        cmd.Parameters.AddWithValue("@Human_chorionic_gonadotropin_hCG", flexCheckHCG1);
                        cmd.Parameters.AddWithValue("@Hpylori_Ag_stool", flexCheckHpyloriAgStool1);
                        cmd.Parameters.AddWithValue("@Fasting_blood_sugar", flexCheckFastingBloodSugar1);


                        cmd.ExecuteNonQuery();
                    }

                    using (SqlCommand cmd1 = new SqlCommand(patientUpdateQuery, con))
                    {

                        cmd1.Parameters.AddWithValue("@id", id);
                        cmd1.Parameters.AddWithValue("@presc", prescid);

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
        public static ptclass1[] getlapprocessed(string prescid)
        {
            List<ptclass1> details = new List<ptclass1>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"

	    SELECT 
    lab_test.med_id,
    lab_test.Low_density_lipoprotein_LDL,
    lab_test.High_density_lipoprotein_HDL,
    lab_test.Total_cholesterol,
    lab_test.Triglycerides,
    lab_test.SGPT_ALT,
    lab_test.SGOT_AST,
    lab_test.Alkaline_phosphates_ALP,
    lab_test.Total_bilirubin,
    lab_test.Direct_bilirubin,
    lab_test.Albumin,
    lab_test.JGlobulin,
    lab_test.Urea,
    lab_test.Creatinine,
    lab_test.Uric_acid,
    lab_test.Sodium,
    lab_test.Potassium,
    lab_test.Chloride,
    lab_test.Calcium,
    lab_test.Phosphorous,
    lab_test.Magnesium,
    lab_test.Amylase,
    lab_test.Hemoglobin,
    lab_test.Malaria,
    lab_test.ESR,
    lab_test.Blood_grouping,
    lab_test.Blood_sugar,
    lab_test.CBC,
    lab_test.Cross_matching,
    lab_test.TPHA,
    lab_test.Human_immune_deficiency_HIV,
    lab_test.Hepatitis_B_virus_HBV,
    lab_test.Hepatitis_C_virus_HCV,
    lab_test.Brucella_melitensis,
    lab_test.Brucella_abortus,
    lab_test.C_reactive_protein_CRP,
    lab_test.Rheumatoid_factor_RF,
    lab_test.Antistreptolysin_O_ASO,
    lab_test.Toxoplasmosis,
    lab_test.Typhoid_hCG,
    lab_test.Hpylori_antibody,
    lab_test.Stool_occult_blood,
    lab_test.General_stool_examination,
    lab_test.Thyroid_profile,
    lab_test.Triiodothyronine_T3,
    lab_test.Thyroxine_T4,
    lab_test.Thyroid_stimulating_hormone_TSH,
    lab_test.Progesterone_Female,
    lab_test.Follicle_stimulating_hormone_FSH,
    lab_test.Estradiol,
    lab_test.Luteinizing_hormone_LH,
    lab_test.Testosterone_Male,
    lab_test.Prolactin,
    lab_test.Seminal_Fluid_Analysis_Male_B_HCG,
    lab_test.Urine_examination,
    lab_test.Stool_examination,
    lab_test.Sperm_examination,
    lab_test.Virginal_swab_trichomonas_virginals,
    lab_test.Human_chorionic_gonadotropin_hCG,
    lab_test.Hpylori_Ag_stool,
    lab_test.Fasting_blood_sugar,
    lab_test.Hemoglobin_A1c,
    lab_test.General_urine_examination,
    lab_test.prescid
FROM 
    patient
INNER JOIN 
    prescribtion ON patient.patientid = prescribtion.patientid
INNER JOIN 
    doctor ON prescribtion.doctorid = doctor.doctorid
LEFT JOIN 
    lab_test ON prescribtion.prescid = lab_test.prescid
WHERE 

  
     lab_test.prescid = @prescid;


 ", con);
              

                cmd.Parameters.AddWithValue("@prescid", prescid);
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        ptclass1 field = new ptclass1();


                        field.med_id = dr["med_id"].ToString();
                        field.Low_density_lipoprotein_LDL = dr["Low_density_lipoprotein_LDL"].ToString();
                        field.High_density_lipoprotein_HDL = dr["High_density_lipoprotein_HDL"].ToString();
                        field.Total_cholesterol = dr["Total_cholesterol"].ToString();
                        field.Triglycerides = dr["Triglycerides"].ToString();
                        field.SGPT_ALT = dr["SGPT_ALT"].ToString();
                        field.SGOT_AST = dr["SGOT_AST"].ToString();
                        field.Alkaline_phosphates_ALP = dr["Alkaline_phosphates_ALP"].ToString();
                        field.Total_bilirubin = dr["Total_bilirubin"].ToString();
                        field.Direct_bilirubin = dr["Direct_bilirubin"].ToString();
                        field.Albumin = dr["Albumin"].ToString();
                        field.JGlobulin = dr["JGlobulin"].ToString();
                        field.Urea = dr["Urea"].ToString();
                        field.Creatinine = dr["Creatinine"].ToString();
                        field.Uric_acid = dr["Uric_acid"].ToString();
                        field.Sodium = dr["Sodium"].ToString();
                        field.Potassium = dr["Potassium"].ToString();
                        field.Chloride = dr["Chloride"].ToString();
                        field.Calcium = dr["Calcium"].ToString();
                        field.Phosphorous = dr["Phosphorous"].ToString();
                        field.Magnesium = dr["Magnesium"].ToString();
                        field.Amylase = dr["Amylase"].ToString();
                        field.Hemoglobin = dr["Hemoglobin"].ToString();
                        field.Malaria = dr["Malaria"].ToString();
                        field.ESR = dr["ESR"].ToString();
                        field.Blood_grouping = dr["Blood_grouping"].ToString();
                        field.Blood_sugar = dr["Blood_sugar"].ToString();
                        field.CBC = dr["CBC"].ToString();
                        field.Cross_matching = dr["Cross_matching"].ToString();
                        field.TPHA = dr["TPHA"].ToString();
                        field.Human_immune_deficiency_HIV = dr["Human_immune_deficiency_HIV"].ToString();
                        field.Hepatitis_B_virus_HBV = dr["Hepatitis_B_virus_HBV"].ToString();
                        field.Hepatitis_C_virus_HCV = dr["Hepatitis_C_virus_HCV"].ToString();
                        field.Brucella_melitensis = dr["Brucella_melitensis"].ToString();
                        field.Brucella_abortus = dr["Brucella_abortus"].ToString();
                        field.C_reactive_protein_CRP = dr["C_reactive_protein_CRP"].ToString();
                        field.Rheumatoid_factor_RF = dr["Rheumatoid_factor_RF"].ToString();
                        field.Antistreptolysin_O_ASO = dr["Antistreptolysin_O_ASO"].ToString();
                        field.Toxoplasmosis = dr["Toxoplasmosis"].ToString();
                        field.Typhoid_hCG = dr["Typhoid_hCG"].ToString();
                        field.Hpylori_antibody = dr["Hpylori_antibody"].ToString();
                        field.Stool_occult_blood = dr["Stool_occult_blood"].ToString();
                        field.General_stool_examination = dr["General_stool_examination"].ToString();
                        field.Thyroid_profile = dr["Thyroid_profile"].ToString();
                        field.Triiodothyronine_T3 = dr["Triiodothyronine_T3"].ToString();
                        field.Thyroxine_T4 = dr["Thyroxine_T4"].ToString();
                        field.Thyroid_stimulating_hormone_TSH = dr["Thyroid_stimulating_hormone_TSH"].ToString();
                        field.Progesterone_Female = dr["Progesterone_Female"].ToString();
                        field.Follicle_stimulating_hormone_FSH = dr["Follicle_stimulating_hormone_FSH"].ToString();
                        field.Estradiol = dr["Estradiol"].ToString();
                        field.Luteinizing_hormone_LH = dr["Luteinizing_hormone_LH"].ToString();
                        field.Testosterone_Male = dr["Testosterone_Male"].ToString();
                        field.Prolactin = dr["Prolactin"].ToString();
                        field.Seminal_Fluid_Analysis_Male_B_HCG = dr["Seminal_Fluid_Analysis_Male_B_HCG"].ToString();
                        field.Urine_examination = dr["Urine_examination"].ToString();
                        field.Stool_examination = dr["Stool_examination"].ToString();
                        field.Sperm_examination = dr["Sperm_examination"].ToString();
                        field.Virginal_swab_trichomonas_virginals = dr["Virginal_swab_trichomonas_virginals"].ToString();
                        field.Human_chorionic_gonadotropin_hCG = dr["Human_chorionic_gonadotropin_hCG"].ToString();
                        field.Hpylori_Ag_stool = dr["Hpylori_Ag_stool"].ToString();
                        field.Fasting_blood_sugar = dr["Fasting_blood_sugar"].ToString();
                        field.Hemoglobin_A1c = dr["Hemoglobin_A1c"].ToString();
                        field.General_urine_examination = dr["General_urine_examination"].ToString();

                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }
    }
}