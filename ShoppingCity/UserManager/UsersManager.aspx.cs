using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCity.UserManager
{
    public partial class UsersManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminName"] != null)
            {
                UsersDataContext lq = new UsersDataContext();
                var mylq = from gt in lq.Users select gt;
                gvUsers.DataSource = mylq;
                gvUsers.DataBind();
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请先登录！');location.href='../AdminsManager/AdminLogin.aspx';</script>");

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserReaister.aspx");
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            UsersDataContext lq = new UsersDataContext();
            var users = from gt in lq.Users where gt.uID == Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value) select gt;
            foreach (Users user in users)
            {
                lq.Users.DeleteOnSubmit(user);
            }
            lq.SubmitChanges();
            Response.Redirect("UsersManager.aspx");
        }
    }
}