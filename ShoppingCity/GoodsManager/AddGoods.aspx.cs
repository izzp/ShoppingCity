using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCity
{
    public partial class AddGoods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string str = ConfigurationManager.ConnectionStrings["smdb"].ConnectionString;

            string filename = imgUpLoad(fldImg);
            using (SqlConnection conn = new SqlConnection(str))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("upAddGoods", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter[] ps = { new SqlParameter("@tID",ddlType.SelectedValue),
                                  new SqlParameter("@gdCode",txtCode.Text),
                                  new SqlParameter("@gdName",txtName.Text),
                                  new SqlParameter("@gdPrice",float.Parse(txtPrice.Text)),
                                  new SqlParameter("@gdQuantity",int.Parse(txtQuantity.Text)),
                                  new SqlParameter("@gdFeight",float.Parse(txtFeight.Text)),
                                  new SqlParameter("@gdCity",txtCity.Text),
                                  new SqlParameter("@gdImage",filename),
                                  new SqlParameter("@gdInfo",txtInfo.Text)                        
                                };
                cmd.Parameters.AddRange(ps);
                if (cmd.ExecuteNonQuery() > 0)
                    ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('添加成功');location.href('GoodsManager.aspx')</script>");
                else
                    ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('添加失败')</script>");

            }
        }
            /// <summary>
        /// 将指定文件上传到服务器
        /// </summary>
        /// <param name="fUpload">文件上传控件对象</param>
        /// <returns>返回文件名</returns>
        public string imgUpLoad(FileUpload fUpload)
        {
            string fileName = "";
            if (fUpload.HasFile)
            {
                //获取指定路径字符串的扩展名
                String fileExt = Path.GetExtension(fUpload.FileName).ToLower();
                //设置图片文件过滤
                string uploadFileExt = ".gif|.jpg|.png|.bmp";
                if (("|" + uploadFileExt + "|").IndexOf(("|" + fileExt + "|")) >= 0)
                {
                    try
                    {
                        fileName = DateTime.Now.ToString("yyyymmddhhmmss").ToString() + fileExt;
                        fUpload.SaveAs(HttpContext.Current.Server.MapPath("Images/Goods/") + fileName);
                    }
                    catch (Exception ee)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('" + ee.Message + "')</script>");
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请上传gif|jpg|png|bmp的文件')</script>");
                }

            }
            return fileName; ;
        }
    }
}
