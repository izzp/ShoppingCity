using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCity
{

    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindIco();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            BBSDataContext lq = new BBSDataContext();   //实例化LINQ类
            Users user = new Users();   //创建一个新对象，
            user.uName = txtuName.Text;   //并为相应的字段赋值
            user.uPwd = txtuPwd.Text;
            user.uRealName = txtuRealName.Text;
            user.uSex = rbluSex.SelectedValue;
            user.uAge = Convert.ToInt16(txtuAge.Text);
            for (int i = 0; i < cbluHobby.Items.Count; i++)    //判断CheckBoxList控件中的每个选项是否被选中，
            {
                if (cbluHobby.Items[i].Selected)    //如果被选中，
                    user.uHobby += cbluHobby.Items[i].Value;    //将该项值加入到uHobby字段中
            }
            user.uEmail = txtuEmail.Text;
            user.uQQ = txtuQQ.Text;
            user.uPhone = txtuPhone.Text;
            user.uImage = imguImage.ImageUrl.Substring(imguImage.ImageUrl.LastIndexOf("/") + 1);
            user.uRegTime = System.DateTime.Now;
            lq.Users.InsertOnSubmit(user);   //执行插入数据操作
            lq.SubmitChanges();   //提交数据库
            Response.Redirect("/UserManager/UserLogin.aspx");   //重新定位到会员管理页
        }

        public void BindIco()
        {
            ddluImage.Items.Clear();
            for (int i = 1; i < 10; i++)
            {
                ddluImage.Items.Add(new ListItem(i.ToString(), i + ".gif"));
            }
            ddluImage.DataBind();
            //ddluImage.SelectedValue = "/images
        }

        protected void ddluImage_SelectedIndexChanged(object sender, EventArgs e)
        {
            imguImage.ImageUrl = imguImage.ImageUrl.Substring(0, imguImage.ImageUrl.LastIndexOf("/") + 1) + ddluImage.SelectedValue;
        }
    }
}
