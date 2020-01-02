<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="GoodsList.aspx.cs" Inherits="ShoppingCity.GoodsList" Theme="default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="conts">
        <br />
        <div class="content">
            【商品展示】&nbsp;&nbsp;&nbsp;&nbsp;<asp:Literal ID="ltCurUser" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="../ShoppingCarManage.aspx">我的购物车</a>
        </div>
        <asp:DataList ID="dlstGoods" CssClass="aa" runat="server" RepeatColumns="5"
            DataKeyField="gdID" OnItemCommand="dlstGoods_ItemCommand">

            <ItemTemplate>

                <table class="tb">
                    <tr>
                        <td colspan="2"><a href="GoodsDetail.aspx?gdID=<%# Eval("gdID") %>">
                            <asp:Image ID="Image1" runat="server" ToolTip='<%# Eval("gdName") %>' CssClass="img" ImageUrl='<%# Eval("gdImage","../images/goods/{0}") %>' /></a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="tdrow"><a href="GoodsDetail.aspx?gdID=<%# Eval("gdID") %>">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("gdName") %>' /></a>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdl">价格：<asp:Literal ID="Label2" runat="server" Text='<%# Eval("gdPrice","{0:C}") %>' /><td class="tdr">运费：<asp:Literal ID="Literal1" runat="server" Text='<%# Eval("gdFeight","{0:C}") %>' /></td>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdl">已售：<asp:Literal ID="Literal2" runat="server" Text='<%# Eval("gdSaleQty","{0}件") %>' /></td>
                        <td class="tdr">评价数：<asp:Literal ID="Literal3" runat="server" Text='<%# Eval("gdEvNum") %>' /></td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <asp:ImageButton
                                ID="AddShop" runat="server" CommandName="addShop" ImageUrl="../images/icon/addCar.jpg" ToolTip="添加到购物车" OnClientClick="return confirm('确定要将商品添加到购物车？');"></asp:ImageButton></td>
                    </tr>
                </table>
            </ItemTemplate>

        </asp:DataList>
        <div class="tdrow"></div>
        <div>

            <asp:Label ID="lblCurPage" runat="server" Text="Label" />
            <asp:Label ID="lblTotalPage" runat="server" Text="Label" />
            <asp:LinkButton ID="lbtnPre" runat="server" CommandName="Pre" OnCommand="LinkBtnClick">上一页</asp:LinkButton>
            <asp:LinkButton ID="lbtnNext" runat="server" CommandName="Next" OnCommand="LinkBtnClick">下一页</asp:LinkButton>
        </div>
        <asp:SqlDataSource ID="sqlGoods" runat="server"
            ConnectionString="<%$ ConnectionStrings:SMDB %>" SelectCommand="SELECT * FROM [Goods]"></asp:SqlDataSource>
    </div>
</asp:Content>
