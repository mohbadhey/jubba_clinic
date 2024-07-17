using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace juba_hospital
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateDropDownList();
            }
        }

        private void PopulateDropDownList()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string query = "select usertypeid, usertype from usertype"; // Adjust the query to match your table and columns

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    DropDownList1.DataSource = reader;
                    DropDownList1.DataValueField = "usertypeid"; // The value that will be stored
                    DropDownList1.DataTextField = "usertype"; // The text that will be displayed
                    DropDownList1.DataBind();
                }
            }

            // Optional: Add a default item
            DropDownList1.Items.Insert(0, new ListItem("Select a User", "0"));
        }

        protected void lognbtn_Click(object sender, EventArgs e)
        {
            string username = TextBoxUsername.Text;
            string password = TextBoxPassword.Text;
            int role = DropDownList1.SelectedIndex;

            string connectionString = WebConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = string.Empty;
                    string userIdField = string.Empty;
                    string nameField = string.Empty;
                    string redirectUrl = string.Empty;
                    string id = string.Empty;

                    switch (role)
                    {
                        case 1: // Doctor
                            query = @"
                                SELECT username AS UserId, password AS UserName , doctorid as id
                                FROM doctor 
                                WHERE username = @username AND password = @password";
                            userIdField = "UserId";
                            id = "id";
                            nameField = "UserName";
                            redirectUrl = "assignmed.aspx";



                            break;
                        case 2: // Xay
                            query = @"
                                SELECT username AS UserId, password AS UserName  , userid as id
                                FROM lab_user 
                                WHERE username = @username AND password = @password";
                            userIdField = "UserId";
                            id = "id";
                            nameField = "UserName";
                            redirectUrl = "lab_waiting_list.aspx";
                            break;
                        case 3:
                            query = @"
                                SELECT username AS UserId, password AS UserName , userid as id
                                FROM registre 
                                WHERE username = @username AND password = @password";
                            userIdField = "UserId";
                            id = "id";
                            nameField = "UserName";
                            redirectUrl = "Add_patients.aspx";
                            break;
                        case 4: // Xay
                            query = @"
                                SELECT username AS UserId, password AS UserName , userid as id
                                FROM admin 
                                WHERE username = @username AND password = @password";
                            userIdField = "UserId";
                            id = "id";
                            nameField = "UserName";
                            redirectUrl = "admin_dashbourd.aspx";
                            break;
                        case 5: // Xay
                            query = @"
                                SELECT username AS UserId, password AS UserName , userid as id
                                FROM xrayuser 
                                WHERE username = @username AND password = @password";
                            userIdField = "UserId";
                            id = "id";
                            nameField = "UserName";
                            redirectUrl = "take_xray.aspx";
                            break;

                     

                        default:
                            LabelMessage.Text = "Invalid role selected.";
                            return;
                    }

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", password);

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                Session["UserId"] = dr[userIdField].ToString();
                                Session["UserName"] = dr[nameField].ToString();
                                Session["id"] = dr[id].ToString();
                                Response.Redirect(redirectUrl);
                            }
                            else
                            {
                                LabelMessage.Text = "Invalid username or password.";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Label1.Text = "An error occurred: " + ex.Message;
                }
            }
        }
        }
}