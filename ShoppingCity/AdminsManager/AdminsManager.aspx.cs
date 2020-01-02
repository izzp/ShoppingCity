using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCity.AdminsManager
{
    public partial class AdminsManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminName"] != null)
                Literal1.Text = "当前用户：" + Session["AdminName"];
            else
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请先登录！');location.href='/AdminsManager/AdminLogin.aspx';</script>");
        }
    }
}