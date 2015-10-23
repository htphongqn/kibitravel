<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Default.Master" AutoEventWireup="true" CodeBehind="Contact-en.aspx.cs" Inherits="kibitravel.web.Contact_en" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="breadcrumb">
      <ul>
        <li><a href="/home.html">Home</a></li>
        <li><a>Contact</a></li>
      </ul>
    </nav>
    <section class="content">
      <div class="iblock contact">
        <p class="tt-mt"> <span class="mt-s"><b>Liên hệ</b></span> </p>
        <div class=" col6">
        <p class="text-bt">Xin vui lòng hoàn thành những yêu cầu bên dưới."</p>
          <p> Họ và tên
            <input type="text" class="txt-bt" id="Txtname" placeholder="Họ và tên" runat="server"/>
            <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ và tên!"
                ControlToValidate="Txtname" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
          </p>
          <p> Số điện thoại
            <input type="text" class="txt-bt" id="txtPhone" placeholder="Số điện thoại" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập số điện thoại!"
                ControlToValidate="txtPhone" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
          </p>
          <p> Email
            <input type="text" class="txt-bt" id="txtEmail" placeholder="Địa chỉ email" runat="server"/>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="E-mail định dạng chưa đúng!" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="None"
                ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
          </p>
          <p>Tin nhắn
            <textarea class="txt-bt" id="txtContent" placeholder="Message" runat="server"></textarea>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập nội dung!"
                ControlToValidate="txtContent" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
          </p>
          
          <p class="cht">
          Mã an toàn<br />
            <script type="text/javascript"  language="Javascript">
                function Catpc() {
                    var img = document.getElementById("icp");
                    img.src = "/Pages/captchr.ashx?query=" + Math.random();
                }
            </script>
            <input type="text" class="txt-bt captcha" id="txtCapcha" placeholder="Nhập mã an toàn" runat="server"/>
            <img id="icp" src='/Pages/captchr.ashx?query=<%= querys() %>' alt="Mã  an toàn" />
            <a href="javascript:void(0)" onclick="javascript:Catpc();"><img title="Refresh" src="/Resources/images/reloadpaf.png" /></a>
          </p>
          <p>
            <asp:LinkButton ID="Lbthanhtoan" runat="server" OnClick="Lbthanhtoan_Click" ValidationGroup="G40" CssClass="btn-bt">Gửi tin</asp:LinkButton>
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
