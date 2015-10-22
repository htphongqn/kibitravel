using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using GiaNguyen.Components;
using Controller;

namespace kibitravel.web.Usercontrols
{
    public partial class ListBestdeals : System.Web.UI.UserControl
    {
        #region Declare
        List_news lnews = new List_news();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        Pageindex_chage change = new Pageindex_chage();
        int _Catid = 0;
        string _cat_seo_url = string.Empty;
        int _page = 0;
        int _typecat = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _Catid = Utils.CIntDef(Session["Cat_id"]);
            _cat_seo_url = Request.QueryString["curl"];
            _page = Utils.CIntDef(Request.QueryString["page"]);
            _typecat = lnews.getCatType(_cat_seo_url);
            if (!IsPostBack)
            {
                Loadlist(rptListBestdeal);
                Loadtitle();
            }
        }
        public void Loadtitle()
        {
            try
            {
                lbCateName.Text = lnews.Loadtitle(_cat_seo_url);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void Loadlist(Repeater rpt)
        {
            try
            {
                int sotin = (_typecat == 0 ? lnews.Getsotin(_Catid) : 100);
                var list = lnews.Load_listnews(_Catid);
                if (list.Count > 0)
                {
                    //if (_page != 0)
                    //{
                    //    rpt.DataSource = list.Skip(sotin * _page - sotin).Take(sotin);
                    //    rpt.DataBind();
                    //}
                    //else
                    //{
                        rpt.DataSource = list;//.Take(sotin);
                        rpt.DataBind();
                    //}
                    //ltrPage.Text = change.result(list.Count, sotin, _cat_seo_url, 0, _page, 1);
                }
                else { }

            }
            catch
            {

                
            }
        }

        #region function
        public string GetLink(object News_Url, object News_Seo_Url, object cat_seo)
        {
            try
            {
                return fun.Getlink_News(News_Url, News_Seo_Url, cat_seo);
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
                return fun.GetImageT_News_Hasclass(News_Id, News_Image1, "");
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string getdate(object date)
        {
            return fun.getDate(date);
        }
        #endregion
    }
}