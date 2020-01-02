using Aop.Api;
using Aop.Api.Domain;
using Aop.Api.Request;
using Aop.Api.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCity.Pay
{
    public partial class AliPay : System.Web.UI.Page
    {
        double zongjia;
        string spmc;         //商品名称
        string miaoshu="";      //商品描述
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["zongjia"] != null)
            {
                zongjia = (double)Session["zongjia"];
                Label3.Text = zongjia.ToString();
                Label1.Text = DateTime.Now.Year.ToString() + DateTime.Now.DayOfYear.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Millisecond.ToString();
            }
            if (Session["spmc"] != null)
            {
                spmc = (string)Session["spmc"];
                Label2.Text = spmc.ToString();
            }
            else { spmc= "B2C网上商城购买的商品"; }

            if (Session["miaoshu"] != null)
            {
                miaoshu = (string)Session["miaoshu"];
                Label4.Text = miaoshu.ToString();
            }
            else { miaoshu = "B2C网上商城"; }
        }

        protected void BtnAlipay_Click(object sender, EventArgs e)
        {

            DefaultAopClient client = new DefaultAopClient(config.gatewayUrl, config.app_id, config.private_key, "json", "1.0", config.sign_type, config.alipay_public_key, config.charset, false);

            // 外部订单号，商户网站订单系统中唯一的订单号
            string out_trade_no =DateTime.Now.Year.ToString()+ DateTime.Now.DayOfYear.ToString()+DateTime.Now.Hour.ToString()+DateTime.Now.Minute.ToString()+DateTime.Now.Millisecond.ToString();

            // 订单名称
            string subject = spmc.ToString();

            // 付款金额
            string total_amout = zongjia.ToString();

            // 商品描述
            string body = miaoshu.ToString();

            // 组装业务参数model
            AlipayTradePagePayModel model = new AlipayTradePagePayModel();
            model.Body = body;
            model.Subject = subject;
            model.TotalAmount = total_amout;
            model.OutTradeNo = out_trade_no;
            model.ProductCode = "FAST_INSTANT_TRADE_PAY";

            AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
            // 设置同步回调地址
            request.SetReturnUrl("");
            // 设置异步通知接收地址
            request.SetNotifyUrl("");
            // 将业务model载入到request
            request.SetBizModel(model);

            AlipayTradePagePayResponse response = null;
            try
            {
                response = client.pageExecute(request, null, "post");
                Response.Write(response.Body);
            }
            catch (Exception exp)
            {
                throw exp;
            }

        }
    }
}