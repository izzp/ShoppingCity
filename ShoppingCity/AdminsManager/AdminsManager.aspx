<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="AdminsManager.aspx.cs" Inherits="ShoppingCity.AdminsManager.AdminsManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .st {
        width:800px;margin:0 auto;text-align:center;
        }
       /*.st>div> a {
            color:#2894ff;
            font-size:15px;
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center;">
        【管理员管理】
    <hr/>
    </div>
    <br />
    <br />
    <div class="st">
        <div style="position:relative;float:left;">
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <a href="AdminAdd.aspx">添加Admi</a>&nbsp
            <a href="AdminIndex.aspx">返回管理主界面</a>
        </div> <br /> <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
            AllowPaging="True" AllowSorting="True" PageSize="15" DataKeyNames="aID" CssClass="st">
            <PagerSettings FirstPageText="首页" LastPageText="末页" Mode="NextPreviousFirstLast"
                NextPageText="下一页" PreviousPageText="上一页" />
            <Columns>
                <asp:BoundField DataField="aName" HeaderText="管理员名称" SortExpression="aName" />
                <asp:BoundField DataField="aPwd" HeaderText="管理员密码" SortExpression="aPwd" />
                <asp:BoundField DataField="aType" HeaderText="管理员类型" SortExpression="aType" />
                <asp:BoundField DataField="aLastLogin" HeaderText="最后一次登录时间" SortExpression="aLastLogin" />
                <asp:TemplateField HeaderText="编辑">
                    <ItemTemplate>
                        <a href="EditAdmin.aspx?aID=<%#Eval("aID") %>">
                            <asp:Image ID="Image1" runat="server" ToolTip="编辑Admin" ImageUrl="~/images/icon/mod.png" />
                        </a>&nbsp;&nbsp;
                        <asp:ImageButton ID="ImageButton1" runat="server" ToolTip="删除Admin" ImageUrl="~/images/icon/delete.png"
                            CommandName="delete" OnClientClick="return confirm('确定要删除该Admin？')" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMDB %>"
            SelectCommand="SELECT * FROM [Admins]" 
            DeleteCommand="DELETE FROM Admins WHERE (aID = @aID)">
            <DeleteParameters>
                <asp:Parameter Name="aID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
