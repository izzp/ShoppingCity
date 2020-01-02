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
    public partial class ShoppingCarManage : System.Web.UI.Page
    {
        double sum = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uName"] != null)
                ltCurUser.Text = "当前用户：" + Session["uName"];
            else
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请先登录！');location.href='/UserManager/UserLogin.aspx';</script>");
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdGoods_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string strSum = ((Literal)e.Row.FindControl("ltlSum")).Text;
                CheckBox chkb = (CheckBox)e.Row.Cells[0].FindControl("chkSelect");
                if (!string.IsNullOrEmpty(strSum) && chkb.Checked)
                    sum += Convert.ToDouble(strSum);
                Session["zongjia"] = sum;
            }

            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[5].Text = String.Format("{0:C}", sum);
                ((LinkButton)e.Row.FindControl("lbtnClear")).Attributes.Add("onClick", "javascript:return confirm('确定清空？');");
            }
        }

        protected void lbtnSelectAll_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)grdGoods.FooterRow.FindControl("lbtnSelectAll");
            if (lbtn.Text.Equals("全选"))
            {
                for (int i = 0; i < grdGoods.Rows.Count; i++)
                {
                    CheckBox chkTemp = ((CheckBox)(grdGoods.Rows[i].FindControl("chkSelect")));
                    if (chkTemp.Checked == false)
                        chkTemp.Checked = true;
                }
                ((LinkButton)grdGoods.FooterRow.FindControl("lbtnSelectAll")).Text = "取消全选";
            }
            else
            {
                for (int i = 0; i < grdGoods.Rows.Count; i++)
                {
                    CheckBox chkTemp = ((CheckBox)(grdGoods.Rows[i].FindControl("chkSelect")));
                    if (chkTemp.Checked == true)
                        chkTemp.Checked = false;
                }
                ((LinkButton)grdGoods.FooterRow.FindControl("lbtnSelectAll")).Text = "全选";
            }

        }
        protected void lbtnClear_Click(object sender, EventArgs e)
        {
            string str = ConfigurationManager.ConnectionStrings["smdb"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(str))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("upClearCarByScid", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter p = new SqlParameter("@scID", Session["scID"]);
                cmd.Parameters.Add(p);
                cmd.ExecuteNonQuery();
            }
            Response.Redirect(Request.Path);
        }

        protected void grdGoods_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}