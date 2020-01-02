<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="GoodsDetail.aspx.cs" Inherits="ShoppingCity.GoodsManager.GoodsDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .picdiv {
            width:300px;
            height:400px;
            position:relative;
            float:left;
            left:40px;
            border:solid 1px gray;
        }
        .goodscont {
            width:600px;
            height:400px;
            position:relative;
            float:left;
            left:80px;
            top:50px;
        }
        .lbpri {
            color:red;
            font-size:30px;
        }
        .btnstyle {
            width:100px;
            height:30px;
            border-radius:5px;
            background-color:orange;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        【商品详情】
    <hr />
    </div>
    <div class="picdiv">
        <asp:Image ID="img" runat="server" Width="300px" Height="400px" />
    </div>
    <div class="goodscont">
        <div >
            <h2><asp:Label ID="Label2" runat="server" Text="Label" Font-Size="Larger" ForeColor="Black"></asp:Label></h2>
        </div> <br />
        <div>
            <span style="width:50px;text-align:center;line-height:40px; position:relative;float:left;left:5px; font-size:15px;color:black;">价格</span>
            <span class="lbpri">￥<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></span>
        </div><br />
        <div>
            <span style="width:50px;text-align:center;line-height:40px; position:relative;float:left;left:5px; font-size:15px;color:black;">运费</span>
            <span style="font-size:20px; line-height:40px;">全国统一价<asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>元</span>
            <span style="color:black">发货地&nbsp<asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></span>
        </div><br />
        <div >
            <span style="width:150px;border-right:solid 1px;position:relative;float:left; font-size:15px; left:15px;">
                日销售量：<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
            </span>
            <span style="position:relative;float:left; left:50px; font-size:15px;">
                库存量：<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            </span>
        </div><br /><br />
        <div>
            <span style="color:black; position:relative;left:20px;">
                商品描述
            </span>
            <span style="position:relative;left:30px;">
                <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
            </span> 
        </div><br />
        <div>
            
            <asp:Button ID="btnbuy" runat="server" Text="立即购买" CssClass="btnstyle" OnClick="btnbuy_Click" />
        </div>
    </div>
</asp:Content>
