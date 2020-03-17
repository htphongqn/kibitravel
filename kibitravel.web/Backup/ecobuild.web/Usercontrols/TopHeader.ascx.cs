using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace kibitravel.web.Usercontrols
{
    public partial class TopHeader : System.Web.UI.UserControl
    {
        private Propertity per = new Propertity();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtSearch.Attributes.Add("onkeypress", "return clickButton(event,'" + Lbsearch.ClientID + "')");
            if (!IsPostBack)
            {
                Load_Mail();
            }
        }

        protected void Load_Mail()
        {
            try
            {
                rptMail.DataSource = per.Load_mail().Take(1);
                rptMail.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        protected void Lbsearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("/tim-kiem.html?page=0&keyword=" + txtSearch.Value);
        }
    }
}