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
    public partial class EditUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillUserList();
            }
        }

        protected void FillUserList() 
        {
            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            SqlCommand getUser = new SqlCommand("SELECT U.UserID, U.UserName, U.UserEmail, U.Position, stuff( (SELECT ', '+DivName FROM Division D, UserDivID UDI WHERE D.DivID = UDI.DivID AND U.UserID = UDI.UserID AND UDI.Status = 1 FOR XML PATH(''), TYPE).value('.', 'varchar(max)') ,1,1,'') AS DivName FROM [User] U WHERE U.Position = 'Employee' AND U.Status = 1", sqlConn);
            SqlDataAdapter da = new SqlDataAdapter(getUser);
            DataSet dt = new DataSet();
            da.Fill(dt);
            UserList.DataSource = dt;
            UserList.DataBind();
            getUser.Dispose();
            sqlConn.Close();
        }

        protected void UserList_RowEditing(object sender, GridViewEditEventArgs e)
        {
            UserList.EditIndex = e.NewEditIndex;
            EditUserStatus.Text = null;
            FillUserList();
            GridView gv2 = (GridView)UserList.Rows[e.NewEditIndex].FindControl("DivisionList");

            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);         

            using (sqlConn)
            {
                try
                {
                    SqlCommand getUserDivision = new SqlCommand("SELECT UDI.DivID FROM dbo.[User] U, [UserDivID] UDI WHERE U.UserID = UDI.UserID AND U.UserID = @userid AND UDI.Status = 1", sqlConn);
                    getUserDivision.Parameters.AddWithValue("@userid", UserList.DataKeys[e.NewEditIndex]["UserID"]);
                    sqlConn.Open();

                    SqlDataReader reader = getUserDivision.ExecuteReader();
                    if (reader.HasRows) 
                    {
                        while(reader.Read())
                        {
                            foreach (GridViewRow row in gv2.Rows)
                            {
                                if (row.RowType == DataControlRowType.DataRow)
                                {
                                    CheckBox SelectDivision = (row.Cells[0].FindControl("SelectDivision") as CheckBox);
                                    if (reader[0].ToString() == gv2.DataKeys[row.RowIndex]["DivID"].ToString())
                                    {
                                        SelectDivision.Checked = true;
                                    }
                                }
                            }
                        }                    
                    }
                }
                catch(Exception ex)
                {
                    EditUserStatus.Text = ex.Message;
                }
            }
            
        }
        
        protected void UserList_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            UserList.EditIndex = -1;
            FillUserList();
        }

        protected void UserList_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {            
            GridView gv2 = (GridView)UserList.Rows[e.RowIndex].FindControl("DivisionList");

            bool checkselectdiv = false;
            foreach (GridViewRow row in gv2.Rows)
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

            if (checkselectdiv == true) 
            { 
                foreach (GridViewRow row in gv2.Rows)
                {
                    bool exist = false;
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox SelectDivision = (row.Cells[0].FindControl("SelectDivision") as CheckBox);
                        if (SelectDivision.Checked)
                        {
                            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
                            using (sqlConn)
                            {
                                try 
                                {
                                    SqlCommand CheckUserDivID = new SqlCommand("SELECT * FROM dbo.[UserDivID] WHERE DivID = @divid AND UserID = @userid", sqlConn);
                                    CheckUserDivID.Parameters.AddWithValue("@divid", gv2.DataKeys[row.RowIndex]["DivID"]);
                                    CheckUserDivID.Parameters.AddWithValue("@userid", UserList.DataKeys[e.RowIndex]["UserID"]);

                                    sqlConn.Open();

                                    SqlDataReader reader = CheckUserDivID.ExecuteReader();

                                    if (reader.HasRows)
                                    {
                                        exist = true;
                                    }
                                }
                                catch (Exception ex)
                                {
                                    EditUserStatus.Text = ex.Message;
                                }
                            }

                            SqlConnection sqlConn2 = new SqlConnection(Shared.SqlConnString);
                            if (exist == true)
                            {
                                using (sqlConn2)
                                {
                                    try
                                    {
                                        SqlCommand ActiveDivision = new SqlCommand("UPDATE dbo.[UserDivID] SET Status = 1 WHERE DivID = @divid AND UserID = @userid", sqlConn2);
                                        ActiveDivision.Parameters.AddWithValue("@divid", gv2.DataKeys[row.RowIndex]["DivID"]);
                                        ActiveDivision.Parameters.AddWithValue("@userid", UserList.DataKeys[e.RowIndex]["UserID"]);

                                        sqlConn2.Open();
                                        ActiveDivision.ExecuteNonQuery();
                                    }
                                    catch (Exception ex)
                                    {
                                        EditUserStatus.Text = ex.Message;
                                    }
                                }
                            }
                            else 
                            {
                                using (sqlConn2)
                                {
                                    try
                                    {
                                        SqlCommand InsertUserDivID = new SqlCommand("INSERT INTO dbo.[UserDivID](UserID, DivID, Status) VALUES (@userid, @divid, 1)", sqlConn2);
                                        InsertUserDivID.Parameters.AddWithValue("@divid", gv2.DataKeys[row.RowIndex]["DivID"]);
                                        InsertUserDivID.Parameters.AddWithValue("@userid", UserList.DataKeys[e.RowIndex]["UserID"]);

                                        sqlConn2.Open();
                                        InsertUserDivID.ExecuteNonQuery();
                                    }
                                    catch (Exception ex)
                                    {
                                        EditUserStatus.Text = ex.Message;
                                    }
                                }
                            }
                        }
                        else
                        {
                            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
                            using (sqlConn)
                            {
                                try
                                {
                                    SqlCommand CheckUserDivID = new SqlCommand("SELECT * FROM dbo.[UserDivID] WHERE DivID = @divid AND UserID = @userid", sqlConn);
                                    CheckUserDivID.Parameters.AddWithValue("@divid", gv2.DataKeys[row.RowIndex]["DivID"]);
                                    CheckUserDivID.Parameters.AddWithValue("@userid", UserList.DataKeys[e.RowIndex]["UserID"]);

                                    sqlConn.Open();

                                    SqlDataReader reader = CheckUserDivID.ExecuteReader();

                                    if (reader.HasRows)
                                    {
                                        exist = true;
                                    }
                                }
                                catch (Exception ex)
                                {
                                    EditUserStatus.Text = ex.Message;
                                }
                            }

                            SqlConnection sqlConn2 = new SqlConnection(Shared.SqlConnString);
                            if (exist == true)
                            {
                                using (sqlConn2)
                                {
                                    try
                                    {
                                        SqlCommand ActiveDivision = new SqlCommand("UPDATE dbo.[UserDivID] SET Status = 0 WHERE DivID = @divid AND UserID = @userid", sqlConn2);
                                        ActiveDivision.Parameters.AddWithValue("@divid", gv2.DataKeys[row.RowIndex]["DivID"]);
                                        ActiveDivision.Parameters.AddWithValue("@userid", UserList.DataKeys[e.RowIndex]["UserID"]);

                                        sqlConn2.Open();
                                        ActiveDivision.ExecuteNonQuery();
                                    }
                                    catch (Exception ex)
                                    {
                                        EditUserStatus.Text = ex.Message;
                                    }
                                }
                            }
                            else
                            {
                                using (sqlConn2)
                                {
                                    try
                                    {
                                        SqlCommand InsertUserDivID = new SqlCommand("INSERT INTO dbo.[UserDivID](UserID, DivID, Status) VALUES (@userid, @divid, 0)", sqlConn2);
                                        InsertUserDivID.Parameters.AddWithValue("@divid", gv2.DataKeys[row.RowIndex]["DivID"]);
                                        InsertUserDivID.Parameters.AddWithValue("@userid", UserList.DataKeys[e.RowIndex]["UserID"]);

                                        sqlConn2.Open();
                                        InsertUserDivID.ExecuteNonQuery();
                                    }
                                    catch (Exception ex)
                                    {
                                        EditUserStatus.Text = ex.Message;
                                    }
                                }
                            }
                        }
                    }
                }
                EditUserStatus.Text = UserList.Rows[e.RowIndex].Cells[1].Text + "'s division successfully changed";
            }
            else
            {
                EditUserStatus.ForeColor = System.Drawing.Color.Red;
                EditUserStatus.Text = "Please select at least 1 division";
            }           
            UserList.EditIndex = -1;
            FillUserList();
        }
    }
}