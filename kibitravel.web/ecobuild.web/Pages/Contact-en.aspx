<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Default.Master" AutoEventWireup="true" CodeBehind="Contact-en.aspx.cs" Inherits="kibitravel.web.Contact_en" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="breadcrumb">
      <ul>
        <li><a href="/home.html">Home</a></li>
        <li><a>Send Requests</a></li>
      </ul>
    </nav>
    <section class="content">
      <div class="iblock contact">
        <p class="tt-mt"> <span class="mt-s"><b>Send Requests</b></span> </p>
        <div class=" col6">
        <p class="text-bt">Please complete the form below and we will contact you within 24 hours."<br /> Thank you for making a reservation with Kibitravel!</p>
          <p> Name
            <input type="text" class="txt-bt" id="Txtname" runat="server"/>
            <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Please enter your full name"
                ControlToValidate="Txtname" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
          </p>
          <p> Phone
            <input type="text" class="txt-bt" id="txtPhone" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your phone number"
                ControlToValidate="txtPhone" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
          </p>
          <p> Email
            <input type="text" class="txt-bt" id="txtEmail" runat="server"/>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="The email address is not valid or in the wrong format" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="None"
                ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
          </p>
          <p>Message
            <textarea class="txt-bt" id="txtContent" placeholder="Message" runat="server"></textarea>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter your message"
                ControlToValidate="txtContent" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
          </p>
          
          <p class="cht">
          Captcha<br />
            <script type="text/javascript"  language="Javascript">
                function Catpc() {
                    var img = document.getElementById("icp");
                    img.src = "/Pages/captchr.ashx?query=" + Math.random();
                }
            </script>
            <input type="text" class="txt-bt captcha" id="txtCapcha" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter the captcha"
                ControlToValidate="txtCapcha" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            <img id="icp" src='/Pages/captchr.ashx?query=<%= querys() %>' alt="Captcha" />
            <a href="javascript:void(0)" onclick="javascript:Catpc();"><img title="Refresh" src="/Resources/images/reloadpaf.png" /></a>
          </p>
          <p>
            <asp:LinkButton ID="Lbthanhtoan" runat="server" OnClick="Lbthanhtoan_Click" ValidationGroup="G40" CssClass="btn-bt">Send</asp:LinkButton>
            <a class="btn-bt" href="javascript:void(0)" onclick="reset();" >Refresh</a>
          </p>
        </div>
        <div class="col5 fright">
        <address class="address">
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        </address>
     <map>
      <asp:Literal ID="Literal2" runat="server"></asp:Literal>
    </map>
        </div>
      </div>
    </section>
    <div style="text-align: center">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
            ShowSummary="False" ValidationGroup="G40" />                 
        <asp:Label ID="lblresult" runat="server" ForeColor="Red"></asp:Label>
    </div>
      <script type="text/javascript">
          function reset() {
              var name = document.getElementById("<%= Txtname.ClientID %>");
              var email = document.getElementById("<%= txtPhone.ClientID %>");
              var add = document.getElementById("<%= txtEmail.ClientID %>");
              var desc = document.getElementById("<%= txtContent.ClientID %>");
              var capcha = document.getElementById("<%= txtCapcha.ClientID %>");
              name.value = email.value = add.value = desc.value = capcha.value = "";
          }
    </script>
</asp:Content>
