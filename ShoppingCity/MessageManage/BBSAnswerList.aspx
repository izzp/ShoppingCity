<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="BBSAnswerList.aspx.cs" Inherits="ShoppingCity.BBSAnswerList" %>

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
            width:350px;
            height:400px;
            /*background-color:pink;*/
            position:relative;
            float:right;top:-10px;
            text-align:center;
            right:50px;
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
                        <th>留言内容</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="text-align: left">
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("bnSubject") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lbluName" runat="server" Text='<%# Eval("Users.uName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("bnAddTime") %>' />
                    </td>
                    <td>
                        <asp:Label ID="contentLabel" runat="server" Text='<%# Eval("bnContent") %>' />
                    </td>
                </tr>
                </table>
            </ItemTemplate>
        </asp:Repeater>
        <div class="txtbtn">
            <div style="font-size: 15px; height: 30px; text-align: center; border-bottom: solid 1px;">
            【回复留言】
        </div>
        <br />
            <asp:TextBox ID="txtbaContent" runat="server" Height="100px" TextMode="MultiLine" Width="350px"></asp:TextBox>
            <asp:Button ID="bnSubject" runat="server" OnClick="bnSubject_Click" Text="回复主题" CssClass="btnstyle" />
        </div>
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="LinqDataSource2">
            <ItemTemplate>
                <table class="ba_table">
                    <tr>
                        <td>
                            <div class="ba_title">
                                <asp:Label ID="lbluName" runat="server" Text='<%# Eval("Users.uName")%>' Style="font-weight: 700" />&nbsp;
                    于<asp:Label ID="timeLabel" runat="server" Text='<%# Eval("baAddTime") %>' />&nbsp;进行回复：
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="ba_content" style="width: 500px;">
                                <asp:Label ID="contentLabel" runat="server" Text='<%# Eval("baContent") %>' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:Repeater>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="ShoppingCity.BBSDataContext" TableName="BBSNote" EntityTypeName="" Where="bnID == @bnID">
            <WhereParameters>
                <asp:QueryStringParameter Name="bnID" QueryStringField="id" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="ShoppingCity.BBSDataContext" EntityTypeName="" TableName="BBSAnswer" Where="bnID == @bnID">
            <WhereParameters>
                <asp:QueryStringParameter Name="bnID" QueryStringField="id" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        
    </div>
</asp:Content>
