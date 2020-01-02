using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCity.MessageManage
{
    public partial class BBSNoteList : System.Web.UI.Page
    {
        /// <summary>
        /// 页面加载事件，判断用户是否登录
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uID"] == null)
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请先登录！');location.href='../UserManager/UserLogin.aspx';</script>");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            BBSDataContext lq = new BBSDataContext();//实例化LINQ类
            BBSNote note = new BBSNote();//创建一个新对象
            note.bnSubject = txtbnSubject.Text;
            note.bnContent = txtbnContent.Text;
            note.uID = Convert.ToInt32(Session["uID"]);
            note.bnAddTime = System.DateTime.Now;
            lq.BBSNote.InsertOnSubmit(note);//执行插入数据操作
            lq.SubmitChanges();//提交数据库
            Response.Redirect("BBSNoteList.aspx?id=" + Request["id"]);//重新定位到该页面
        }
    }
}