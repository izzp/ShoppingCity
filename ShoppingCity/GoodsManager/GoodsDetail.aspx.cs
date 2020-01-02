using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCity.GoodsManager
{

    public partial class GoodsDetail : System.Web.UI.Page
    {
        double zongjia;
        int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uName"] == null)
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请先登录！');location.href='/UserManager/UserLogin.aspx';</script>");

            if (Request["gdID"] != null)
            {
                id = int.Parse(Request["gdID"].ToString());
                if (!IsPostBack)
                    dispGoodInfo();
            }
        }
        public void dispGoodInfo()
        {
            string str = ConfigurationManager.ConnectionStrings["SMDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(str))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("upGetGoodsById", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter pm = new SqlParameter("@gdID", id);
                cmd.Parameters.Add(pm);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Label2.Text = dr["gdName"].ToString();
                    Label4.Text = dr["gdPrice"].ToString();
                    zongjia = (double)dr["gdPrice"];
                    Label5.Text = dr["gdQuantity"].ToString();
                    Label6.Text = dr["gdSaleQty"].ToString();
                    Label7.Text = dr["gdCity"].ToString();
                    Label8.Text = dr["gdFeight"].ToString();
                    Label9.Text = dr["gdInfo"].ToString();
                    img.ImageUrl = "../images/goods/" + dr["gdImage"].ToString();

                    Session["spmc"] = dr["gdName"].ToString();
                    Session["zongjia"] = zongjia;
                    Session["miaoshu"] = dr["gdInfo"].ToString();
                }


            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btnbuy_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/Pay/AliPay.aspx");
        }
    }
}