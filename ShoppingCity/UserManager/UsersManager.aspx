<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="UsersManager.aspx.cs" Inherits="ShoppingCity.UserManager.UsersManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .st {
        width:800px;margin:0 auto;text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center;">
        【用户管理】
    <hr//>
    </div>
    <br />
    <br />
        <div>
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="uID"
            OnRowDeleting="gvUsers_RowDeleting" CssClass="st">
            <Columns>
                <asp:BoundField DataField="uID" HeaderText="编号" />
                <asp:BoundField DataField="uName" HeaderText="用户名" />
                <asp:BoundField DataField="uRealName" HeaderText="姓名" />
                <asp:BoundField DataField="uSex" HeaderText="性别" />
                <asp:BoundField DataField="uAge" HeaderText="年龄" />
                <asp:BoundField DataField="uHobby" HeaderText="爱好" />
                <asp:BoundField DataField="uRegTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册时间" />
                <asp:TemplateField>
                    <ItemTemplate>
                        &nbsp;<asp:HyperLink ID="hlinkEdit" runat="server" NavigateUrl='<%# Bind("uID","EditUsers.aspx?id={0}") %>' ImageUrl="../images/icon/mod.png"></asp:HyperLink>
                        &nbsp;<asp:LinkButton ID="lbtDelete" runat="server" CommandName="delete" OnClientClick="return confirm('确定要删除该Admin？')" ><img src="../images/icon/delete.png" /></asp:LinkButton>&nbsp;
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
