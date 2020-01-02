<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="AddGoods.aspx.cs" Inherits="ShoppingCity.AddGoods" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        td {
            height:50px;
        }
        .auto-style1 {
            width: 213px;
        }
        .tbcont{width:100%;}
        .auto-style2 {
            width: 73px;
            font-size:18px;/*td字体大小*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        【添加商品】
    <hr />
    </div>
    <div style="margin:0 auto; width:500px;text-align:center;">
        <table class="tbcont">
            <tr>
                <td class="auto-style2">商品类别：</td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddlType" runat="server"
                        DataSourceID="sqlType" DataTextField="tName"
                        DataValueField="tID" Width="200px" Height="30px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sqlType" runat="server"
                        ConnectionString="<%$ ConnectionStrings:smdb %>"
                        SelectCommand="SELECT * FROM GoodsType"></asp:SqlDataSource>
                </td>
            </tr>

            <tr>
                <td class="auto-style2">编号：</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtCode" runat="server" Height="30px" Width="200px"></asp:TextBox></td>
            </tr>

            <tr>
                <td class="auto-style2">名称：</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtName" runat="server" CssClass="txtwidth" Height="30px" Width="200px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="auto-style2">价格：</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtPrice" runat="server" Height="30px" Width="200px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="auto-style2">入库数量：</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtQuantity" runat="server" Height="30px" Width="200px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="auto-style2">供应商城市：</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtCity" runat="server" Height="30px" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">运费：</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtFeight" runat="server" Height="30px" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">商品图片：</td>
                <td class="auto-style1">
                    <asp:FileUpload ID="fldImg" runat="server" Height="30px" Width="200px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">商品描述：</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtInfo" runat="server" TextMode="MultiLine" CssClass="txtwidth"
                        Height="100px" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnAdd" runat="server" Text="添加" OnClick="btnAdd_Click" Height="25px" Width="40px" /></td>
                <td class="auto-style1">
                    <asp:Button ID="Button1" runat="server" PostBackUrl="~/GoodsManager.aspx" Text="返回主界面" Height="25px" Width="80px"  />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
