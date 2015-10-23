using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;
using vpro.functions;
using GiaNguyen.Components;
using Controller;

namespace kibitravel.web
{
    public partial class Contact_en : System.Web.UI.Page
    {
        #region Declare
        Config cf = new Config();
        SendMail sm = new SendMail();
        Propertity per =new Propertity();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Show_File_HTML("contact-e.htm");
                Show_File_HTML_Maps("contact-maps.htm");
                LoadTitle();
            }
            var _configs = cf.Config_meta();

            if (_configs.ToList().Count > 0)
            {
                if (!string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FAVICON))
                    ltrFavicon.Text = "<link rel='shortcut icon' href='" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FAVICON + "' />";
            }

            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            headerDes.Name = "Description";
            headerKey.Name = "Keywords";

            header.Title = "Contact";
        }
        private void LoadTitle()
        {
            string[] page_nameUrl = Request.Url.Segments;
            if (page_nameUrl.Length > 0)
            {
                string page_name = page_nameUrl[page_nameUrl.Length - 1];
                if (page_name == "Contact.aspx")
                {
                    //lbTitle.Text = "Liên hệ";
                }
                else
                {
                    object cat_ID = HttpContext.Current.Session["Cat_id"];
                    var item = per.GetCatalogryByID(cat_ID);
                    if (item != null)
                    {
                        //lbTitle.Text = item.CAT_NAME;
                    }
                }
            }
            else
            {
                object cat_ID = HttpContext.Current.Session["Cat_id"];
                var item = per.GetCatalogryByID(cat_ID);
                if (item != null)
                {
                    //lbTitle.Text = item.CAT_NAME;
                }
            }
        }
        private void Show_File_HTML(string HtmlFile)
        {
            string pathFile;
            string strHTMLContent;
            pathFile = Server.MapPath("/Data/contact/" + HtmlFile);

            if ((File.Exists(pathFile)))
            {
                StreamReader objNewsReader;
                objNewsReader = new StreamReader(pathFile);
                strHTMLContent = objNewsReader.ReadToEnd();
                objNewsReader.Close();

                Literal1.Text = strHTMLContent;
            }
            else
                Literal1.Text = "";

        }
        private void Show_File_HTML_Maps(string HtmlFile)
        {
            string pathFile;
            string strHTMLContent;
            pathFile = Server.MapPath("/Data/contact/" + HtmlFile);

            if ((File.Exists(pathFile)))
            {
                StreamReader objNewsReader;
                objNewsReader = new StreamReader(pathFile);
                strHTMLContent = objNewsReader.ReadToEnd();
                objNewsReader.Close();

                Literal2.Text = strHTMLContent;
            }
            else
                Literal2.Text = "";

        }


        protected void Lbthanhtoan_Click(object sender, EventArgs e)
        {
            try
            {
                string strSecView = LookCookie().ToLower();
                string strSecurity = txtCapcha.Value.ToString().ToLower();
                if (strSecurity != strSecView)
                {
                    Response.Write("<script>alert('Captcha code is incorrect');</script>");
                    return;
                }
                //if (this.txtCapcha.Value != this.Session["CaptchaImageText"].ToString())
                //{
                //    lblresult.Text = "Mã bảo vệ không đúng.";
                //    //mp1.Show();
                //}
                //else
                //{

                    string _sEmailCC = string.Empty;
                    string _sEmail = txtEmail.Value;
                    string _sName = Txtname.Value;
                    string _add = "";
                    string _phone = txtPhone.Value;
                    string _content = txtContent.Value;
                    string _title = "";
                    cf.Insert_contact(_sName, _sEmail, _title, _content, _add, _phone);
                    string _mailBody = string.Empty;
                    _mailBody += "<br/><br/><strong>Name</strong>: " + _sName;
                    _mailBody += "<br/><br/><strong>Phone</strong>: " + _phone;
                    _mailBody += "<br/><br/><strong>Email</strong>: " + _sEmail;
                    _mailBody += "<br/><br/><strong>Message</strong>: " + _content + "<br/><br/>";
                    string _sMailBody = string.Empty;
                    _sMailBody += "Thank " + _sName + " for contacting us. Emails sent from websites " + System.Configuration.ConfigurationManager.AppSettings["EmailDisplayName"] + " <br>" + _mailBody;
                    _sEmailCC = cf.Getemail(2).Count > 0 ? cf.Getemail(2)[0].EMAIL_TO : "";
                    sm.SendEmailSMTP("Notice: You have contacted success", _sEmail, _sEmailCC, "", _sMailBody, true, false);
                    string strScript = "<script>";
                    strScript += "alert(' Done');";
                    strScript += "window.location='/home.html';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                //}
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public string querys()
        {
            return LookCookie();
        }

        private string LookCookie()
        {
            HttpCookie Cookie = new HttpCookie("slmsrcd1");
            Cookie = Request.Cookies["slmsrcd1"];
            string strUser = "";
            if (Cookie != null && Cookie.Value != "" &&
                 Cookie.Value != null)
            {
                strUser = Cookie.Value.ToString();
            }
            return strUser;
        }
    }
}