using ShoppingCity.GoodsManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCity
{
    public partial class GoodsTypeManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDate();
        }

        private void LoadDate()
        {
            GoodsTypeDataContext lq = new GoodsTypeDataContext();//实例化LINQ类
            var mylq = from gt in lq.GoodsType select gt;//查询数据
            gvGoodType.DataSource = mylq;//绑定到GridView
            gvGoodType.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GoodsTypeDataContext lq = new GoodsTypeDataContext();//实例化LINQ类
            GoodsType gt = new GoodsType();//创建一个新对象
            gt.tName = TextBox1.Text;  //设置相应字段的值
            lq.GoodsType.InsertOnSubmit(gt);//执行插入数据操作
            lq.SubmitChanges();//提交数据库
            LoadDate();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            GoodsTypeDataContext lq = new GoodsTypeDataContext();//实例化LINQ类
            var types = from gt in lq.GoodsType
                        where gt.tName == TextBox2.Text
                        select gt;
            foreach (var type in types)//遍历集合
            {
                type.tName = TextBox3.Text;
            }
            lq.SubmitChanges();//提交数据库
            LoadDate();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            GoodsTypeDataContext lq = new GoodsTypeDataContext();
            var types = from gt in lq.GoodsType
                        where gt.tName == TextBox4.Text
                        select gt;
            foreach (var type in types)
            {
                lq.GoodsType.DeleteOnSubmit(type);
            }
            lq.SubmitChanges();
            LoadDate();
        }
    }
}