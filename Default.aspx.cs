using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Globalization;

public partial class _Default : System.Web.UI.Page
{
    CultureInfo cInfo = new CultureInfo("hi-IN");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetNewArrivalsProducts();
            GetBestSellers();
            GetBargainProducts();
            GetPromotionProducts();
            BindTestimonials();
        }
    }

    private void BindTestimonials()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * from testimonials_tbl order by order_no asc";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            RepeaterTestimonials.DataSource = dt.DefaultView;
            RepeaterTestimonials.DataBind();
        }
        else
        {
        }
    }
    private void GetNewArrivalsProducts()
    {
        ProductsBLL obj = new ProductsBLL();
        DataTable dt = new DataTable();
        dt = obj.GetNewArrivalsProducts();
        if (dt.Rows.Count > 0)
        {
            Repeater1.DataSource = dt.DefaultView;
            Repeater1.DataBind();
        }
        else
        {
        }
    }

    private void GetBestSellers()
    {
        ProductsBLL obj = new ProductsBLL();
        DataTable dt = new DataTable();
        dt = obj.GetBestSellers();
        if (dt.Rows.Count > 0)
        {
            rptBestSellers.DataSource = dt.DefaultView;
            rptBestSellers.DataBind();
        }
        else
        {
        }
    }

    private void GetBargainProducts()
    {
        ProductsBLL obj = new ProductsBLL();
        DataTable dt = new DataTable();
        dt = obj.GetAllBargainProducts();
        if (dt.Rows.Count > 0)
        {
            Repeater4.DataSource = dt.DefaultView;
            Repeater4.DataBind();
        }
        else
        {
        }
    }

    private void GetPromotionProducts()
    {
        ProductsBLL obj = new ProductsBLL();
        DataTable dt = new DataTable();
        dt = obj.GetAllPromotionProducts();
        if (dt.Rows.Count > 0)
        {
            Repeater5.DataSource = dt.DefaultView;
            Repeater5.DataBind();
        }
        else
        {
        }
    }
   
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            AddNewsletter();

        }
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        string price = "";
        string disPrice = "";
        Label lblPrice = (Label)e.Item.FindControl("lblPrice");
        Label lblDisPrice = (Label)e.Item.FindControl("lblDisPrice");
        Label lblPerce = (Label)e.Item.FindControl("lblPerce");
        HtmlGenericControl divDiscount1 = e.Item.FindControl("divDiscount1") as HtmlGenericControl;

        //Label lblImgPath = (Label)e.Item.FindControl("lblImgPath");
        //if (lblImgPath != null)
        //{
        //try
        //{
        //    string strImgPath = lblImgPath.Text;
        //    Image img1 = (Image)e.Item.FindControl("img1");

        //    string[] strImages = strImgPath.Split(',');
        //    Array.Sort(strImages);
        //    img1.Visible = true;
        //    img1.CssClass = "img-responsive zoom-img";
        //    img1.ImageUrl = "../ProductsImages/" + strImages[0].ToString();
        //}
        //catch { }

        Label lblImgPath = (Label)e.Item.FindControl("lblImgPath");
        if (lblImgPath != null)
        {
            string strImgPath = lblImgPath.Text;
            Image img1 = (Image)e.Item.FindControl("img1");

            string[] strImages = strImgPath.Split(',');

            Array.Sort(strImages);

            //for (int i = 0; i <= strImages.Length - 1; i++)
            //{
            img1.Visible = true;
            img1.ImageUrl = "../ProductsImages/" + strImages[0].ToString();
            // }
        }

        if (lblPerce != null)
        {
            if (lblPerce.Text != "")
            {
                lblPerce.Text = lblPerce.Text + "% <span style='padding-bottom:7px;'> off <span />";
                lblPerce.Visible = true;
                //lblDiscount.Visible = true;
                divDiscount1.Visible = true;
            }
            else
            {
                lblPerce.Visible = false;
                // lblDiscount.Visible = false;
                divDiscount1.Visible = false;
            }
        }



        if (lblDisPrice.Text != "")
        {
            
           

            lblPrice.Font.Strikeout = true;
            price = lblPrice.Text.ToString();
            disPrice = lblDisPrice.Text.ToString();
           // lblPrice.Text = "&#8377; " + string.Format("{0:C2}", price);
           // lblPrice.Text = "&#8377; " + string.Format(nfi, "{0:C0}", price);
            lblPrice.Text = Convert.ToDecimal(price).ToString("C0", cInfo);
            lblDisPrice.Text = Convert.ToDecimal(disPrice).ToString("C0", cInfo);
           // lblDisPrice.Text = "&#8377; " + string.Format("{0:F2}", disPrice);
        }
        else
        {

            NumberFormatInfo nfi = CultureInfo.CurrentCulture.NumberFormat;
            nfi = (NumberFormatInfo)nfi.Clone();

          //  Console.WriteLine(string.Format(nfi, "{0:c}", 123.45m));
           



            price = lblPrice.Text.ToString();
            // disPrice = lblDisPrice.ToString();
            //lblPrice.Text = "&#8377; " + string.Format("{0:F2}", price);
            //lblPrice.Text = "&#8377; " + string.Format(nfi, "{0:c}", price);
            lblPrice.Text = Convert.ToDecimal(price).ToString("C0", cInfo);
            // lblDisPrice.Text = string.Format("{0:F2}", disPrice);
            lblPrice.Font.Strikeout = false;
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "AddtoWishlist")
        {
            int pid = int.Parse(e.CommandArgument.ToString());

            AddtoWishList(pid);
        }
    }
    private bool IsAlreadyExist(int pid, int customerId)
    {
        DataTable dt = new DataTable();
        bool b = true;
        ProductsBLL obj = new ProductsBLL();
        obj.Pid = pid;
        obj.CId = customerId;

        dt = obj.ProductsAllreadyExistInWishList();

        if (dt.Rows.Count > 0)
        {
            b = false;
        }

        return b;
    }
   

    protected void Repeater4_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        string price = "";
        string disPrice = "";
        Label lblPrice = (Label) e.Item.FindControl("lblPrice");
        Label lblDisPrice = (Label) e.Item.FindControl("lblDisPrice");
        Label lblPerce = (Label) e.Item.FindControl("lblPerce");
        HtmlGenericControl divDiscount1 = e.Item.FindControl("divDiscount1") as HtmlGenericControl;

        Label lblImgPath = (Label)e.Item.FindControl("lblImgPath");
        if (lblImgPath != null)
        {
            string strImgPath = lblImgPath.Text;
            Image img1 = (Image)e.Item.FindControl("img1");

            string[] strImages = strImgPath.Split(',');

            Array.Sort(strImages);
           
            img1.Visible = true;
            img1.ImageUrl = "../ProductsImages/" + strImages[0].ToString();
            
        }

        if (lblDisPrice.Text != "")
        {
            lblPrice.Font.Strikeout = true;
            price = lblPrice.Text.ToString();
            disPrice = lblDisPrice.Text.ToString();         
            lblPrice.Text = Convert.ToDecimal(price).ToString("C0", cInfo);
            lblDisPrice.Text = Convert.ToDecimal(disPrice).ToString("C0", cInfo);           
        }
        else
        {
            NumberFormatInfo nfi = CultureInfo.CurrentCulture.NumberFormat;
            nfi = (NumberFormatInfo) nfi.Clone();

            price = lblPrice.Text.ToString();           
            lblPrice.Text = Convert.ToDecimal(price).ToString("C0", cInfo);           
            lblPrice.Font.Strikeout = false;
        }
    }
    protected void Repeater4_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "AddtoWishlist")
        {
            int pid = int.Parse(e.CommandArgument.ToString());

            AddtoWishList(pid);
        }
    }
    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            AddNewsletter();

        }
    }
    private void AddNewsletter()
    {
        try
        {

            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddNewsletter";
            obj.AddParam("@fname", txtFName.Text.Trim().ToString());
            obj.AddParam("@lname", txtLName.Text.Trim().ToString());
            obj.AddParam("@emailid", txtEmail.Text.Trim().ToString());
            //obj.AddParam("@mobileCC", txtMobCC.Text.Trim().ToString());
            // obj.AddParam("@mobile", txtMobile.Text.Trim().ToString());
            obj.AddParam("@ipaddress", ipaddress);

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();

                lblMessage.Text = "Newsletter Has Been Added Successfully";
                //string jv = "<script>alert('Newsletter Has Been Added Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void Clear()
    {
        txtFName.Text = "";
        txtLName.Text = "";
        txtEmail.Text = "";
        lblMessage.Text = "";
    }

    protected void rptBestSellers_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        string price = "";
        string disPrice = "";
        Label lblPrice = (Label)e.Item.FindControl("lblPrice");
        Label lblDisPrice = (Label)e.Item.FindControl("lblDisPrice");
        Label lblPerce = (Label)e.Item.FindControl("lblPerce");
        HtmlGenericControl divDiscount1 = e.Item.FindControl("divDiscount1") as HtmlGenericControl;
        
        Label lblImgPath = (Label)e.Item.FindControl("lblImgPath");
        if (lblImgPath != null)
        {
            string strImgPath = lblImgPath.Text;
            Image img1 = (Image)e.Item.FindControl("img1");

            string[] strImages = strImgPath.Split(',');

            Array.Sort(strImages);
          
            img1.Visible = true;
            img1.ImageUrl = "../ProductsImages/" + strImages[0].ToString();
           
        }

        if (lblPerce != null)
        {
            if (lblPerce.Text != "")
            {
                lblPerce.Text = lblPerce.Text + "% <span style='padding-bottom:7px;'> off <span />";
                lblPerce.Visible = true;                
                divDiscount1.Visible = true;
            }
            else
            {
                lblPerce.Visible = false;                
                divDiscount1.Visible = false;
            }
        }

        if (lblDisPrice.Text != "")
        {
            lblPrice.Font.Strikeout = true;
            price = lblPrice.Text.ToString();
            disPrice = lblDisPrice.Text.ToString();           
            lblPrice.Text = Convert.ToDecimal(price).ToString("C0", cInfo);
            lblDisPrice.Text = Convert.ToDecimal(disPrice).ToString("C0", cInfo);           
        }
        else
        {
            NumberFormatInfo nfi = CultureInfo.CurrentCulture.NumberFormat;
            nfi = (NumberFormatInfo)nfi.Clone();

           
            price = lblPrice.Text.ToString();           
            lblPrice.Text = Convert.ToDecimal(price).ToString("C0", cInfo);           
            lblPrice.Font.Strikeout = false;
        }
    }
    protected void rptBestSellers_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "AddtoWishlist")
        {
            int pid = int.Parse(e.CommandArgument.ToString());

            AddtoWishList(pid);
        }
    }

    private void AddtoWishList(int pid)
    {
        if (Session["CustomerID"] != null)
        {
            bool b = true;
            int customerId = int.Parse(Session["CustomerID"].ToString());
            b = IsAlreadyExist(pid, customerId);
            if (b == true)
            {
                AddtoWishList(pid, customerId);
            }
            else
            {
                string jv = "<script>alert('Product Already Added In Your Wishlist');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        else
        {
            Response.Redirect("cart/login.aspx");
            //showmsg("Login First!", "login.aspx");          
        }
    }

    private void AddtoWishList(int pid, int customerId)
    {
        ProductsBLL obj = new ProductsBLL();
        obj.Pid = pid;
        obj.CId = customerId;
        int exe = obj.AddToWishList();
        if (exe > 0)
        {
            //showmsg("Product Added Successfully In Your Wishlist", "product_details.aspx?cid=" + cid + "&pid=" + ppid);

            string jv = "<script>alert('Product Added Successfully In Your Wishlist');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
    }
}