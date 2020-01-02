<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="EditAdmin.aspx.cs" Inherits="ShoppingCity.AdminsManager.EditAdmin" %>

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
            width: 40%;
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
            <span class="fonts">管理者名称：</span>
            <asp:TextBox ID="txtAdminName" runat="server" ReadOnly="True" Width="150px" Height="30px"></asp:TextBox>
        </div><br />
        <div class="txtcont">
            <span class="fonts">管理员密码：</span>
            <asp:TextBox ID="txtAdminPwd" runat="server" Width="150px" Height="30px"></asp:TextBox>
        </div><br />
        <div class="txtcont">
            <span class="fonts">管理员类型：</span>
            <asp:DropDownList ID="ddlAdminType" runat="server" Width="150px" Height="30px">
                <asp:ListItem Value="1">高级管理员</asp:ListItem>
                <asp:ListItem Value="2">普通管理员</asp:ListItem>
            </asp:DropDownList>
        </div><br />
        <div class="txtcont1">
            <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="更改" CssClass="btnbor"/>
        </div>
    </div>
</asp:Content>
