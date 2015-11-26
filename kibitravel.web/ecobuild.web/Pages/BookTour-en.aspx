<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/enDefault.Master" AutoEventWireup="true" CodeBehind="BookTour-en.aspx.cs" Inherits="kibitravel.web.BookTour_en" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="breadcrumb">
      <ul>
        <li><a href="/home.html">Home</a></li>
        <li><a href="#">Book Tour</a></li>
      </ul>
    </nav>
    <section class="content">
      <div class="iblock book-tour">
        <p class="tt-mt"> <span class="mt-s"><b>Book Tour</b></span> </p>
        <div class="frm-book-tour">
        <p class="text-bt">Complete the reservation form below to redeem your voucher and book your tour. An email will be sent confirming your details submitted on your form and we will contact you if any additional information is required. By submitting this form you have read and agree to the Terms & Conditions. Thank you for making a reservation with Kibitravel!</p>
          <p> Name
            <input type="text" class="txt-bt" id="Txtname" runat="server" placeholder="Please enter your full name"/>
            <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Please enter your full name"
                ControlToValidate="Txtname" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
          </p>
          <p> Phone
            <input type="text" class="txt-bt" id="txtPhone" placeholder="Please enter your phone number" runat="server"/>
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
            <textarea class="txt-bt" id="txtContent" placeholder="Please enter your message" runat="server"></textarea>
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
