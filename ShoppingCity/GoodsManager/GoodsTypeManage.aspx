<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="GoodsTypeManage.aspx.cs" Inherits="ShoppingCity.GoodsTypeManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 400px;
            /*background-color: skyblue;*/
            position: relative;
            float: right;
            top:20px;
        }
        .conts {
        width:700px;
        margin:0 auto;
        text-align:center;
        }
        .btnstyle {
        width:70px;
        height:30px;
        border-radius:5px;
        background-color:orange;
        }
        .tbfont {
        font-size:17px;
        color:black;
        font-family:幼圆;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        【商品类别管理】
    <hr />
    </div>
    <div class="conts">
        <div style="width: 300px; height: 300px; position: relative; float: left;  text-align: center">
            <asp:GridView ID="gvGoodType" runat="server" AutoGenerateColumns="False" DataKeyNames="tID">
                <Columns>
                    <asp:BoundField DataField="tID" HeaderText="类别编号" />
                    <asp:BoundField DataField="tName" HeaderText="类别名称" />
                </Columns>
            </asp:GridView>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="ShoppingCity.GoodsManager.GoodsTypeDataContext" EntityTypeName="" TableName="GoodsType">
            </asp:LinqDataSource>
        </div>
        <table class="auto-style1">
            <tr>
                <th colspan="3">更改表数据</th>
            </tr>
            <tr>
                <td class="tbfont">插入数据:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="200px" Height="30px"></asp:TextBox></td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="插入数据" OnClick="Button1_Click" CssClass="btnstyle" /></td>
            </tr>
            <tr>
                <td class="tbfont">修改前：</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="200px" Height="30px"></asp:TextBox></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="tbfont">修改后：</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Width="200px" Height="30px"></asp:TextBox></td>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Style="text-align: center" Text="确认修改" CssClass="btnstyle" /></td>
            </tr>
            <tr>
                <td class="tbfont">删除数据：</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Width="200px" Height="30px"></asp:TextBox></td>
                <td>
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="确认删除" CssClass="btnstyle" /></td>
            </tr>
        </table>
    </div>

</asp:Content>
