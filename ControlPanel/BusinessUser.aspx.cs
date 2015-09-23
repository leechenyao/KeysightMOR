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
    public partial class BusinessUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getCM();
            }
        }

        protected void getCM()
        {
            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            SqlCommand getCM = new SqlCommand("SELECT * FROM dbo.[CM]", sqlConn);
            SqlDataAdapter da = new SqlDataAdapter(getCM);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ddlcm.DataSource = ds.Tables[0];
            ddlcm.DataValueField = "CMID";
            ddlcm.DataTextField = "CMName";
            ddlcm.DataBind();
            ddlcm.Items.Insert(0, new ListItem("-Select-", "0"));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlcm.SelectedItem.Value.ToString() != "0")
            {
                Response.Redirect("BusinessUserViewEdit.aspx?CMID=" + ddlcm.SelectedItem.Value.ToString());
            }
            else
            {
                SelectCMStatus.Text = "Please select 1 CM";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Index.aspx");
        }
    }
}