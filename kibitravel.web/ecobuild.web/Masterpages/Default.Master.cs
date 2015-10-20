using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecobuild.Masterpages
{
    public partial class Default : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ViewFirst"] == null)
            {
                Session["ViewFirst"] = true;
                Response.Redirect("/introl.html");
            }
        }
    }
}