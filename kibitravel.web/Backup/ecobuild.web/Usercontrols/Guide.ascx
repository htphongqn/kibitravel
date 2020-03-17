<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Guide.ascx.cs" Inherits="kibitravel.web.Usercontrols.Guide" %>

<section class="download-guide-book">
    <div class="container">
        <%--<asp:Repeater ID="rptBookDownload" runat="server">
            <ItemTemplate>
                <h2 class="tt-dl"><%# Eval("NEWS_TITLE") %></h2>
                <p class="caption-dl"><%# Eval("NEWS_DESC")%></p>                
                <asp:Repeater ID="Rpattfile" runat="server" DataSource='<%# Loadattfile(Eval("NEWS_SEO_URL")) %>'>
                        <ItemTemplate>
                            <%#BindAttItems(Eval("NEWS_ID"), Eval("EXT_ID"), Eval("NEWS_ATT_NAME"), Eval("NEWS_ATT_URL"), Eval("NEWS_ATT_FILE"))%>
                        </ItemTemplate>
                    </asp:Repeater>                   
            </ItemTemplate>
        </asp:Repeater>--%>
        <a class='btn-mn' href='/lien-he.html'>Gửi yêu cầu</a>
    </div>
</section>