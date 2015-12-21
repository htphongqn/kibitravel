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
    public partial class enBestdeals : System.Web.UI.UserControl
    {
        #region Declare
        Propertity per = new Propertity();
        Function fun = new Function();
        int _Catid = 0;
        string _cat_seo_url = string.Empty;
        #endregion
        int rank = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            _Catid = Utils.CIntDef(Session["Cat_id"]);
            _cat_seo_url = Request.QueryString["curl"];
            if (!IsPostBack)
            {
                Load_CateName();
                Load_CateList();
            }
        }

        private void Load_CateName()
        {
            var item = per.GetCatalogryByID(_Catid);
            if (item != null)
            {
                lbCateName.Text = lbCateName2.Text = item.CAT_NAME;
                rank = Utils.CIntDef(item.CAT_RANK);
            }
        }
        
        #region Load data
        protected void Load_CateList()
        {
            try
            {
                if (rank > 1)
                {
                    var list = per.Menu2(_Catid);
                    rptListBestdeal.DataSource = list;
                    rptListBestdeal.DataBind();
                    div1.Visible = false;
                    div2.Visible = true;
                }
                else
                {
                    var list = per.Menu2(_Catid);
                    rptmenubestdeal.DataSource = list;
                    rptmenubestdeal.DataBind();
                    div1.Visible = true;
                    div2.Visible = false;                        
                }
                
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }

        }
        #endregion

        #region Function
        public string GetLink(object Cat_Url, object Cat_Seo_Url, object Cat_Type)
        {
            try
            {
                string temp = fun.Getlink_Cat_EN(Cat_Url, Cat_Seo_Url);
                return temp;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public string GetImageCat(object News_Id, object News_Image1)
        {

            try
            {
                if (Utils.CIntDef(News_Id) > 0 && !string.IsNullOrEmpty(Utils.CStrDef(News_Image1)))
                {
                    return PathFiles.GetPathCategory(Utils.CIntDef(News_Id)) + Utils.CStrDef(News_Image1);
                }
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetStyleActive(object Cat_Seo_Url, object Cat_Url)
        {
            try
            {
                string _curl = Utils.CStrDef(Request.QueryString["curl"]);
                string _seoUrl = Utils.CStrDef(Request.QueryString["purl"]);
                return per.GetStyleActive(Cat_Seo_Url, Cat_Url);
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