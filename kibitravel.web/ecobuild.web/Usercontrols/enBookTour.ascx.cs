﻿using System;
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
    public partial class enBookTour : System.Web.UI.UserControl
    {
        #region Declare
        Config cf = new Config();
        SendMail sm = new SendMail();
        Propertity per = new Propertity();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTitle();
            }

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
        protected void Lbthanhtoan_Click(object sender, EventArgs e)
        {
            try
            {
                string strSecView = LookCookie().ToLower();
                string strSecurity = txtCapcha.Value.ToString().ToLower();
                if (strSecurity != strSecView)
                {
                    Response.Write("<script>alert('Nhập mã bảo mật sai!');</script>");
                    return;
                }
                //if (this.txtCapcha.Value != this.Session["CaptchaImageText"].ToString())
                //{
                //    lblresult.Text = "Mã bảo vệ không đúng.";
                //    //mp1.Show();
                //}
                //else
                //{

                
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
                
                string _sEmailTO = cf.Getemail(2).Count > 0 ? cf.Getemail(2)[0].EMAIL_TO : "";
                string _sEmailCC = cf.Getemail(2).Count > 0 ? cf.Getemail(2)[0].EMAIL_CC : "";
                string _sEmailBCC = cf.Getemail(2).Count > 0 ? cf.Getemail(2)[0].EMAIL_BCC : "";

                sm.SendEmailSMTP_DCV("Notice: You have contacted success", _sEmail, _sEmailTO, _sEmailBCC, _sMailBody, true, false, _sEmailCC);
                string strScript = "<script>";
                strScript += "alert(' Done!');";
                strScript += "window.location='/';";
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