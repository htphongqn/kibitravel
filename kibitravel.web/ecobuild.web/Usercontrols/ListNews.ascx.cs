using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using GiaNguyen.Components;
using Controller;

namespace ecobuild.Usercontrols
{
    public partial class ListNews : System.Web.UI.UserControl
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
                plNews.Visible = plGlobal.Visible = false;
                if (_typecat == 2)
                {
                    plGlobal.Visible = true;
                    Loadlist(rptGlobal);
                }
                else
                {
                    plNews.Visible = true;
                    Loadlist(rptlistnews);
                }
                Loadtitle();
            }
        }
        public void Loadtitle()
        {
            try
            {
                lbNewsTitle.Text = lnews.Loadtitle(_cat_seo_url);
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
                    if (_page != 0)
                    {
                        rpt.DataSource = list.Skip(sotin * _page - sotin).Take(sotin);
                        rpt.DataBind();
                    }
                    else
                    {
                        rpt.DataSource = list.Take(sotin);
                        rpt.DataBind();
                    }
                    ltrPage.Text = change.result(list.Count, sotin, _cat_seo_url, 0, _page, 1);
                }
                else { lblMsg.Text = "Nội dung đang được cập nhật!"; }

            }
            catch (Exception)
            {

                throw;
            }
        }

        public string GetHtmlItemNews(object NEWS_URL, object NEWS_SEO_URL, object CAT_SEO_URL, object NEWS_ID, object NEWS_IMAGE3, object NEWS_TITLE, object NEWS_DESC)
        {
            string link, img;
            link = GetLink(NEWS_URL, NEWS_SEO_URL, CAT_SEO_URL);
            img = GetImageT(NEWS_ID, NEWS_IMAGE3);
            string str = String.Format(@"<li class='post'>
                <div class='news_item'>
                <a href='{0}' class='img_news'>{1}</a>
                <h2><a href='{2}'>{3}</a></h2>
                <div class='news_post_desc'><span style='font-size: 18px; font-family: times new roman;'>{4}<br>
                </span> </div><a href='{5}' class='read_more'>Xem thêm</a> </div></li>"
                , link, img, link, NEWS_TITLE, NEWS_DESC, link);
            return str;
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