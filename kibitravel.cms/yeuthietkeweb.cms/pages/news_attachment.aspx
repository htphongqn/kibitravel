<%@ Page Title="" Language="C#" MasterPageFile="~/master/Site.Master" AutoEventWireup="true" CodeBehind="news_attachment.aspx.cs" Inherits="yeuthietkeweb.cms.pages.news_attachment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
<div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">File đính kèm</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-12 panel-body">
            <asp:Button ID="lbtDelete" runat="server" Text="Xóa" CssClass="btn btn-default btn-success btn-sm"  onclick="lbtDelete_Click" CausesValidation="false" OnClientClick="return confirm('Bạn có chắc chắn xóa không?');" />
            <asp:Button ID="lbtSave" runat="server" Text="Lưu" CssClass="btn btn-default btn-success btn-sm"  onclick="lbtSave_Click" />
            <a href="#" onclick="javascript:document.location.reload(true);" class="btn btn-default btn-success btn-sm">Cập nhật</a>
            <a href="#" id="hplBack" runat="server" class="btn btn-default btn-success btn-sm">Quay lại</a>
        </div>
        <div class="col-lg-12 panel-body">
            <a href="#" id="hplCatNews" runat="server" class="btn btn-default btn-sm">Chọn chuyên mục </a>
            <a href="#" id="hplEditorHTMl" runat="server" class="btn btn-default btn-sm">Soạn  tin HTML </a>
            <a href="#" id="hplNewsAtt" runat="server" class="btn btn-default btn-sm">File  đính kèm </a>
            <a href="#" id="hplAlbum" runat="server" class="btn btn-default btn-sm">Album hình </a>
            <a href="#" id="hplComment" runat="server" class="btn btn-default btn-sm">Thông tin phản hồi</a>                
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Thông tin file đính kèm
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <asp:Label CssClass="user" ID="lblError" runat="server"></asp:Label>
                    </div>
                    <div class="form-group" style="margin-bottom:0">
                        <label><asp:Literal ID="lbMessage" runat="server" Text=""></asp:Literal></label>
                    </div>                    
                    <div class="form-group">
                        <label>Tiêu đề</label>
                        <input type="text" name="txtTitle" id="txtTitle" runat="server" class="form-control"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập tên tiêu đề"
                            Text="Vui lòng nhập tiêu đề" ControlToValidate="txtTitle" CssClass="errormes"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group" style="display:none;">
                        <label>Loại file</label>
                        <asp:DropDownList ID="ddlExtFiles" runat="server" class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Thứ tự</label>
                        <input type="text" name="txtOrder" id="txtOrder" runat="server" onkeyup="this.value=formatNumeric(this.value);"
                            onblur="this.value=formatNumeric(this.value);" maxlength="4" class="form-control"
                            value="1" />
                    </div>
                    <div class="form-group">
                        <label>Url</label>
                         <input type="text" name="txtUrl" id="txtUrl" runat="server" class="form-control" />
                    </div>                
                    <div class="form-group" id="trUpload" runat="server">
                        <label>Upload File</label>
                         <input id="fileImage1" type="file" name="fileImage1" size="50" runat="server">
                    </div>
                    <div class="form-group" id="trFile" runat="server">
                        <asp:ImageButton ID="btnDelete1" runat="server" ImageUrl="../images/icon_delete.png"
                            BorderWidth="0" Width="13px" OnClick="btnDelete1_Click" ToolTip="Xóa hình minh họa này">
                        </asp:ImageButton>
                         <asp:HyperLink runat="server" ID="hplFile" Target="_blank"></asp:HyperLink>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th class="center">STT</th>
                                    <th class="center">Tên</th>
                                    <th class="center">Xóa</th>
                                </tr>
                            </thead>
                            <tbody>                                
                                <asp:Repeater ID="rptList" runat="server" OnItemCommand="rptList_ItemCommand">
                                    <ItemTemplate>
                                        <tr class="odd gradeX">
                                            <td class="center">
                                                <%# getOrder() %>
                                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("NEWS_ATT_ID")%>' Visible="false"></asp:Label>
                                            </td>
                                            <td class="center">
                                                <a href='<%# getLink(DataBinder.Eval(Container.DataItem, "NEWS_ATT_ID")) %>'>
                                                    <%# DataBinder.Eval(Container.DataItem, "NEWS_ATT_NAME")%>
                                                </a>
                                            </td>
                                            <td class="center">
                                                <asp:LinkButton ID="lnkbtnDel" runat="server" CommandName="Delete" CausesValidation="false" OnClientClick="return confirm('Bạn có chắc chắn xóa?');">
                                                    <img src="../images/icon_delete.png" title="Xóa" border="0">
                                                </asp:LinkButton>
                                            </td>
                                        </tr>    
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
     <script>
         $(document).ready(function () {
             $('#dataTables-example').DataTable({
                 responsive: true,
                 "paging": false,
                 "ordering": false,
                 "info": false
             });
         });
    </script>
</asp:Content>
