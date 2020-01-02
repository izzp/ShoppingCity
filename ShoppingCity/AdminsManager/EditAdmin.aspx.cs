using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCity.AdminsManager
{
    public partial class EditAdmin : System.Web.UI.Page
    {
        SQLHelper sqlhelper = new SQLHelper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminName"] == null)
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请先登录！');location.href='/AdminsManager/AdminLogin.aspx';</script>");
            else
            {
                DataSet ds = sqlhelper.SelectAdmin(Convert.ToInt32(Request.QueryString["aID"]));
                try
                {
                    txtAdminName.Text = ds.Tables[0].Rows[0][1].ToString();
                    txtAdminPwd.Text = ds.Tables[0].Rows[0][2].ToString();
                    ddlAdminType.SelectedIndex = Convert.ToInt32(ds.Tables[0].Rows[0][3].ToString()) - 1;
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('参数有误，请稍后重试！')</script>");
                    Response.Redirect("AdminsManager.aspx");
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtAdminName.Text != "" && txtAdminPwd.Text != "")
            {
                if (sqlhelper.SelectAdmin(txtAdminName.Text))
                {
                    if (sqlhelper.UpdateAdmin(txtAdminName.Text, txtAdminPwd.Text, Convert.ToInt32(ddlAdminType.SelectedValue)))
                    {
                        Response.Write("<script>alert('更新成功！')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('更新失败，请联系我们！')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('该用户名不存在！')</script>");
                }
                Response.Redirect("AdminsManager.aspx");
            }
            else
            {
                Response.Write("<script>alert('请输入要更改的密码')</script>");
            }
        }
    }
}