<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="enMenuMain.ascx.cs" Inherits="ecobuild.Usercontrols.enMenuMain" %>

<nav class="navx-it">
    <ul>
        <asp:Repeater ID="Rpmenu" runat="server">
            <ItemTemplate>
                <li class='<%#GetStyleActive(Eval("cat_seo_url"),Eval("cat_url")) %>'>
                    <a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                        <i class="img-li"><img src="<%# GetImageCat(Eval("CAT_ID"),Eval("CAT_IMAGE1")) %>" /></i>
                        <span><%#Eval("cat_name")%></span>
                    </a>
                    <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                                    <i class="img-li"><img src="<%# GetImageCat(Eval("CAT_ID"),Eval("CAT_IMAGE1")) %>" /></i>
                                    <span><%#Eval("cat_name")%></span>
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
                    </asp:Repeater>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</nav>