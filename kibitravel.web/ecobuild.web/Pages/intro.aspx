<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Default.Master" AutoEventWireup="true" CodeBehind="intro.aspx.cs" Inherits="kibitravel.web.Pages.intro" %>
<%@ Register src="../Usercontrols/intro.ascx" tagname="intro" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:intro ID="intro1" runat="server" />
</asp:Content>
