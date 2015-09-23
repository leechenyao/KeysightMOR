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
    public partial class ViewDeleteDivision : System.Web.UI.Page
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
            SqlCommand getDivision = new SqlCommand("SELECT * FROM dbo.[Division]", sqlConn);
            SqlDataAdapter da = new SqlDataAdapter(getDivision);
            DataSet dt = new DataSet();
            da.Fill(dt);
            DivisionList.DataSource = dt;
            DivisionList.DataBind();
            getDivision.Dispose();
            sqlConn.Close();
        }

        protected void DivisionList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            SqlCommand DeleteCM = new SqlCommand("DELETE FROM dbo.[Division] WHERE DivID = @DivID", sqlConn);
            DeleteCM.Parameters.AddWithValue("@DivID", DivisionList.DataKeys[e.RowIndex]["DivID"]);

            using (sqlConn)
            {
                try
                {
                    sqlConn.Open();
                    DeleteCM.ExecuteNonQuery();
                    DeleteDivisionStatus.Text = "Division " + DivisionList.Rows[e.RowIndex].Cells[0].Text + " successfully deleted.";
                }
                catch (Exception ex)
                {
                    DeleteDivisionStatus.ForeColor = System.Drawing.Color.Red;
                    DeleteDivisionStatus.Text = ex.Message;
                }
            }
            FillDivisionList();
        }
    }
}