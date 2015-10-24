﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using System.Data;
using System.Web.UI.HtmlControls;
using System.IO;

namespace yeuthietkeweb.cms.pages
{
    public partial class news_attachment : System.Web.UI.Page
    {
        #region Declare

        private int m_att_id = 0;
        private int m_news_id = 0;
        private int _count = 0;
        dbShopDataContext DB = new dbShopDataContext();

        #endregion

        #region form event

        protected void Page_Load(object sender, EventArgs e)
        {
            m_att_id = Utils.CIntDef(Request["att_id"]);
            m_news_id = Utils.CIntDef(Request["news_id"]);

            hplBack.HRef = "news.aspx?news_id=" + m_news_id;

            if (m_att_id == 0)
            {
                lbtDelete.Visible = false;
                trFile.Visible = false;
            }

            if (!IsPostBack)
            {


                getInfo();

                SearchResult();

                //txtKeyword.Attributes.Add("onKeyPress", Common.getSubmitScript(lbtSearch.ClientID));
            }
            hplCatNews.HRef = "news_category.aspx?news_id=" + m_news_id;
            hplEditorHTMl.HRef = "news_editor.aspx?news_id=" + m_news_id;
            hplNewsAtt.HRef = "news_attachment.aspx?news_id=" + m_news_id;
            hplAlbum.HRef = "news_images.aspx?news_id=" + m_news_id;
            //bplNewsCopy.HRef = "news_copy.aspx?news_id=" + m_news_id;
            hplComment.HRef = "news_comment.aspx?news_id=" + m_news_id; hplComment.Visible = false;
            //hplCatProducts.HRef = "news_news.aspx?news_id=" + m_news_id;
        }

        #endregion

        #region Button Events

        protected void lbtSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTitle.Value))
                lblError.Visible = true;
            else
                SaveInfo();
        }

        protected void lbtDelete_Click(object sender, EventArgs e)
        {
            DeleteInfo(m_att_id);
        }

        protected void btnDelete1_Click(object sender, ImageClickEventArgs e)
        {
            string strLink = "";
            try
            {
                var n_info = DB.GetTable<ESHOP_NEWS_ATT>().Where(n => n.NEWS_ATT_ID == m_att_id);

                if (n_info.ToList().Count > 0)
                {
                    if (!string.IsNullOrEmpty(n_info.ToList()[0].NEWS_ATT_FILE))
                    {
                        string imagePath = Server.MapPath(PathFiles.GetPathNews(m_news_id) + n_info.ToList()[0].NEWS_ATT_FILE);
                        n_info.ToList()[0].NEWS_ATT_FILE = "";
                        DB.SubmitChanges();

                        if (File.Exists(imagePath))
                            File.Delete(imagePath);

                        strLink = "news_attachment.aspx?att_id=" + m_att_id + "&news_id=" + m_news_id;
                    }
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
            finally
            {
                if (!string.IsNullOrEmpty(strLink))
                    Response.Redirect(strLink);
            }
        }

        protected void lbtSearch_Click(object sender, EventArgs e)
        {
            SearchResult();
        }

        #endregion

        #region My Functions

        private void getInfo()
        {
            try
            {

                LoadExt();

                var G_info = (from g in DB.ESHOP_NEWS_ATTs
                              where g.NEWS_ATT_ID == m_att_id
                              select g
                            );

                if (G_info.ToList().Count > 0)
                {
                    txtTitle.Value = G_info.ToList()[0].NEWS_ATT_NAME;
                    ddlExtFiles.SelectedValue = Utils.CStrDef(G_info.ToList()[0].EXT_ID);
                    txtOrder.Value = Utils.CStrDef(G_info.ToList()[0].NEWS_ATT_ORDER);
                    txtUrl.Value = G_info.ToList()[0].NEWS_ATT_URL;

                    //image
                    if (!string.IsNullOrEmpty(G_info.ToList()[0].NEWS_ATT_FILE))
                    {
                        trUpload.Visible = false;
                        trFile.Visible = true;
                        hplFile.NavigateUrl = PathFiles.GetPathNews(m_news_id) + G_info.ToList()[0].NEWS_ATT_FILE;
                        hplFile.Text = G_info.ToList()[0].NEWS_ATT_FILE;
                    }
                    else
                    {
                        trUpload.Visible = true;
                        trFile.Visible = false;
                    }
                }

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        private void SaveInfo(string strLink = "")
        {
            try
            {

                //get image
                string Att_File;

                if (trUpload.Visible == true)
                {
                    if (fileImage1.PostedFile != null)
                    {
                        Att_File = Path.GetFileName(fileImage1.PostedFile.FileName);
                    }
                    else
                    {
                        Att_File = "";
                    }
                }
                else
                {
                    Att_File = hplFile.Text;
                }

                if (m_att_id == 0)
                {
                    //insert
                    ESHOP_NEWS_ATT g_insert = new ESHOP_NEWS_ATT();
                    g_insert.NEWS_ATT_NAME = txtTitle.Value;
                    g_insert.EXT_ID = Utils.CIntDef(ddlExtFiles.SelectedValue);
                    g_insert.NEWS_ATT_ORDER = Utils.CIntDef(txtOrder.Value);
                    g_insert.NEWS_ATT_URL = txtUrl.Value;
                    g_insert.NEWS_ID = m_news_id;
                    g_insert.NEWS_ATT_FILE = Att_File;

                    DB.ESHOP_NEWS_ATTs.InsertOnSubmit(g_insert);

                    DB.SubmitChanges();

                    //get new id
                    var _new = DB.GetTable<ESHOP_NEWS_ATT>().OrderByDescending(g => g.NEWS_ATT_ID).Take(1);

                    m_att_id = _new.Single().NEWS_ATT_ID;

                    strLink = string.IsNullOrEmpty(strLink) ? "news_attachment.aspx?news_id=" + m_news_id : strLink;
                }
                else
                {
                    //update
                    var g_update = DB.GetTable<ESHOP_NEWS_ATT>().Where(g => g.NEWS_ATT_ID == m_att_id);

                    if (g_update.ToList().Count > 0)
                    {
                        g_update.Single().NEWS_ATT_NAME = txtTitle.Value;
                        g_update.Single().EXT_ID = Utils.CIntDef(ddlExtFiles.SelectedValue);
                        g_update.Single().NEWS_ATT_ORDER = Utils.CIntDef(txtOrder.Value);
                        g_update.Single().NEWS_ATT_URL = txtUrl.Value;
                        g_update.Single().NEWS_ATT_FILE = Att_File;
                        g_update.Single().NEWS_ID = m_news_id;

                        DB.SubmitChanges();

                        strLink = string.IsNullOrEmpty(strLink) ? "news_attachment.aspx?news_id=" + m_news_id : strLink;
                    }
                }

                //update images
                if (trUpload.Visible)
                {
                    if (!string.IsNullOrEmpty(fileImage1.PostedFile.FileName))
                    {
                        string pathfile = Server.MapPath("/data/news/" + m_news_id);
                        string fullpathfile = pathfile + "/" + Att_File;

                        if (!Directory.Exists(pathfile))
                        {
                            Directory.CreateDirectory(pathfile);
                        }

                        fileImage1.PostedFile.SaveAs(fullpathfile);
                    }

                }

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
            finally
            {
                if (!string.IsNullOrEmpty(strLink))
                { Response.Redirect(strLink); }
            }
        }

        private void DeleteInfo(int att_id)
        {
            string strLink = "";
            try
            {
                string Att_File = "";

                var G_info = DB.GetTable<ESHOP_NEWS_ATT>().Where(g => g.NEWS_ATT_ID == att_id);

                if (G_info.ToList().Count > 0)
                    Att_File = Utils.CStrDef(G_info.ToList()[0].NEWS_ATT_FILE);

                DB.ESHOP_NEWS_ATTs.DeleteAllOnSubmit(G_info);
                DB.SubmitChanges();

                //delete file
                if (!string.IsNullOrEmpty(Att_File))
                {
                    string fullpath = Server.MapPath(PathFiles.GetPathNews(m_news_id) + Att_File);

                    if (File.Exists(fullpath))
                    {
                        File.Delete(fullpath);
                    }
                }

                strLink = "news_attachment.aspx?news_id=" + m_news_id;

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
            finally
            {
                if (!string.IsNullOrEmpty(strLink))
                    Response.Redirect(strLink);
            }

        }

        private void LoadExt()
        {
            try
            {
                var units = DB.GetTable<ESHOP_EXT_FILE>();

                ddlExtFiles.DataSource = units;
                ddlExtFiles.DataTextField = "EXT_FILE_NAME";
                ddlExtFiles.DataValueField = "EXT_FILE_ID";
                ddlExtFiles.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        public string getOrder()
        {
            _count = _count + 1;
            return _count.ToString();
        }

        public string getLink(object obj_id)
        {
            return "news_attachment.aspx?news_id=" + m_news_id + "&att_id=" + Utils.CStrDef(obj_id);
        }

        private void SearchResult()
        {
            try
            {
                //string keyword = txtKeyword.Value;

                var AllList = (from g in DB.ESHOP_NEWS_ATTs
                               where
                               //("" == keyword || (g.NEWS_ATT_NAME).Contains(keyword))
                               //&& 
                               g.NEWS_ID == m_news_id
                               select g);

                rptList.DataSource = AllList;
                rptList.DataBind();


            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        #endregion

        #region Grid Events
        protected void rptList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label lblID = (Label)e.Item.FindControl("lblID");
            int _id = Utils.CIntDef(lblID.Text, 0);
            if (((LinkButton)e.CommandSource).CommandName == "Delete")
            {
                EventDelete(_id);
            }
        }
        private void EventDelete(int _id)
        {
            int AttId = _id;
            DeleteInfo(AttId);
        }
        #endregion


    }
}