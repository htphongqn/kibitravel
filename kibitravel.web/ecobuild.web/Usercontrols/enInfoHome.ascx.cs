using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using GiaNguyen.Components;
using vpro.functions;
using kibitravel.web.Components;

namespace kibitravel.web.Usercontrols
{
    public partial class enInfoHome : System.Web.UI.UserControl
    {
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        Propertity per = new Propertity();
        Home index = new Home();
        protected void Page_Load(object sender, EventArgs e)
        {
            Load_NewsPreiod();
            Load_Support();
            Load_ClientSay();
        }
        protected void Load_Support()
        {
            try
            {
                rptSupport.DataSource = per.Load_skype();
                rptSupport.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private void Load_ClientSay()
        {
            try
            {
                var list = index.Loadindex(0, 2, Const.LANGEN, 20);
                rptClientSay.DataSource = list;
                rptClientSay.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        } 
        private void Load_NewsPreiod()
        {
            try
            {
                var list = index.Loadindex(0, 0, Const.LANGEN, 20);
                rptNewsPeriod.DataSource = list;
                rptNewsPeriod.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        } 
        #region function
        public string Getimages_Cat(object cat_id, object cat_img)
        {
            return fun.Getimages_Cat(cat_id, cat_img);
        }
        public string Getlink_Cat(object Cat_Url, object Cat_Seo_Url)
        {
            try
            {
                return fun.Getlink_Cat_EN(Cat_Url, Cat_Seo_Url);
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string GetLink(object News_Url, object News_Seo_Url, object cat_seo)
        {
            try
            {
                return fun.Getlink_News_EN(News_Url, News_Seo_Url, cat_seo);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetImageT(object News_Id, object News_Image1)
        {

            try
            {
                return fun.GetImageT_News(News_Id, News_Image1);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }

        public string getDate(object News_PublishDate)
        {
            return fun.getDate(News_PublishDate);
        }
        public string Getprice(object price)
        {
            return fun.Getprice(price);
        }
        #endregion
    }
}