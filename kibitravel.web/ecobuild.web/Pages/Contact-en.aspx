<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/enDefault.Master" AutoEventWireup="true" CodeBehind="Contact-en.aspx.cs" Inherits="ecobuild.Contact_en" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bor2">
      <div class="control-top"> 
        <span>Contact</span> 
        <a href="/" class="back-to"><i class="fa fa-mail-reply"></i> Back</a> 
        <a href="/" class="bk-home"><i class="fa fa-home"></i></a> 
      </div>
      <div class="testDiv">
        <div class="iblock contact">
          <p style="margin-bottom:10px; "><br />
            Please complete the form below we will contact you as soon as possible.</p>
          <div class="form-ct">
            <input type="text" id="Txtname" placeholder="Fullname" runat="server"/>
            <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Please enter your fullname"
                ControlToValidate="Txtname" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            <input type="text" id="txtEmail" placeholder="Please enter your email" runat="server"/>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="The email address is not valid or in the wrong format" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="None"
                ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
            <input type="text" id="txtPhone" placeholder="Phone" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your phone number"
                ControlToValidate="txtPhone" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            <input type="text" id="txttitle" placeholder="Title" runat="server"/>
            <textarea id="txtContent" placeholder="Message" runat="server"></textarea>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter your message"
                ControlToValidate="txtContent" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            <p class="send">
               <script type="text/javascript"  language="Javascript">
                    function Catpc() {
                        var img = document.getElementById("icp");
                        img.src = "/Pages/captchr.ashx?query=" + Math.random();
                    }
              </script>
              <input type="text" class="captcha" id="txtCapcha" placeholder="Captcha" runat="server"/>
              <img id="icp" src='/Pages/captchr.ashx?query=<%= querys() %>' alt="Captcha" />
              <a href="javascript:void(0)" onclick="javascript:Catpc();"><img title="Refresh" src="/Resources/images/reloadpaf.png" /></a>
              <asp:LinkButton ID="Lbthanhtoan" runat="server" OnClick="Lbthanhtoan_Click" ValidationGroup="G40" CssClass="btn-send">Send</asp:LinkButton>
            </p>
          </div>
          <address class="address-ct">
          <!--begin--> 
          <asp:Literal ID="Literal1" runat="server"></asp:Literal>
          <!--end-->
          </address>
          <map class="map">
            <p><b>Map</b></p>
            <asp:Literal ID="Literal2" runat="server"></asp:Literal>
          </map>
        </div>
      </div>
      <!--/testDiv-->
      
      <div class="control-bottom"> <a href="javascript:history.back()" class="back-to"><i class="fa fa-mail-reply"></i> Back</a>
        <nav class="breadcrumb">
          <ul>
            <li><a href="/trang-chu.htm">Trang chủ</a></li>
            <li><a href="/san-pham.htm">Tin tức</a></li>
          </ul>
        </nav>
      </div>
    </div>
    <div style="text-align: center">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
            ShowSummary="False" ValidationGroup="G40" />                 
        <asp:Label ID="lblresult" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
