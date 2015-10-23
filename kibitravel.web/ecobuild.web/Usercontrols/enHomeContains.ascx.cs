using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using kibitravel.web.Components;
using vpro.functions;
using GiaNguyen.Components;

namespace kibitravel.web.Usercontrols
{
    public partial class enHomeContains : System.Web.UI.UserControl
    {
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        Propertity per = new Propertity();
        Home index = new Home();
        protected void Page_Load(object sender, EventArgs e)
        {
            Load_Hottour();
            Load_TourPopular();
            Load_TourDifferent();
        }
        private void Load_Hottour()
        {
            try
            {
                var list = index.Loadindex(1, 3, Const.LANGEN, 20);
                rptHottour.DataSource = list;
                rptHottour.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private void Load_TourPopular()
        {
            try
            {
                var list = index.Loadindex(1, 4, Const.LANGEN, 20);
                rptTourPopular.DataSource = list;
                rptTourPopular.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private void Load_TourDifferent()
        {
            try
            {
                var list = index.Loadindex(1, 5, Const.LANGEN, 20);
                rptTourDifferent.DataSource = list;
                rptTourDifferent.DataBind();
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