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
    public partial class lap_operation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string updateLabTest(
    string id, 
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
    string flexCheckFastingBloodSugar, string flexCheckDirectBilirubin)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Update lab_test table
                    string labTestUpdateQuery = "UPDATE [lab_test] SET " +
                                                "[General_urine_examination] = @General_urine_examination, " +
                                                "[Progesterone_Female] = @Progesterone_Female, " +
                                                "[Amylase] = @Amylase, " +
                                                "[Magnesium] = @Magnesium, " +
                                                "[Phosphorous] = @Phosphorous, " +
                                                "[Calcium] = @Calcium, " +
                                                "[Chloride] = @Chloride, " +
                                                "[Potassium] = @Potassium, " +
                                                "[Sodium] = @Sodium, " +
                                                "[Uric_acid] = @Uric_acid, " +
                                                "[Creatinine] = @Creatinine, " +
                                                "[Urea] = @Urea, " +
                                                "[JGlobulin] = @JGlobulin, " +
                                                "[Albumin] = @Albumin, " +
                                                "[Total_bilirubin] = @Total_bilirubin, " +
                                                "[Alkaline_phosphates_ALP] = @Alkaline_phosphates_ALP, " +
                                                "[SGOT_AST] = @SGOT_AST, " +
                                                "[SGPT_ALT] = @SGPT_ALT, " +
                                                "[Triglycerides] = @Triglycerides, " +
                                                "[Total_cholesterol] = @Total_cholesterol, " +
                                                "[Hemoglobin_A1c] = @Hemoglobin_A1c, " +
                                                "[High_density_lipoprotein_HDL] = @High_density_lipoprotein_HDL, " +
                                                "[Low_density_lipoprotein_LDL] = @Low_density_lipoprotein_LDL, " +
                                                "[Follicle_stimulating_hormone_FSH] = @Follicle_stimulating_hormone_FSH, " +
                                                "[Estradiol] = @Estradiol, " +
                                                "[Luteinizing_hormone_LH] = @Luteinizing_hormone_LH, " +
                                                "[Testosterone_Male] = @Testosterone_Male, " +
                                                "[Prolactin] = @Prolactin, " +
                                                "[Seminal_Fluid_Analysis_Male_B_HCG] = @Seminal_Fluid_Analysis_Male_B_HCG, " +
                                                "[Urine_examination] = @Urine_examination, " +
                                                "[Stool_examination] = @Stool_examination, " +
                                                "[Hemoglobin] = @Hemoglobin, " +
                                                "[Malaria] = @Malaria, " +
                                                "[ESR] = @ESR, " +
                                                "[Blood_grouping] = @Blood_grouping, " +
                                                "[Blood_sugar] = @Blood_sugar, " +
                                                "[CBC] = @CBC, " +
                                                "[Cross_matching] = @Cross_matching, " +
                                                "[TPHA] = @TPHA, " +
                                                "[Human_immune_deficiency_HIV] = @Human_immune_deficiency_HIV, " +
                                                "[Hepatitis_B_virus_HBV] = @Hepatitis_B_virus_HBV, " +
                                                "[Hepatitis_C_virus_HCV] = @Hepatitis_C_virus_HCV, " +
                                                "[Brucella_melitensis] = @Brucella_melitensis, " +
                                                "[Brucella_abortus] = @Brucella_abortus, " +
                                                "[C_reactive_protein_CRP] = @C_reactive_protein_CRP, " +
                                                "[Rheumatoid_factor_RF] = @Rheumatoid_factor_RF, " +
                                                "[Antistreptolysin_O_ASO] = @Antistreptolysin_O_ASO, " +
                                                "[Toxoplasmosis] = @Toxoplasmosis, " +
                                                "[Typhoid_hCG] = @Typhoid_hCG, " +
                                                "[Hpylori_antibody] = @Hpylori_antibody, " +
                                                "[Stool_occult_blood] = @Stool_occult_blood, " +
                                                "[General_stool_examination] = @General_stool_examination, " +
                                                "[Thyroid_profile] = @Thyroid_profile, " +
                                                "[Triiodothyronine_T3] = @Triiodothyronine_T3, " +
                                                "[Thyroxine_T4] = @Thyroxine_T4, " +
                                                "[Thyroid_stimulating_hormone_TSH] = @Thyroid_stimulating_hormone_TSH, " +
                                                "[Sperm_examination] = @Sperm_examination, " +
                                                "[Virginal_swab_trichomonas_virginals] = @Virginal_swab_trichomonas_virginals, " +
                                                "[Human_chorionic_gonadotropin_hCG] = @Human_chorionic_gonadotropin_hCG, " +
                                                "[Hpylori_Ag_stool] = @Hpylori_Ag_stool, " +
                                                "[Fasting_blood_sugar] = @Fasting_blood_sugar, " +
                                                "[Direct_bilirubin] = @Direct_bilirubin " +
                                                "WHERE [med_id] = @id";

                    using (SqlCommand cmd = new SqlCommand(labTestUpdateQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
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
                        cmd.Parameters.AddWithValue("@Direct_bilirubin", flexCheckDirectBilirubin);

                        cmd.ExecuteNonQuery();
                    }

                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions
                return "Error in updateLabTest method: " + ex.Message + " - " + ex.StackTrace;
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
   string flexCheckFastingBloodSugar, string flexCheckDirectBilirubin)
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
                                                "[status] = 4 " +
                                              "WHERE [prescid] = @presc";

                    using (SqlCommand cmd = new SqlCommand(medicationQuery, con))
                    {


                        cmd.Parameters.AddWithValue("@Direct_bilirubin", flexCheckDirectBilirubin);

                        cmd.Parameters.AddWithValue("@prescid", id);
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














        public class ptclass1
        {
          

            // Additional lab test properties
            public string med_id { get; set; }
            public string Low_density_lipoprotein_LDL { get; set; }
            public string High_density_lipoprotein_HDL { get; set; }
            public string Total_cholesterol { get; set; }
            public string Triglycerides { get; set; }
            public string SGPT_ALT { get; set; }
            public string SGOT_AST { get; set; }
            public string Alkaline_phosphates_ALP { get; set; }
            public string Total_bilirubin { get; set; }
            public string Direct_bilirubin { get; set; }
            public string Albumin { get; set; }
            public string JGlobulin { get; set; }
            public string Urea { get; set; }
            public string Creatinine { get; set; }
            public string Uric_acid { get; set; }
            public string Sodium { get; set; }
            public string Potassium { get; set; }
            public string Chloride { get; set; }
            public string Calcium { get; set; }
            public string Phosphorous { get; set; }
            public string Magnesium { get; set; }
            public string Amylase { get; set; }
            public string Hemoglobin { get; set; }
            public string Malaria { get; set; }
            public string ESR { get; set; }
            public string Blood_grouping { get; set; }
            public string Blood_sugar { get; set; }
            public string CBC { get; set; }
            public string Cross_matching { get; set; }
            public string TPHA { get; set; }
            public string Human_immune_deficiency_HIV { get; set; }
            public string Hepatitis_B_virus_HBV { get; set; }
            public string Hepatitis_C_virus_HCV { get; set; }
            public string Brucella_melitensis { get; set; }
            public string Brucella_abortus { get; set; }
            public string C_reactive_protein_CRP { get; set; }
            public string Rheumatoid_factor_RF { get; set; }
            public string Antistreptolysin_O_ASO { get; set; }
            public string Toxoplasmosis { get; set; }
            public string Typhoid_hCG { get; set; }
            public string Hpylori_antibody { get; set; }
            public string Stool_occult_blood { get; set; }
            public string General_stool_examination { get; set; }
            public string Thyroid_profile { get; set; }
            public string Triiodothyronine_T3 { get; set; }
            public string Thyroxine_T4 { get; set; }
            public string Thyroid_stimulating_hormone_TSH { get; set; }
            public string Progesterone_Female { get; set; }
            public string Follicle_stimulating_hormone_FSH { get; set; }
            public string Estradiol { get; set; }
            public string Luteinizing_hormone_LH { get; set; }
            public string Testosterone_Male { get; set; }
            public string Prolactin { get; set; }
            public string Seminal_Fluid_Analysis_Male_B_HCG { get; set; }
            public string Urine_examination { get; set; }
            public string Stool_examination { get; set; }
            public string Sperm_examination { get; set; }
            public string Virginal_swab_trichomonas_virginals { get; set; }
            public string Human_chorionic_gonadotropin_hCG { get; set; }
            public string Hpylori_Ag_stool { get; set; }
            public string Fasting_blood_sugar { get; set; }
            public string Hemoglobin_A1c { get; set; }
            public string General_urine_examination { get; set; }
        }


        [WebMethod]
        public static ptclass1[] getlapprocessed(string search , string prescid)
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
    lab_test.prescid,
    lab_test.date_taken
FROM 
    patient
INNER JOIN 
    prescribtion ON patient.patientid = prescribtion.patientid
INNER JOIN 
    doctor ON prescribtion.doctorid = doctor.doctorid
LEFT JOIN 
    lab_test ON prescribtion.prescid = lab_test.prescid
WHERE 
    doctor.doctorid = @search
    AND lab_test.prescid = @prescid
ORDER BY 
    lab_test.date_taken DESC;



 ", con);
                cmd.Parameters.AddWithValue("@search", search);

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