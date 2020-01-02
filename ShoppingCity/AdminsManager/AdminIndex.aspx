
<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="AdminIndex.aspx.cs" Inherits="ShoppingCity.AdminIndex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .pica {
            width:200px;
            height:35px;
            border-radius:5px;
            background-color:pink;
            text-align:center;
            line-height:40px;
            font-size:20px;
            font-family:幼圆;
        }
        .picspan {
            width:32px;height:32px;
            position:relative;
            float:left;
            line-height:50px;
        }
        a {
        color:white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <asp:Literal ID="Literal2" runat="server"></asp:Literal> <hr />
        </div><br /><br/>
        <div class="pica">
            <span class="picspan">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/indeximg/admin-manage.png" Height="32px" Width="32px" />
            </span>
            <a href="AdminsManager.aspx">管理Admin</a>
        </div><br />
        <div class="pica">
            <span class="picspan">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/indeximg/icon-admin.png" Height="30px" Width="30px" />
            </span>
            <a href="../UserManager/UsersManager.aspx">管理用户</a>
        </div><br />
        <div class="pica">
            <span class="picspan">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/indeximg/goodsedit.png"  Height="30px" Width="30px" />
            </span>
            <a href="../GoodsManager/GoodsManage.aspx">管理商品</a>
        </div><br />
        <div class="pica">
            <span class="picspan">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/images/indeximg/goodstypedit.png" Height="30px" Width="30px" />
            </span>
            <a href="../GoodsManager/GoodsTypeManage.aspx">管理商品类别</a>
        </div>
    </div>
</asp:Content>
