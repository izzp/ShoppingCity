<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="ShoppingCity.AdminsManager.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .tbbor {
            width: 300px;
            height: 400px;
            margin: 0 auto;
            border-radius: 20px;
        }

        .txtcont {
            width: 100%;
            height: 50px;
            border: solid 0.5px;
            text-align: center;
            line-height: 50px;
            border-radius: 5px;
        }

        .fonts {
            width: 30%;
            text-align: center; /*左右居中*/
            line-height: 50px; /*上下居中*/
            position: relative;
            float: left;
            font-size: 18px;
        }
        .btnbor {
            width:150px;
            height:30px;
            border-radius:5px;
            font-size:20px;
            background-color:orange;
            position:relative;
            float:right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tbbor">
        <div style="font-size: 15px; height: 30px; text-align: center; border-bottom: solid 1px;">
            【管理员登录】
        </div>
        <br />
        <div class="txtcont">
            <span class="fonts">用户名：</span>
            <asp:TextBox ID="txtAdminName" runat="server" Width="200" Height="30"></asp:TextBox>
        </div><br />
        <div class="txtcont">
            <span class="fonts">密码：</span>
            <asp:TextBox ID="txtAdminPwd" runat="server" TextMode="Password" Width="200" Height="30"></asp:TextBox>
        </div><br />
        <div class="txtcont1">
            <span class="fonts">验证码：</span>
            <asp:TextBox ID="txtVCode" runat="server" Width="130px" Height="30px"></asp:TextBox>
            <asp:ImageButton ID="VCode" runat="server" ImageUrl="../VCode.aspx" OnClick="VCodeRefresh_Click" />
        </div><br />
        <div class="txtcont1">
            <asp:CheckBox ID="chkState" runat="server" Text="两周内自动登录"/>
            <asp:Button ID="btnLogin" runat="server" Text="登录" OnClick="btnLogin_Click"  CssClass="btnbor" />
        </div>
    </div>
</asp:Content>
