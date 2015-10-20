using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using GiaNguyen.Components;

namespace ecobuild.Usercontrols
{
    public partial class intro : System.Web.UI.UserControl
    {
        #region Declare

        public clsFormat _clsFormat = new clsFormat();
        News_details ndetail = new News_details();
        List_news lnews = new List_news();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        SendMail send = new SendMail();

        string _sNewsSeoUrl = string.Empty;
        Attfile att = new Attfile();
        Product_Details pro_detail = new Product_Details();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Loadimgbig(100, 0, ref Rpimg_small1);
        }
        #region My Function
        public void Load_img_news(int take, int skip, ref Repeater rp)
        {
            rp.DataSource = pro_detail.Load_Product_Detail("introl");
            rp.DataBind();
        }
        public void Loadimgbig(int take, int skip, ref Repeater rp)
        {
            try
            {
                int _newsID = lnews.getNewsId("introl");
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