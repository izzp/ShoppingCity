<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ShoppingCarManage.aspx.cs" Inherits="ShoppingCity.ShoppingCarManage" Theme="default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="content">
            【购物车】&nbsp;<asp:Literal ID="ltCurUser" runat="server" />
        </div>
        <br />
        <br />
        <div style="margin: 0 auto; width: 900px; text-align: center;">
            <asp:GridView ID="grdGoods" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                DataKeyNames="sciID" DataSourceID="sqlGoods" CssClass="tb_content" GridLines="None"
                PageSize="3" OnRowDataBound="grdGoods_RowDataBound" ShowFooter="True" OnSelectedIndexChanged="grdGoods_SelectedIndexChanged">
                <HeaderStyle CssClass="hstyle" />
                <FooterStyle CssClass="fstyle" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" Checked="true" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="lbtnSelectAll" runat="server" OnClick="lbtnSelectAll_Click">取消全选</asp:LinkButton>
                        </FooterTemplate>
                        <ItemStyle CssClass="center"></ItemStyle>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="宝贝">
                        <ItemTemplate>
                            <a href='<%#Eval("gdID","../GoodsManager/GoodsDetail.aspx?gdid={0}") %>'>
                                <asp:Image ID="img1" runat="server"
                                    ImageUrl='<%# Eval("gdImage", "images/goods/l{0}") %>' CssClass="noborder" /></a>
                        </ItemTemplate>
                        <FooterTemplate>
                            <a href="~/GoodsManager/GoodsList.aspx">继续挑选商品</a>
                        </FooterTemplate>
                        <ItemStyle CssClass="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="名称">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlkName" runat="server"
                                NavigateUrl='<%# Eval("gdID", "../GoodsManager/GoodsDetail.aspx?gdid={0}") %>'
                                Text='<%# Eval("gdName") %>'></asp:HyperLink>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="lbtnClear" runat="server" Text="清空购物车" OnClick="lbtnClear_Click" />
                        </FooterTemplate>
                        <ItemStyle CssClass="name" />
                    </asp:TemplateField>

                    <asp:BoundField DataField="gdPrice" ItemStyle-CssClass="center" DataFormatString="{0:C}" HeaderText="单价(元)">

                        <ItemStyle CssClass="center"></ItemStyle>

                    </asp:BoundField>

                    <asp:TemplateField ItemStyle-CssClass="center" HeaderText="数量">
                        <ItemTemplate>
                            <asp:TextBox ID="txtNum" runat="server" Width="20px" Text='<%#Bind("scNum") %>' />
                            <asp:ImageButton ID="ibtnUpdate" runat="server" CausesValidation="False" ImageUrl="images/icon/mod.png" ToolTip="点击更新数量"
                                CommandName="Update" Text="更新" OnClientClick="return confirm('确定要修改该商品购买数量？');"></asp:ImageButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Literal ID="ltlTotal" runat="server" Text="商品总价：" />
                        </FooterTemplate>
                        <ItemStyle CssClass="center"></ItemStyle>

                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="center" HeaderText="小计(元)">

                        <ItemTemplate>
                            <asp:Literal ID="ltlSum" runat="server" Text='<%#Eval("scSum","{0:f}")%>' />
                        </ItemTemplate>

                        <ItemStyle CssClass="center"></ItemStyle>

                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDel" runat="server" CausesValidation="False"
                                CommandName="Delete" Text="删除" OnClientClick="return confirm('确定要从购物车中删除该商品？');"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <a href="/Pay/AliPay.aspx">
                                <asp:Image ID="imagComp" ImageUrl="images/icon/comp.jpg" runat="server" CssClass="noborder" /></a>
                        </FooterTemplate>
                        <ItemStyle CssClass="center" />
                    </asp:TemplateField>
                </Columns>
                <AlternatingRowStyle BackColor="#e2f2ff" />

                <EmptyDataTemplate>
                    <span style="font-size: 10.5pt; background-color: #ededed">购物车内没有放置任何商品!</span>
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="sqlGoods" runat="server"
                ConnectionString="<%$ ConnectionStrings:smdb %>" ProviderName="System.Data.SqlClient"
                SelectCommand="upGetInfoByScid" SelectCommandType="StoredProcedure"
                DeleteCommand="upDelScarInfoBySciID" DeleteCommandType="StoredProcedure"
                UpdateCommand="upUpdateNumBySciID" UpdateCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="scID" SessionField="scID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="scNum" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
