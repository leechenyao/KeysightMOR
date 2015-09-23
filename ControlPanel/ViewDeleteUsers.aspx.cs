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
    public partial class ViewDeleteUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillAdminList();
                FillEmployeeList();
            }
        }

        protected void FillAdminList()
        {
            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            SqlCommand getUser = new SqlCommand("SELECT UserID, UserName, UserEmail, Position FROM [User] WHERE Position = 'Admin' AND Status = 1", sqlConn);
            SqlDataAdapter da = new SqlDataAdapter(getUser);
            DataSet dt = new DataSet();
            da.Fill(dt);
            AdminList.DataSource = dt;
            AdminList.DataBind();
            getUser.Dispose();
            sqlConn.Close();
        }

        protected void FillEmployeeList()
        {
            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            SqlCommand getUser = new SqlCommand("SELECT U.UserID, U.UserName, U.UserEmail, U.Position, stuff( (SELECT ', '+D.DivName FROM Division D, UserDivID UDI WHERE D.DivID = UDI.DivID AND U.UserID = UDI.UserID AND UDI.Status = 1 FOR XML PATH(''), TYPE).value('.', 'varchar(max)') ,1,1,'') AS DivName FROM [User] U WHERE U.Position = 'Employee' AND U.Status = 1", sqlConn);
            SqlDataAdapter da = new SqlDataAdapter(getUser);
            DataSet dt = new DataSet();
            da.Fill(dt);
            EmployeeList.DataSource = dt;
            EmployeeList.DataBind();
            getUser.Dispose();
            sqlConn.Close();
        }

        protected void AdminList_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            using (sqlConn)
            {
                try
                {
                    SqlCommand DeactiveAdmin = new SqlCommand("UPDATE dbo.[User] SET Status = 0 WHERE UserID = @userid", sqlConn);
                    DeactiveAdmin.Parameters.AddWithValue("@userid", AdminList.DataKeys[e.RowIndex]["UserID"]);

                    sqlConn.Open();
                    DeactiveAdmin.ExecuteNonQuery();
                    DeactivateUserStatus.Text = "Admin " + AdminList.Rows[e.RowIndex].Cells[1].Text + " successfully deleted";
                }
                catch(Exception ex)
                {
                    DeactivateUserStatus.ForeColor = System.Drawing.Color.Red;
                    DeactivateUserStatus.Text = ex.Message;
                }
            }
            FillAdminList();
        }

        protected void EmployeeList_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            using (sqlConn)
            {
                try
                {
                    SqlCommand DeactiveAdmin = new SqlCommand("UPDATE dbo.[User] SET Status = 0 WHERE UserID = @userid", sqlConn);
                    DeactiveAdmin.Parameters.AddWithValue("@userid", EmployeeList.DataKeys[e.RowIndex]["UserID"]);

                    sqlConn.Open();
                    DeactiveAdmin.ExecuteNonQuery();
                    DeactivateUserStatus.Text = "Employee " + EmployeeList.Rows[e.RowIndex].Cells[1].Text + " successfully deleted";
                }
                catch (Exception ex)
                {
                    DeactivateUserStatus.ForeColor = System.Drawing.Color.Red;
                    DeactivateUserStatus.Text = ex.Message;
                }
            }
            FillEmployeeList();
        }
    }
}