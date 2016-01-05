using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using vpro.functions;

namespace Controller
{
    public class List_news
    {
        #region Decclare
        dbShopDataContext db = new dbShopDataContext();
        #endregion
        #region Entity_result
        #endregion
        public List<News_details_entity> Load_listnews(int _Catid)
        {
            try
            {
                List<News_details_entity> l = new List<News_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where (c.CAT_ID == _Catid || c.CAT_PARENT_PATH.Contains(_Catid.ToString()))
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_DESC, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, c.CAT_SEO_URL, b.NEWS_CODE, b.NEWS_FIELD2, b.NEWS_FIELD3 }).OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER).ToList();
                foreach (var i in list)
                {
                    News_details_entity pro = new News_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_CODE = i.NEWS_CODE;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_ORDER = Utils.CIntDef(i.NEWS_ORDER);
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    pro.CAT_SEO_URL = i.CAT_SEO_URL;
                    pro.NEWS_FIELD3 = i.NEWS_FIELD3;
                    l.Add(pro);
                }
                
                return l;

            }
            catch (Exception)
            {

                throw;
            }
        }
        //Load title
        public string Loadtitle(string _cat_seo_url)
        {
            try
            {
                var list = db.ESHOP_CATEGORies.Where(n => n.CAT_SEO_URL == _cat_seo_url).Select(n => new { n.CAT_NAME }).ToList();
                if (list.Count > 0)
                {
                    return list[0].CAT_NAME;
                }
                return "";
            }
            catch (Exception)
            {

                throw;
            }
        }
        public int getCatType(string _cat_seo_url)
        {
            try
            {
                var list = db.ESHOP_CATEGORies.Where(n => n.CAT_SEO_URL == _cat_seo_url).Select(n => new { n.CAT_TYPE }).ToList();
                if (list.Count > 0)
                {
                    return Utils.CIntDef(list[0].CAT_TYPE);
                }
                return -1;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public int getTypeByNew(string _new_seo_url)
        {
            try
            {
                var list = (from a in db.ESHOP_CATEGORies
                            join b in db.ESHOP_NEWS_CATs on a.CAT_ID equals b.CAT_ID
                            join c in db.ESHOP_NEWs on b.NEWS_ID equals c.NEWS_ID
                            where c.NEWS_SEO_URL == _new_seo_url
                            select new { a.CAT_TYPE }).ToList();
                if (list.Count > 0)
                {
                    return Utils.CIntDef(list[0].CAT_TYPE);
                }
                return -1;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public int getNewsId(string _new_seo_url)
        {
            var list = db.ESHOP_NEWs.Where(n => n.NEWS_SEO_URL == _new_seo_url).ToList();
            if (list.Count > 0)
            {
                return list[0].NEWS_ID;
            }
            else return 0;
        }
        //Get sotin
        public int Getsotin(int catid)
        {
            int sotin =db.ESHOP_CATEGORies.Where(n => n.CAT_ID == catid).ToList().Count>0 ? Utils.CIntDef(db.ESHOP_CATEGORies.Where(n => n.CAT_ID == catid).First().CAT_PAGEITEM) : 0;
            return sotin;
        }
    }
}
