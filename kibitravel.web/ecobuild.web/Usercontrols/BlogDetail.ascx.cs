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
    public partial class BlogDetail : System.Web.UI.UserControl
    {
        #region Declare

        public clsFormat _clsFormat = new clsFormat();
        News_details ndetail = new News_details();
        List_news lnews = new List_news();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        string _sNews_Seo_Url = string.Empty;
        SendMail send = new SendMail();

        string _sNewsSeoUrl = string.Empty;
        Attfile att = new Attfile();
        Product_Details pro_detail = new Product_Details();
        int _typecat = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _sNews_Seo_Url = Utils.CStrDef(Request.QueryString["purl"]);
            _typecat = lnews.getTypeByNew(_sNews_Seo_Url);
            Show_File_HTML();
            //hplPrint.HRef = "/in/" + _sNews_Seo_Url + ".html";
            gettitle();
            Tinkhac();

        }
        #region My Function
        public void gettitle()
        {
            try
            {
                string _sCat_Seo_Url = Utils.CStrDef(Request.QueryString["curl"]);
                lbNewsTitle.Text = ndetail.gettitle(_sCat_Seo_Url, _sNews_Seo_Url).Count > 0 ? ndetail.gettitle(_sCat_Seo_Url, _sNews_Seo_Url)[0].News_title : "";
            }
            catch (Exception)
            {

                throw;
            }
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
                if (str != "")
                    liHtml.Text = str;
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
                return fun.Getlink_News(News_Url, News_Seo_Url, cat_seo);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string getDate(object News_PublishDate)
        {
            return fun.getDate(News_PublishDate);
        }
        public void Load_img_news(int take, int skip, ref Repeater rp)
        {
            rp.DataSource = pro_detail.Load_Product_Detail(_sNewsSeoUrl);
            rp.DataBind();
        }
        int _count = 0;
        public void Loadimgbig(int take, int skip, ref Repeater rp)
        {
            try
            {
                int _newsID = Utils.CIntDef(Session["news_id"]);
                var list = pro_detail.Load_albumimg(_newsID).Skip(skip).Take(take).ToList();
                if (list.Count > 0)
                {
                    rp.DataSource = list;
                    rp.DataBind();
                }
            }
            catch (Exception)
            {

                throw;
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
        #endregion
        public void Tinkhac()
        {
            try
            {
                if (_sNews_Seo_Url != "")
                {
                    var _tinTucKhac = ndetail.Load_othernews(_sNews_Seo_Url);
                    if (_tinTucKhac.ToList().Count > 0)
                    {
                        rptlistnewsOther.DataSource = _tinTucKhac;
                        rptlistnewsOther.DataBind();
                    }
                    //else
                        //dvOtherNews.Visible = false;
                }
                //else dvOtherNews.Visible = false;
            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }
    }
}