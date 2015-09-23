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
    public partial class EvaluationSetting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string CMID = Request.QueryString["CMID"];
                string CriteriaID = Request.QueryString["CriteriaID"];
                if (CMID == null || CriteriaID == null)
                    Response.Redirect("~/SignIn.aspx");
                FillUserDivisionList();
            }
        }

        protected void FillUserDivisionList()
        {
            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            SqlCommand getUserDivisionList = new SqlCommand("SELECT U.UserName, UDI.UserDivID, D.DivName FROM dbo.[User] U, UserDivID UDI, Division D WHERE U.UserID = UDI.UserID AND UDI.DivID = D.DivID AND U.Position = 'Employee' AND UDI.Status = 1 ORDER BY D.DivName, U.UserName", sqlConn);
            SqlDataAdapter da = new SqlDataAdapter(getUserDivisionList);
            DataSet dt = new DataSet();
            da.Fill(dt);
            UserDivisionList.DataSource = dt;
            UserDivisionList.DataBind();
            getUserDivisionList.Dispose();
            sqlConn.Close();

            using(sqlConn)
            {
                try
                {
                    SqlCommand PretickUserDiv = new SqlCommand("SELECT UserDivID From dbo.[UserCriteria] WHERE CriteriaID = @CriteriaID AND CMID = @CMID", sqlConn);
                    PretickUserDiv.Parameters.AddWithValue("@CMID", Request.QueryString["CMID"]);
                    PretickUserDiv.Parameters.AddWithValue("@CriteriaID", Request.QueryString["CriteriaID"]);
                    sqlConn.Open();

                    SqlDataReader reader = PretickUserDiv.ExecuteReader();

                    if(reader.HasRows)
                    {
                        while(reader.Read())
                        {
                            foreach (GridViewRow row in UserDivisionList.Rows)
                            {
                                if (row.RowType == DataControlRowType.DataRow)
                                {
                                    CheckBox SelectUserDivision = (row.Cells[0].FindControl("SelectUserDivision") as CheckBox);
                                    if (reader[0].ToString() == UserDivisionList.DataKeys[row.RowIndex]["UserDivID"].ToString())
                                    {                                      
                                        SelectUserDivision.Checked = true;
                                    }
                                }
                            }
                        }
                    }
                }
                catch
                {
                
                }
            }
            

            
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            bool checkselectusercriteria = false;

            foreach (GridViewRow row in UserDivisionList.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox SelectUserDivision = (row.Cells[0].FindControl("SelectUserDivision") as CheckBox);
                    if (SelectUserDivision.Checked)
                    {
                        checkselectusercriteria = true;
                    }
                }
            }

            if (checkselectusercriteria == true)
            {
                SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);

                using (sqlConn)
                {
                    try
                    {
                        SqlCommand DeleteUserCriteria = new SqlCommand("DELETE FROM dbo.[UserCriteria] WHERE CMID = @CMID AND CriteriaID = @CriteriaID", sqlConn);
                        DeleteUserCriteria.Parameters.AddWithValue("@CMID", Request.QueryString["CMID"]);
                        DeleteUserCriteria.Parameters.AddWithValue("@CriteriaID", Request.QueryString["CriteriaID"]);
                        sqlConn.Open();
                        DeleteUserCriteria.ExecuteNonQuery();
                    }
                    catch
                    {
                        criteria.Text = "fail";
                    }
                }

                foreach (GridViewRow row in UserDivisionList.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox SelectUserDivision = (row.Cells[0].FindControl("SelectUserDivision") as CheckBox);
                        if (SelectUserDivision.Checked)
                        {
                            string AddUserCriteria = "INSERT INTO dbo.[UserCriteria](CriteriaID, UserDivID, CMID) VALUES (@CriteriaID, @UserDivID, @CMID)";
                            SqlConnection sqlConn2 = new SqlConnection(Shared.SqlConnString);
                            SqlCommand sqlCmd = new SqlCommand(AddUserCriteria, sqlConn2);
                            sqlCmd.Parameters.AddWithValue("@CriteriaID", Request.QueryString["CriteriaID"]);
                            sqlCmd.Parameters.AddWithValue("@UserDivID", UserDivisionList.DataKeys[row.RowIndex]["UserDivID"]);
                            sqlCmd.Parameters.AddWithValue("@CMID", Request.QueryString["CMID"]);
                            using (sqlConn2)
                            {
                                try
                                {
                                    sqlConn2.Open();
                                    sqlCmd.ExecuteNonQuery();
                                    AddUserCriteriaStatus.Text = "User Criteria successfully added";
                                }
                                catch
                                {

                                }
                            }
                        }
                    }
                }
            }
            else
            {
                AddUserCriteriaStatus.ForeColor = System.Drawing.Color.Red;
                AddUserCriteriaStatus.Text = "Please select at least 1 user";
            }
        }
    }
}