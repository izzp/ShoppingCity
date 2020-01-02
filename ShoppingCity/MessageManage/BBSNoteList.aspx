<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="BBSNoteList.aspx.cs" Inherits="ShoppingCity.MessageManage.BBSNoteList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            text-align: center;
            font-size: 12px;
        }

        td {
            padding: 5px;
        }

        .title td {
            background: #f0f0f0;
        }

        .table {
            border: 1px solid #ccc;
            margin: 5px 5px 5px 5px;
            width: 525px;
        }

            .table th, p {
                padding: 8px 5px 8px 5px;
                background-color: #8d8d8d;
                color: white;
            }

        .ba_title {
            background: #f0f0f0;
            padding: 5px;
        }

        .ba_content {
            padding: 5px;
        }

        .ba_table {
            text-align: left;
            border: 1px solid #ccc;
            margin: 5px;
            width: 500px;
        }

        .txtbtn {
            width: 350px;
            height: 400px;
            /*background-color: pink;*/
            position: relative;
            float: right;
            top: -400px;
            /*text-align: center;*/
            right: 50px;
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
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="LinqDataSource1">
            <HeaderTemplate>
                <table class="table">
                    <tr>
                        <th style="width: 45%">标题</th>
                        <th style="width: 15%">发表人</th>
                        <th>发表时间</th>
                        <th></th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="text-align: left">
                        <asp:Label ID="lblSubject" runat="server" Text='<%# Eval("bnSubject") %>' /></td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Users.uName") %>' /></td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("bnAddTime") %>' /></td>
                    <td><a href="BBSAnswerList.aspx?id=<%#Eval("bnID")%>">查看</a></td>
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr class="title">
                    <td style="text-align: left">
                        <asp:Label ID="lblSubject" runat="server" Text='<%# Eval("bnSubject") %>' /></td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Users.uName") %>' /></td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("bnAddTime") %>' /></td>
                    <td><a href="BBSAnswerList.aspx?id=<%#Eval("bnID")%>">查看</a></td>
                </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="ShoppingCity.BBSDataContext" EntityTypeName="" TableName="BBSNote">
        </asp:LinqDataSource>
        <div class="txtbtn">

            <div style="font-size: 15px; height: 30px; text-align: center; border-bottom: solid 1px;">
                【添加留言】
            </div>
            <br />
            留言主题<asp:TextBox ID="txtbnSubject" runat="server" Width="300px" Height="30px"></asp:TextBox>
            <br />
            主题内容<asp:TextBox ID="txtbnContent" runat="server" TextMode="MultiLine" Width="350px" Height="100px"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="留言" CssClass="btnstyle" />
        </div>
    </div>
</asp:Content>
