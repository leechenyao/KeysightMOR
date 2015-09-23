using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KeysightMOR.ControlPanel
{
    public partial class DeliveryUserViewEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string CMID = Request.QueryString["CMID"];
                if (CMID != null)
                {
                    D1_1.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 13;
                    D1_2.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 14;
                    D1_3.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 15;
                    D1_4.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 16;
                    D2_1.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 17;
                    D2_2.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 18;
                    D2_3.NavigateUrl = "~/ControlPanel/EvaluationSetting.aspx?CMID=" + CMID + "&CriteriaID=" + 19;
                }
            }
        }
    }
}