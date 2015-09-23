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
    public partial class ViewDeleteCM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillCMlist();
            }
        }

        protected void FillCMlist()
        {
            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            SqlCommand getCM = new SqlCommand("SELECT * FROM dbo.[CM]", sqlConn);
            SqlDataAdapter da = new SqlDataAdapter(getCM);
            DataSet dt = new DataSet();
            da.Fill(dt);
            CMList.DataSource = dt;
            CMList.DataBind();
            getCM.Dispose();
            sqlConn.Close();
        }

        protected void CMList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            SqlCommand DeleteCM = new SqlCommand("DELETE FROM dbo.[CM] WHERE CMID = @CMID", sqlConn);
            DeleteCM.Parameters.AddWithValue("@CMID", CMList.DataKeys[e.RowIndex]["CMID"]);

            using (sqlConn)
            {
                try
                {
                    sqlConn.Open();
                    DeleteCM.ExecuteNonQuery();
                    DeleteCMStatus.Text = "CM " + CMList.Rows[e.RowIndex].Cells[0].Text + " successfully deleted.";
                }
                catch (Exception ex)
                {
                    DeleteCMStatus.ForeColor = System.Drawing.Color.Red;
                    DeleteCMStatus.Text = ex.Message;
                }
            }
            FillCMlist();
        }
    }
}