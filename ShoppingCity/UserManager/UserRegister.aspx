<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="ShoppingCity.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        td {
            height:40px;
        }
        table{width:100%;}
        .title {
            width: 73px;
            font-size:18px;/*td字体大小*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        【用户注册】
    <hr />
    </div>
    <br />
    <div style="margin:0 auto; width:500px;text-align:center;">
        <table class="tb_content">
        <tr>
            <td class="title">用户名：</td>
            <td>
                <asp:TextBox ID="txtuName" runat="server" Height="30px" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="title">密码：</td>
            <td>
                <asp:TextBox ID="txtuPwd" runat="server" Height="30px" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="title">姓名：</td>
            <td>
                <asp:TextBox ID="txtuRealName" runat="server" Height="30px" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="title">性别：</td>
            <td>
                <asp:RadioButtonList ID="rbluSex" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="title">年龄：</td>
            <td>
                <asp:TextBox ID="txtuAge" runat="server" Height="30px" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="title">爱好：</td>
            <td>
                <asp:CheckBoxList ID="cbluHobby" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>看书</asp:ListItem>
                    <asp:ListItem>上网</asp:ListItem>
                    <asp:ListItem>音乐</asp:ListItem>
                    <asp:ListItem>打球</asp:ListItem>
                    <asp:ListItem>跑步</asp:ListItem>
                    <asp:ListItem>游泳</asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="title">邮箱：</td>
            <td>
                <asp:TextBox ID="txtuEmail" runat="server" Height="30px" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="title">QQ：</td>
            <td>
                <asp:TextBox ID="txtuQQ" runat="server" Height="30px" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="title">手机：</td>
            <td>
                <asp:TextBox ID="txtuPhone" runat="server" Height="30px" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="title">头像：</td>
            <td>
                <asp:DropDownList ID="ddluImage" runat="server" OnSelectedIndexChanged="ddluImage_SelectedIndexChanged" AutoPostBack="True" Height="30px" Width="180px"></asp:DropDownList>
                <asp:Image ID="imguImage" runat="server" ImageUrl="~/images/userico/1.gif" />
            </td>
        </tr>
        <tr>
            <td class="title">
                <asp:Button ID="btnAdd" runat="server" Text="注册" BorderStyle="Double" Font-Size="Medium" OnClick="btnAdd_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </div>
    
</asp:Content>
