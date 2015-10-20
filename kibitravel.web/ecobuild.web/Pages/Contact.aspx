<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Default.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ecobuild.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bor2">
      <div class="control-top"> 
        <span>Liên hệ</span> 
        <a href="/" class="back-to"><i class="fa fa-mail-reply"></i> Back</a> 
        <a href="/" class="bk-home"><i class="fa fa-home"></i></a> 
      </div>
      <div class="testDiv">
        <div class="iblock contact">
          <p style="margin-bottom:10px; ">Chúng tôi rất vui lòng nhận được sự quan tâm của quý khách!<br />
            Vui lòng điền đầy đủ thông tin vào form dưới đây chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất.</p>
          <div class="form-ct">
            <input type="text" id="Txtname" placeholder="Họ và tên" runat="server"/>
            <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ và tên!"
                ControlToValidate="Txtname" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            <input type="text" id="txtEmail" placeholder="Địa chỉ email" runat="server"/>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="E-mail định dạng chưa đúng!" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="None"
                ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
            <input type="text" id="txtPhone" placeholder="Số điện thoại" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập số điện thoại!"
                ControlToValidate="txtPhone" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            <input type="text" id="txttitle" placeholder="Tiêu đề" runat="server"/>
            <textarea id="txtContent" placeholder="Message" runat="server"></textarea>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập nội dung!"
                ControlToValidate="txtContent" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            <p class="send">
               <script type="text/javascript"  language="Javascript">
                    function Catpc() {
                        var img = document.getElementById("icp");
                        img.src = "/Pages/captchr.ashx?query=" + Math.random();
                    }
              </script>
              <input type="text" class="captcha" id="txtCapcha" placeholder="Nhập mã an toàn" runat="server"/>
              <img id="icp" src='/Pages/captchr.ashx?query=<%= querys() %>' alt="Mã  an toàn" />
              <a href="javascript:void(0)" onclick="javascript:Catpc();"><img title="Refresh" src="/Resources/images/reloadpaf.png" /></a>
              <asp:LinkButton ID="Lbthanhtoan" runat="server" OnClick="Lbthanhtoan_Click" ValidationGroup="G40" CssClass="btn-send">Gửi tin</asp:LinkButton>
            </p>
          </div>
          <address class="address-ct">
          <!--begin--> 
          <asp:Literal ID="Literal1" runat="server"></asp:Literal>
          <!--end-->
          </address>
          <map class="map">
            <p><b>Bản đồ</b></p>
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
