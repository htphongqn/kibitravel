using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using kibitravel.web.Components;
using Model;

namespace kibitravel.web.Usercontrols
{
    public partial class enGuide : System.Web.UI.UserControl
    {
        Home index = new Home();
        Attfile att = new Attfile();
        protected void Page_Load(object sender, EventArgs e)
        {
            Load_BookDownload();
        }
        private void Load_BookDownload()
        {
            try
            {
                var list = index.Loadindex(0, 1, Const.LANGEN, 1);
                rptBookDownload.DataSource = list;
                rptBookDownload.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }        
        #region Attfile
        public List<Attfile_entity> Loadattfile(object NEWS_SEO_URL)
        {
            string _sNews_Seo_Url = Utils.CStrDef(NEWS_SEO_URL);
            return att.Load_att(_sNews_Seo_Url).Take(1).ToList();
        }
        public string BindAttItems(object News_Id, object Ext_Id, object Att_Name, object Att_Url, object Att_File, object Ext_Image)
        {
            return att.BindAttItems(News_Id, Ext_Id, Att_Name, Att_Url, Att_File, Ext_Image);
        }
        #endregion
    }
}