using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KeysightMOR.ControlPanel
{
    public partial class BusinessUserViewEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string CMID = Request.QueryString["CMID"];
                if (CMID != null)
                {
                    B1_1.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 20;
                    B1_2.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 21;
                    B1_3.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 22;
                    B2_1a.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 23;
                    B2_1b.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 24;
                    B2_1c.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 25;
                    B2_1d.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 26;
                    B2_1e.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 27;
                    B2_2.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 28;                   
                }
            }
        }
    }
}