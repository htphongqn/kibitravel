<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="enBookTour.ascx.cs" Inherits="kibitravel.web.Usercontrols.enBookTour" %>

<!---================BOOKTOUR===================--> 
<script type="text/javascript">
    $(document).ready(function () {
        $(".c-frm").hide();
        var notH = 1,
	$pop = $('.c-frm').hover(function () { notH ^= 1; });
        $(document).on('mouseup keyup', function (e) {
            if (notH || e.which == 27) $pop.stop().hide();
        });
        $('.booktour-link').click(function () {
            $('.c-frm').fadeIn('fast').end().siblings().$('.c-frm').hide('fast');
            event.stopPropagation();
        });

        $('.close-btn').click(function () {
            $('.c-frm').fadeOut('fast');
        });
    }); 
</script>
<div class="c-frm" style="display:none">
  <div class="container" >
    <div class="frm-booktour" > <span class="close-btn"><i class="fa fa-close"></i></span>
      <p class="tt-mt"> <span class="mt-s"><b>Tell us your stories</b></span> </p>
      <div class="frm-book-tour">
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
    </div>
  </div>
</div>
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
<!---==============END BOOKTOUR=================-->