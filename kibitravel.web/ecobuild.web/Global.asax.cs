using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using vpro.functions;
using Controller;

namespace ecobuild
{
    public class Global : System.Web.HttpApplication
    {
        #region Declare
        Config cf = new Config();
        #endregion
        void Application_Start(object sender, EventArgs e)
        {
            Application["Online"] = 0;
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
        }

        void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Application["Online"] = Utils.CIntDef(Application["Online"]) + 1;
            Application.UnLock();

            try
            {
                cf.Addvister();

            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
            }
        }

        void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["Online"] = Utils.CIntDef(Application["Online"]) - 1;
            Application.UnLock();
        }

    }
}
