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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //自动登录
            if (Session["uName"] != null)
                Response.Redirect("/GoodsManager/GoodsList.aspx");
            if (Request.Cookies["userInfo"] != null)
            {
                string uName = Request.Cookies["uInfo"]["uName"];
                string uPwd = Request.Cookies["uInfo"]["uPwd"];
                if (getUserIdByName(uName, uPwd) != 0)
                {
                    Session["uName"] = uName;
                    Response.Redirect("/GoodsManager/GoodsList.aspx");
                }
            }
        }
        /// <summary>
        /// 获取用户ID
        /// </summary>
        /// <param name="uName">用户名</param>
        /// <param name="uPwd">密码</param>
        /// <returns>用户ID</returns>
        protected int getUserIdByName(string uName, string uPwd)
        {
            int uID = 0;
            string connstr = ConfigurationManager.ConnectionStrings["smdb"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("upGetUidByName", conn);
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter[] ps = new SqlParameter[]{
                new SqlParameter("@uName",txtUName.Text),
                new SqlParameter("@uPwd",txtUPwd.Text)};
                cmd.Parameters.AddRange(ps);
                uID = (int)cmd.ExecuteScalar();
            }
            return uID;
        }
        /// <summary>
        /// 获取用户购物车ID
        /// </summary>
        /// <param name="uID">用户ID</param>
        /// <returns>用户购物车ID</returns>
        protected int getCarIdByUid(int uID)
        {
            int scID = 0;
            string connstr = ConfigurationManager.ConnectionStrings["smdb"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("upGetScidByUid", conn);
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter ps = new SqlParameter("@uID", uID);
                cmd.Parameters.Add(ps);
                scID = (int)cmd.ExecuteScalar();
            }
            return scID;
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string uName = txtUName.Text;
            string uPwd = txtUPwd.Text;
            try
            {
                int uID = getUserIdByName(uName, uPwd);
                if (uID != 0)
                {
                    Session["uName"] = uName;
                    Session["uID"] = uID;
                    Session["scID"] = getCarIdByUid(uID);
                    if (cbState.Checked)
                    {
                        Response.Cookies["uInfo"]["uName"] = txtUName.Text;
                        Response.Cookies["uInfo"]["uPwd"] = txtUPwd.Text;
                        Response.Cookies["uInfo"].Expires = System.DateTime.Now.AddDays(14);
                    }
                    ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('登录成功！');location.href='/GoodsManager/GoodsList.aspx';</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('用户名和密码不正确！')</script>");
                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('用户名和密码不正确！')</script>");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtUName.Text = "";
            txtUPwd.Text = "";
        }
    }
}