using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KeysightMOR.ControlPanel
{
    public partial class ResponsivenessUserViewEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string CMID = Request.QueryString["CMID"];
                if (CMID != null)
                {
                    R1_1.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 1;
                    R1_2.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 2;
                    R1_3.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 3;
                    R2_1.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 4;
                    R2_2a.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 5;
                    R2_2b.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 6;
                    R2_3a.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 7;
                    R2_3b.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 8;
                    R2_3c.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 9;
                    R2_3d.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 10;
                    R2_3e.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 11;
                    R2_3f.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 12;
                }
            }
        }
    }
}