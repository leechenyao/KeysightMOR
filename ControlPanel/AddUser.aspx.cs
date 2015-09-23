using KeysightMOR.Assets;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace KeysightMOR.ControlPanel
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillDivisionList();
            }
        }

        protected void FillDivisionList()
        {
            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            SqlCommand getDivisionList = new SqlCommand("SELECT * FROM [Division] ORDER BY DivName", sqlConn);
            SqlDataAdapter da = new SqlDataAdapter(getDivisionList);
            DataSet dt = new DataSet();
            da.Fill(dt);
            DivisionList.DataSource = dt;
            DivisionList.DataBind();
            getDivisionList.Dispose();
            sqlConn.Close();  
        }

        protected void Position_Changed(object sender, EventArgs e)
        {
            if (Position.Text == "Employee")
                Table1.Rows[6].Visible = true;
            else
                Table1.Rows[6].Visible = false;
        }

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            // Shared.SqlConnString is obtained from Assets/Shared.cs file
            // At beginning of source code, add using statement "using KeysightMOR.Assets"
            bool checkselectdiv = false;
            foreach (GridViewRow row in DivisionList.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox SelectDivision = (row.Cells[0].FindControl("SelectDivision") as CheckBox);
                    if (SelectDivision.Checked)
                    {
                        checkselectdiv = true;
                    }
                }
            }

            lblAddUserStatus.Text = null;
            if (Position.Text == "Employee" && checkselectdiv == false)
            { 
                lblAddUserStatus.Text = "Please select at least 1 division";
            }              

            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            using (sqlConn)
            {
                try
                {
                    SqlCommand CheckEmail = new SqlCommand("SELECT * FROM dbo.[User] WHERE UserEmail = @UserEmail AND Status = 1", sqlConn);
                    CheckEmail.Parameters.AddWithValue("@UserEmail", usrEmail.Text);
                    sqlConn.Open();

                    SqlDataReader reader = CheckEmail.ExecuteReader();
                    EmailExist.Text = null;

                    if (reader.HasRows)
                    {
                        EmailExist.Text = "This email exists. Use another email";
                    }
                    else
                    {
                        string SqlAddUserCmd;

                        SqlAddUserCmd = "INSERT INTO dbo.[User](UserName, UserEmail, Password, Position, Status) VALUES (@UserName, @UserEmail, '12345', @Position, 1)";

                        SqlConnection sqlConn2 = new SqlConnection(Shared.SqlConnString);
                        SqlCommand sqlCmd = new SqlCommand(SqlAddUserCmd, sqlConn2);

                        sqlCmd.Parameters.AddWithValue("@UserName", usrName.Text);
                        sqlCmd.Parameters.AddWithValue("@UserEmail", usrEmail.Text);
                        sqlCmd.Parameters.AddWithValue("@Position", Position.Text);

                        using (sqlConn2)
                        {
                            try
                            {
                                if (!string.IsNullOrEmpty(usrName.Text) && !string.IsNullOrEmpty(usrEmail.Text) && ((Position.Text == "Employee" && checkselectdiv == true) || Position.Text == "Admin"))
                                {
                                    sqlConn2.Open();

                                    sqlCmd.ExecuteNonQuery();

                                    if (Position.Text == "Employee" && checkselectdiv == true)
                                    {
                                        SqlConnection sqlConn3 = new SqlConnection(Shared.SqlConnString);
                                        string userid = "";
                                        using (sqlConn3)
                                        {
                                            try
                                            {
                                                //if (!string.IsNullOrEmpty(txtAddCm.Text))
                                                //{
                                                SqlCommand getUserIDCmd = new SqlCommand("SELECT UserID FROM dbo.[User] WHERE UserEmail = @UserEmail", sqlConn3);
                                                getUserIDCmd.Parameters.AddWithValue("@UserEmail", usrEmail.Text);
                                                sqlConn3.Open();

                                                SqlDataReader reader1 = getUserIDCmd.ExecuteReader();

                                                if (reader1.HasRows)
                                                {
                                                    while (reader1.Read())
                                                    {
                                                        Console.WriteLine(String.Format("{0}", reader1[0]));
                                                        userid = reader1[0].ToString();
                                                    }
                                                }
                                                else
                                                {
                                                    Console.WriteLine("No rows found.");
                                                }
                                                reader1.Close();
                                            }
                                            //}
                                            catch (Exception ex)
                                            {
                                                // TODO: Use label to print any exception occurred at this stage
                                                lblAddUserStatus.Text = ex.Message;
                                            }
                                        }

                                        foreach (GridViewRow row in DivisionList.Rows)
                                        {
                                            if (row.RowType == DataControlRowType.DataRow)
                                            {
                                                CheckBox SelectDivision = (row.Cells[0].FindControl("SelectDivision") as CheckBox);
                                                if (SelectDivision.Checked)
                                                {
                                                    string SqlAddUserDivCmd = "INSERT INTO dbo.[UserDivID](DivID, UserID, Status) VALUES (@divisionid, @userid, 1)";
                                                    SqlConnection sqlConn4 = new SqlConnection(Shared.SqlConnString);
                                                    SqlCommand sqlCmd3 = new SqlCommand(SqlAddUserDivCmd, sqlConn4);
                                                    sqlCmd3.Parameters.AddWithValue("@userid", userid);
                                                    sqlCmd3.Parameters.AddWithValue("@divisionid", DivisionList.DataKeys[row.RowIndex]["DivID"]);

                                                    using (sqlConn4)
                                                    {
                                                        try
                                                        {
                                                            sqlConn4.Open();
                                                            sqlCmd3.ExecuteNonQuery();
                                                        }
                                                        catch (Exception ex)
                                                        {
                                                            //TODO: Use label to print any exception occurred at this stage
                                                            lblAddUserStatus.Text = ex.Message;
                                                        }

                                                    }
                                                }
                                                else
                                                {
                                                    string SqlAddUserDivCmd = "INSERT INTO dbo.[UserDivID](DivID, UserID, Status) VALUES (@divisionid, @userid, 0)";
                                                    SqlConnection sqlConn4 = new SqlConnection(Shared.SqlConnString);
                                                    SqlCommand sqlCmd3 = new SqlCommand(SqlAddUserDivCmd, sqlConn4);
                                                    sqlCmd3.Parameters.AddWithValue("@userid", userid);
                                                    sqlCmd3.Parameters.AddWithValue("@divisionid", DivisionList.DataKeys[row.RowIndex]["DivID"]);

                                                    using (sqlConn4)
                                                    {
                                                        try
                                                        {
                                                            sqlConn4.Open();
                                                            sqlCmd3.ExecuteNonQuery();
                                                        }
                                                        catch (Exception ex)
                                                        {
                                                            //TODO: Use label to print any exception occurred at this stage
                                                            lblAddUserStatus.Text = ex.Message;
                                                        }

                                                    }
                                                }
                                            }
                                        }                                    
                                    }

                                    StringBuilder sb = new StringBuilder();
                                    sb.Append("User " + usrName.Text + " successfully submitted");

                                    // TODO: Add confirmation message here
                                    lblAddUserStatus.ForeColor = System.Drawing.Color.Green;
                                    lblAddUserStatus.Text = sb.ToString();
                                    // Finally, clear the textbox
                                    usrName.Text = null;
                                    usrEmail.Text = null;
                                    Position.ClearSelection();
                                    Table1.Rows[6].Visible = false;
                                }
                            }
                            catch (Exception ex)
                            {
                                // TODO: Use label to print any exception occurred at this stage
                                lblAddUserStatus.Text = ex.Message;
                            }
                        }                  
                    }
                }
                catch (Exception ex) 
                {
                    lblAddUserStatus.Text = ex.Message;
                }      
            }        
        }
    }
}