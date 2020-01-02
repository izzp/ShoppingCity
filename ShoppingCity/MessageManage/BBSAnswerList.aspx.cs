using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCity
{
    public partial class BBSAnswerList : System.Web.UI.Page
    {
        /// <summary>
        /// 页面加载事件，判断用户是否登录，是否选择了某个主题
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uID"] == null)
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请先登录！');location.href='../UserManager/UserLogin.aspx';</script>");
            if (Request["id"] == null)
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请选择留言主题！');location.href='BBSNoteList.aspx';</script>");

        }

        protected void bnSubject_Click(object sender, EventArgs e)
        {
            BBSDataContext lq = new BBSDataContext();//实例化LINQ类
            
            BBSAnswer ba = new BBSAnswer();//创建一个新对象
            ba.uID = Convert.ToInt32(Session["uID"]);
            ba.bnID = Convert.ToInt32(Request["id"]);
            ba.baContent = txtbaContent.Text;
            ba.baAddTime = System.DateTime.Now;
            lq.BBSAnswer.InsertOnSubmit(ba);//执行插入数据操作
            lq.SubmitChanges();//提交数据库
            Response.Redirect("BBSAnswerList.aspx?id=" + Request["id"]);//重新定位到该页面

        }
    }
}