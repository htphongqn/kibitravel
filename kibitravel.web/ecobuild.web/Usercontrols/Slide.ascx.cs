﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using kibitravel.web.Components;

namespace kibitravel.web.Usercontrols
{
    public partial class Slide : System.Web.UI.UserControl
    {
        Function fun = new Function();
        Propertity per = new Propertity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_ads();
            }
        }
        public void Load_ads()
        {
            try
            {
                var list = per.Load_slider(0, 20, Const.LANGVI);
                rptAds.DataSource = list;
                rptAds.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public string GetImageAd(object Ad_Id, object Ad_Image1, object Ad_Target, object Ad_Url, object Ad_Item_Desc)
        {
            try
            {
                string temp;
                temp = fun.GetImageSlideHome(Ad_Id, Ad_Image1, Ad_Target, Ad_Url, Ad_Item_Desc);
                return temp;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
    }
}