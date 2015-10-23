<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="enHeader.ascx.cs" Inherits="kibitravel.web.Usercontrols.enHeader" %>

<header class="header" role="banner">
    <div class="container"> 
    <asp:Repeater ID="Rplogo" runat="server">
        <ItemTemplate>
            <%# Getbanner(Eval("BANNER_TYPE"), Eval("BANNER_FIELD1"), Eval("BANNER_ID"), Eval("BANNER_FILE"))%>
        </ItemTemplate>
    </asp:Repeater>
    <div class="navx"><a href="#" id="pull" class="clearfix"><i class="openIco fa fa-align-justify"></i> <i class="closeIco fa fa-remove"></i></a>
        <ul>
        <asp:Repeater ID="Rpmenu" runat="server">
            <ItemTemplate>
                <li class='<%#GetStyleActive(Eval("cat_seo_url"),Eval("cat_url")) %>'>
                    <a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                        <%#Eval("cat_name")%>
                    </a>
                    <%--<asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                                    <%#Eval("cat_name")%>
                                </a>
                                <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                                    <HeaderTemplate>
                                        <ul>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                                            <%#Eval("cat_name")%></a></li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>--%>
                </li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
    </div>
    </div>
</header>