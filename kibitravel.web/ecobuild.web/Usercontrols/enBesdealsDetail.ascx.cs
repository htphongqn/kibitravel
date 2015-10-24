using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using GiaNguyen.Components;

namespace kibitravel.web.Usercontrols
{
    public partial class enBesdealsDetail : System.Web.UI.UserControl
    {
        #region Declare

        public clsFormat _clsFormat = new clsFormat();
        News_details ndetail = new News_details();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        Product_Details pro_detail = new Product_Details();
        string _sNews_Seo_Url = string.Empty;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _sNews_Seo_Url = Utils.CStrDef(Request.QueryString["purl"]);
            Show_File_HTML();
            Tinkhac();
            gettitle();
        }
        #region My Function
        public void gettitle()
        {
            try
            {
                var list = ndetail.Load_details(_sNews_Seo_Url);
                if (list.Count > 0)
                {
                    lbNewsTitle.Text = list[0].NEWS_TITLE;
                    lblDesc.Text = lblDesc1.Text = list[0].NEWS_DESC;
                    Load_albumimg(list[0].NEWS_ID, ref Rpalbumimg,1);
                    Load_albumimg(list[0].NEWS_ID, ref Rpalbumimg1, 2);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        public void Load_albumimg(int _Newsid, ref Repeater rp, int _type)
        {
            rp.DataSource = pro_detail.Load_albumimgPlus(_Newsid, _type);
            rp.DataBind();
        }
        private void Show_File_HTML()
        {
            try
            {
                string _sCat_Seo_Url = Utils.CStrDef(Request.QueryString["curl"]);
                if (!string.IsNullOrEmpty(_sCat_Seo_Url))
                {
                    _sNews_Seo_Url = ndetail.Get_News_seo_url(_sCat_Seo_Url);
                }
                string str = ndetail.Showfilehtm(_sCat_Seo_Url, _sNews_Seo_Url);
                liHtml.Text = str;
                str = ndetail.Showfilehtm2(_sCat_Seo_Url, _sNews_Seo_Url, "itinerary-vi.htm");
                if (str != "")
                    liHtmlItinerary.Text = str;
                str = ndetail.Showfilehtm2(_sCat_Seo_Url, _sNews_Seo_Url, "price-vi.htm");
                if (str != "")
                    liHtmlPrices.Text = str;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        public void Tinkhac()
        {
            try
            {
                if (_sNews_Seo_Url != "")
                {
                    var _tinTucKhac = ndetail.Load_othernews(_sNews_Seo_Url);
                    if (_tinTucKhac.ToList().Count > 0)
                    {
                        lblTitleCat.Text = _tinTucKhac[0].CAT_NAME;
                        Rptinkhac.DataSource = _tinTucKhac;
                        Rptinkhac.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
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
        #endregion
    }
}