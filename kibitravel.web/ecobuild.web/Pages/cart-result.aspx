<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/SiteVI.Master" AutoEventWireup="true" CodeBehind="cart-result.aspx.cs" Inherits="kibitravel.web.vi_vn.cart_result" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
<div class="container">
   <div class="box bgWhite">
        <div class=" headingBox hdb2 "><span>Giỏ hàng</span></div>
        <div id="cart_page" class="bgWhite">

          <div class="row_th_cart">
            <h3 class="th_table_cart fl" style="width: 15%"> Hình ảnh </h3>
            <h3 class="th_table_cart fl" style="width: 40%"> Tên Sản Phẩm </h3>
            <h3 class="th_table_cart fl" style="width: 15%"> Giá Bán </h3>
            <h3 class="th_table_cart fl" style="width: 10%"> Số Lượng </h3>
            <h3 class="th_table_cart fl" style="width: 20%"> Thành Tiền </h3>
          </div>
          <asp:Repeater ID="Rpgiohang" runat="server" OnItemCommand="Rpgiohang_ItemCommand" OnItemDataBound="Rpgiohang_OnItemDataBound">
                    <ItemTemplate>
                    <!--Item Cart-->
          <div class="item_cart fl"> 
            <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" target='_parent' class='img_cart fl'>
            <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" /></a>
            <div class="cell name">
              <div> <span> <%# Eval("NEWS_TITLE") %></span></div>
            </div>
            <div class="cell unit"> <span class="new" id="soldprice_1757"> <%# String.Format("{0:0,0 VNĐ}", Eval("Basket_Price")).Replace(",", ".")%></span></div>
            <div class="cell amount"> 
              <!-- so luong -->
              <div class="quantity" style="margin: 0">
                <asp:DropDownList ID="ddlQty" runat ="server">
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                    <asp:ListItem Text="7" Value="7"></asp:ListItem>                    
                    <asp:ListItem Text="8" Value="8"></asp:ListItem>                    
                    <asp:ListItem Text="9" Value="9"></asp:ListItem>                    
                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                </asp:DropDownList>
                <input type="hidden" value='<%# Eval("NEWS_ID") %>' id="newsid" runat="server" />
              </div>
              <!-- --> 
            </div>
            <div class="cell total" id="dealtotal_1757"> <%# String.Format("{0:0,0 VNĐ}", Eval("BasketSum_Price")).Replace(",", ".")%></div>
            <asp:LinkButton ID="lnkRemove" runat="server" CommandName="Remove" class="close" CommandArgument='<%# Eval("news_id") %>'></asp:LinkButton>
            </div>
          <!--end Item Cart--> 
              </ItemTemplate>
            </asp:Repeater>

          <div class="foo-cart">
            <div class="total-cart">
              <p style="display: block"> Tổng tiền:<span id="total-money"> <span><asp:Label ID="Lbtotal" runat="server" Text=""></asp:Label></span> </span></p>
            </div>
          </div>
          <div class="button_cart"> 
          <a class=" btn btn-primary fl" href="/b1.html">Tiến hành đặt hàng >></a> 
            <a class=" btn btn-primary fl" href="/san-pham.html"> Mua thêm sản phẩm khác</a>
            <asp:LinkButton ID="Lbcapnhap" runat="server" CssClass=" btn btn-primary fl" OnClick="Lbcapnhap_Click">Cập nhật giỏ hàng</asp:LinkButton> 
          </div>
        </div>
        <!--end Cart Page--> 
      </div>
   
   
</div>
</asp:Content>
