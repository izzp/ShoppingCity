<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="ShoppingCity.Login" Theme="default" %>

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
            float:left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tbbor">
        <div style="font-size: 15px; height: 30px; text-align: center; border-bottom: solid 1px;">
            【会员登录】
        </div><br />
        <div class="txtcont">
            <span class="fonts">用户名：</span>
            <asp:TextBox ID="txtUName" runat="server" Height="30" Width="200" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="txtUName" ErrorMessage="用户名不能为空！" Text="*" />
        </div><br />
        <div class="txtcont">
            <span class="fonts">密码：</span>
            <asp:TextBox ID="txtUPwd" runat="server" TextMode="Password" Width="200" Height="30" />
            <asp:RequiredFieldValidator ID="reqUPwd" runat="server"
                ControlToValidate="txtUPwd" ErrorMessage="密码不能为空！" Text="*" />
        </div><br />
        <div class="txtcont1">
            <asp:CheckBox ID="cbState" runat="server" Text="两周内不用登录" Height="30px" Width="150px" />
        </div>
        <div class="txtcont1">
            <asp:Button ID="btnLogin" runat="server" Text="登  录" OnClick="btnLogin_Click" CssClass="btnbor" />
            <asp:Button ID="btnCancel" runat="server" Text="取  消" CssClass="btnbor" OnClick="btnCancel_Click" />
        </div>
    </div>


</asp:Content>
