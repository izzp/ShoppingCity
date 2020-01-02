using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Drawing;

namespace ShoppingCity
{
    public partial class VCode : System.Web.UI.Page
    {
        /// <summary>
        /// 随机产生4位的字母或数字
        /// </summary>
        private string GenerateCode()
        {
            int num;
            char code;
            string checkCode = string.Empty;
            Random rand = new Random();
            for (int i = 0; i < 4; i++)
            {
                //随机产生4个随机字母或数字
                num = rand.Next();
                if (i % 2 != 0)
                    code = (char)('0' + (char)(num % 10));
                else
                    code = (char)('A' + (char)(num % 26));
                checkCode += code;
            }
            Response.Cookies.Add(new HttpCookie("CheckCode", checkCode));
            return checkCode;
        }
        /// <summary>
        /// 绘制checkCode字符串
        /// </summary>
        private void DrawCheckImage(string checkCode)
        {
            if (checkCode == null || checkCode.Trim() == string.Empty)
                return;
            //定义校验码图像的大小，其长度随校验码长度的变化而变化
            Bitmap image = new Bitmap((int)Math.Ceiling(checkCode.Length * 15.0),25);
            Graphics g = Graphics.FromImage(image);
            try
            {
                Random rand = new Random();
                g.Clear(Color.White);
                for (int i = 0; i < 4; i++)
                {
                    //随机画图片的北京噪音线
                    int x1 = rand.Next(image.Width);
                    int x2 = rand.Next(image.Width);
                    int y1 = rand.Next(image.Height);
                    int y2 = rand.Next(image.Height);
                    g.DrawLine(new Pen(Color.Black), x1, x2, y1, y2);
                }
                Font font = new Font("Arial", 12, FontStyle.Bold | FontStyle.Italic);
                System.Drawing.Drawing2D.LinearGradientBrush brush
                    = new System.Drawing.Drawing2D.LinearGradientBrush
                        (new Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.DarkRed, 1.2f, true
                        );
                g.DrawString(checkCode, font, brush, 2, 2);
                for (int i = 0; i < 4; i++)
                {
                    //画图片的前景噪音点
                    int x = rand.Next(image.Width);
                    int y = rand.Next(image.Height);
                    image.SetPixel(x, y, Color.FromArgb(rand.Next()));
                }
                g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);
                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
                Response.ClearContent();
                Response.ContentType = "image/Gif";
                Response.BinaryWrite(ms.ToArray());
            }
            catch (Exception ee)
            {

            }
            finally
            {
                g.Dispose();
                image.Dispose();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DrawCheckImage(GenerateCode());
        } 
    }
}
