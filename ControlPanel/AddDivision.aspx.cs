using KeysightMOR.Assets;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KeysightMOR.ControlPanel
{
    public partial class AddDivision : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateDivision_Click(object sender, EventArgs e)
        {
            // Shared.SqlConnString is obtained from Assets/Shared.cs file
            // At beginning of source code, add using statement "using KeysightMOR.Assets"

            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            using(sqlConn)
            {
                try
                {
                    SqlCommand CheckDivision = new SqlCommand("SELECT * FROM dbo.[Division] WHERE DivName = @divisionname", sqlConn);
                    CheckDivision.Parameters.AddWithValue("@divisionname", txtAddDivision.Text);
                    sqlConn.Open();

                    SqlDataReader reader = CheckDivision.ExecuteReader();

                    if (reader.HasRows)
                    {
                        lblAddDivisionStatus.Text = "Division Name exists. Use another name";
                    }
                    else
                    {
                        string SqlAddDivCmd = "INSERT INTO dbo.[Division](DivName) VALUES (@DivName)";

                        SqlConnection sqlConn2 = new SqlConnection(Shared.SqlConnString);
                        SqlCommand sqlCmd = new SqlCommand(SqlAddDivCmd, sqlConn2);

                        sqlCmd.Parameters.AddWithValue("@DivName", txtAddDivision.Text);

                        using (sqlConn2)
                        {
                            try
                            {
                                if (!string.IsNullOrEmpty(txtAddDivision.Text))
                                {
                                    sqlConn2.Open();

                                    sqlCmd.ExecuteNonQuery();

                                    StringBuilder sb = new StringBuilder();
                                    sb.Append("Division " + txtAddDivision.Text + " successfully submitted");

                                    // TODO: Add confirmation message here
                                    lblAddDivisionStatus.ForeColor = System.Drawing.Color.Green;
                                    lblAddDivisionStatus.Text = sb.ToString();

                                    // Finally, clear the textbox
                                    txtAddDivision.Text = null;
                                }
                            }
                            catch (Exception ex)
                            {
                                // TODO: Use label to print any exception occurred at this stage
                                lblAddDivisionStatus.Text = ex.Message;
                            }
                        }  
                    }
                }
                catch (Exception ex)
                {
                    // TODO: Use label to print any exception occurred at this stage
                    lblAddDivisionStatus.Text = ex.Message;
                }
            }          
        }
    }
}