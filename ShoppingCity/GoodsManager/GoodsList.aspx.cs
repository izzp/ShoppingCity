using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCity
{
    public partial class GoodsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ltCurUser.Text = "当前用户：游客";
            if (Session["uName"] != null)
                ltCurUser.Text = "当前用户：" + Session["uName"];
            if (!IsPostBack)
                DataListBind();
        }
        /// <summary>
        /// DataList分页数据绑定
        /// </summary>
        protected void DataListBind()
        {
            int PageNumer = 1;
            if (ViewState["Page"] != null)
            {
                PageNumer = Convert.ToInt16(ViewState["Page"]);
            }
            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = sqlGoods.Select(DataSourceSelectArguments.Empty);
            pds.AllowPaging = true;
            pds.PageSize = 5;
            if (PageNumer > pds.PageCount)
                PageNumer = 1;

            pds.CurrentPageIndex = PageNumer - 1;
            dlstGoods.DataSourceID = null;
            dlstGoods.DataSource = pds;
            dlstGoods.DataBind();

            lblCurPage.Text = "第" + (pds.CurrentPageIndex + 1).ToString() + "页";
            lblTotalPage.Text = "/共" + pds.PageCount.ToString() + "页";
            ViewState["Page"] = PageNumer;

            lbtnPre.Enabled = true;
            lbtnNext.Enabled = true;
            if (pds.IsFirstPage)
            {
                lbtnPre.Enabled = false;
            }
            if (pds.IsLastPage)
            {
                lbtnNext.Enabled = false;
            }
        }
        protected void LinkBtnClick(object sender, CommandEventArgs e)
        {
            int curPage = Convert.ToInt16(ViewState["Page"]);
            if (e.CommandName == "Pre")
                ViewState["Page"] = curPage - 1;
            else if (e.CommandName == "Next")
                ViewState["Page"] = curPage + 1;
            DataListBind();
        }

        protected void dlstGoods_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (Session["uID"] != null && e.CommandName == "addShop")
            {
                int gdID = Convert.ToInt32(dlstGoods.DataKeys[e.Item.ItemIndex]);

                string str = ConfigurationManager.ConnectionStrings["smdb"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(str))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("upAddGoodsToCar", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter[] ps = { new SqlParameter("@scID",Session["scID"]),
                                    new SqlParameter("@gdID",gdID),
                                    new SqlParameter("@num",1)};
                    cmd.Parameters.AddRange(ps);
                    cmd.ExecuteNonQuery();
                }
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请先登录');location.href='../UserManager/UserLogin.aspx';</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}