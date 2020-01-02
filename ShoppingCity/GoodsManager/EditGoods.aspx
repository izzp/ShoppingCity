<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="EditGoods.aspx.cs" Inherits="ShoppingCity.EditGoods" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tdleft {
        font-size:18px;/*td字体大小*/
        }
        td {
            height:40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        【修改商品】
    <hr />
    </div>
    <div style="margin:0 auto; width:500px;text-align:center;">
        <table class="tbcont">
            <tr>
                <td class="tdleft">商品ID：</td>
                <td>
                    <asp:Label ID="lblID" runat="server" Text="Label"></asp:Label></td>
                <td></td>
            </tr>
            <tr>
                <td class="tdleft">编号：</td>
                <td>
                    <asp:TextBox ID="txtCode" runat="server" Width="200px" Height="30px"></asp:TextBox></td>
                <td></td>
            </tr>

            <tr>
                <td class="tdleft">名称：</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" CssClass="txtwidth" Width="200px" Height="30px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdleft">商品类别：</td>
                <td>
                    <asp:DropDownList ID="ddlType" runat="server"
                        DataSourceID="sqlType" DataTextField="tName"
                        DataValueField="tID" Width="200px" Height="30px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sqlType" runat="server"
                        ConnectionString="<%$ ConnectionStrings:smdb %>"
                        SelectCommand="SELECT * FROM GoodsType"></asp:SqlDataSource>
                </td>
                <td rowspan="7">
                    <asp:Image ID="img" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="tdleft">价格：</td>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server" Width="200px" Height="30px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="tdleft">入库数量：</td>
                <td>
                    <asp:TextBox ID="txtQuantity" runat="server" Width="200px" Height="30px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdleft">销售量：</td>
                <td>
                    <asp:Label ID="lblSaleQty" runat="server" Text="Label" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="tdleft">供应商城市：</td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server" Width="200px" Height="30px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdleft">运费：</td>
                <td>
                    <asp:TextBox ID="txtFeight" runat="server" Width="200px" Height="30px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdleft">商品图片：</td>
                <td>
                    <asp:FileUpload ID="fldImg" runat="server" Width="200px" Height="30px" />
                </td>
            </tr>
            <tr>
                <td class="tdleft">商品描述：</td>
                <td>
                    <asp:TextBox ID="txtInfo" runat="server" TextMode="MultiLine" CssClass="txtwidth"
                        Width="200px" Height="100px"></asp:TextBox></td>
                <td></td>
            </tr>
            <tr>
                <td class="tdleft">
                    <asp:Button ID="btnEdit" runat="server" Text="修改" OnClick="btnEdit_Click" /></td>
                <td>
                    <asp:Button ID="Button1" runat="server" PostBackUrl="~/GoodsManager.aspx" Text="返回主界面" Width="88px" OnClick="Button1_Click" />
                </td>
                <td></td>
            </tr>
        </table>
    </div>
</asp:Content>
