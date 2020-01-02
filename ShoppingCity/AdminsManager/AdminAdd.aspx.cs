using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCity.AdminsManager
{
    public partial class AdminAdd : System.Web.UI.Page
    {
        SQLHelper sqlhelper = new SQLHelper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminName"] == null)
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请先登录！');location.href='/AdminsManager/AdminLogin.aspx';</script>");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (txtAdminName.Text != "" && txtAdminPwd.Text != "")
            {
                if (!sqlhelper.SelectAdmin(txtAdminName.Text))
                {
                    if (sqlhelper.AddAdmin(txtAdminName.Text, txtAdminPwd.Text, Convert.ToInt32(ddlAdminType.SelectedValue)))
                    {
                        Response.Write("<script>alert('添加成功！')</script>");
                        txtAdminName.Text = "";
                        txtAdminPwd.Text = "";
                    }
                    else
                    {
                        Response.Write("<script>alert('添加失败,请重试！')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('该用户名已存在！')</script>");
                    txtAdminName.Text = "";
                    txtAdminPwd.Text = "";
                }
            }
            else
            {
                Response.Write("<script>alert('请输入要添加的用户名和密码')</script>");
            }
        }
    }
}