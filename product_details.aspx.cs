using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Collections;
using Telerik.Web.UI;

public partial class product_details3 : System.Web.UI.Page
{
    DataTable dt;
    public string category = "";
    public string subCategory = "";
    string strColors = "";
    public static string imagepath1, imagepath2 = "";
    int qty = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            rfvSize.Visible = false;           

            if (Request.QueryString["pid"] != null)
            {
               
                int pid = int.Parse(Request.QueryString["pid"].ToString());
                Session["ProductId"] = pid.ToString();
                GetProducts(pid);

                //BindQuantity(10);
                //BindQtySize(pid);
                //BindZoomImage(pid);
                //BindColorBox(pid);

                BindSize(pid);
                BindColor(pid);
                BindThumbnails(pid);
                BindBigImage(pid);
                BindProductReviews(pid);
                BindProductReviewsRating(pid);
            }

            if (Request.QueryString["cid"] != null)
            {
                int cid = int.Parse(Request.QueryString["cid"].ToString());
                BindTop5Products(cid);
            }

            if (Session["CustomerID"] != null)
            {
                btnRateThisProduct.Visible = true;
            }
            else
            {
                btnRateThisProduct.Visible = false;
            }

            GetWarrantyReturnCareText();
        }
    }
    private void BindQuantity(int n)
    {     
        ddlQty.Items.Clear();       
        for (int i = 1; i <= n; i++)
        {
            ddlQty.Items.Add(i.ToString());
        }
    }
    private void BindSize(int pid)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        // obj.SetCommandSP = "f_BindProducts";
        obj.SetCommandQry = "select distinct size from View_ProductsQtySize where pid=" + pid+ " order by size";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            ddlSize.Visible = true;
            ddlSize.DataTextField = "size";
            ddlSize.DataValueField = "size";
            ddlSize.DataSource = dt;
            ddlSize.DataBind();

            ddlSize.Items.Insert(0, "Size");
        }
        else
        {
            ddlSize.Items.Insert(0, "Size");
        }
    }
    private void BindColor(int pid)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        // obj.SetCommandSP = "f_BindProducts";
        obj.SetCommandQry = "select distinct color, hex_code from View_ProductsQtySize where pid=" + pid + "  order by color";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            ddlColor.DataTextField = "color";
            ddlColor.DataValueField = "color";
            ddlColor.DataSource = dt;
            ddlColor.DataBind();
            ddlColor.Items.Insert(0, "Colour");

        }
        else
        {
            ddlColor.Items.Insert(0, "Colour");
        }
    }

    //private void BindColorBox(int pid)
    //{
    //    DataTable dt = new DataTable();
    //    DBconnection obj = new DBconnection();
    //    // obj.SetCommandSP = "f_BindProducts";
    //    obj.SetCommandQry = "select distinct color, hex_code from View_ProductsQtySize where pid=" + pid;
    //    dt = obj.ExecuteTable();
    //    if (dt.Rows.Count > 0)
    //    {
    //        ddlColorRD.DataTextField = "hex_code";
    //        ddlColorRD.DataValueField = "color";

    //        ddlColorRD.DataSource = dt;
    //        ddlColorRD.DataBind();


    //        foreach (ListItem i in ddlColorRD.Items)
    //        {

    //            i.Attributes["style"] = "padding:13px;margin:2px; background-color:" + i.Text.ToLower();
    //            i.Text = "";
    //        }

    //    }
    //}

    private int BindQtySize(int pid, string color)
    {       
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        // obj.SetCommandSP = "f_BindProducts";
        obj.SetCommandQry = "select * from View_ProductsQtySize where pid=" + pid + " and color='" + color + "'";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            qty = int.Parse(dt.Rows[0]["stock_qty"].ToString());
            if (qty == 0)
            {
                ddlQty.Items.Clear();
                ddlQty.Items.Insert(0, "0");
                btnAddtoCart.Enabled = false;
            }
            else
            {               
                if (qty > 10)
                    BindQuantity(10);
                else
                    BindQuantity(qty);

                btnAddtoCart.Enabled = true;
            }

            BindSize(pid);
            BindColor(pid);            
        }

        return qty;
    }
    private int BindQtySize(int pid, string size, string color)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        // obj.SetCommandSP = "f_BindProducts";
        obj.SetCommandQry = "select * from View_ProductsQtySize where pid=" + pid + " and size='" + size + "' and color='" + color + "'";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            qty = int.Parse(dt.Rows[0]["stock_qty"].ToString());
            if (qty == 0)
            {
                ddlQty.Items.Clear();
                ddlQty.Items.Insert(0, "0");
                btnAddtoCart.Enabled = false;
            }
            else
            {
                if (qty > 10)
                    BindQuantity(10);
                else
                    BindQuantity(qty);

                btnAddtoCart.Enabled = true;
            }
        }

        return qty;
    }
    private void BindThumbnails(int pid)
    {
        try
        {
            ProductsBLL objP = new ProductsBLL();
            objP.Pid = pid;
            DataTable dt = new DataTable();
            dt = objP.GetProduct();
            if (dt.Rows.Count > 0)
            {
                string thumbnail = dt.Rows[0]["images"].ToString();
                if (thumbnail != "")
                {
                    string[] strImages = thumbnail.Split(',');
                    Array.Sort(strImages);

                    DataTable dtt = new DataTable("MyDataTable");
                    dtt.Columns.Add("images");
                    foreach (string value in strImages)
                    {
                        dtt.Rows.Add(value);
                    }

                    Repeater1.DataSource = dtt;
                    Repeater1.DataBind();
                }
            }
        }
        catch { }
    }
    private void BindBigImage(int pid)
    {
        try
        {
            ProductsBLL objP = new ProductsBLL();
            objP.Pid = pid;
            DataTable dt = new DataTable();
            dt = objP.GetProduct();
            if (dt.Rows.Count > 0)
            {
                string thumbnail = dt.Rows[0]["images"].ToString();
                if (thumbnail != "")
                {
                    string[] strImages = thumbnail.Split(',');
                    Array.Sort(strImages);
                    DataTable dtt = new DataTable("MyDataTable");
                    dtt.Columns.Add("images");
                    foreach (string value in strImages)
                    {
                        dtt.Rows.Add(value);
                    }

                    imagepath1 = "ProductsImages/" + strImages[0];
                    imagepath2 = "ProductsImages/" + strImages[0];
                    // Repeater2.DataSource = dtt;
                    // Repeater2.DataBind();
                }
            }
        }
        catch { }
    }
    private void BindZoomImage(int pid)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        // obj.SetCommandSP = "f_BindProducts";
        obj.SetCommandQry = "select * from View_Products where pid=" + pid + " order by product_name";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            category = dt.Rows[0]["cid"].ToString();
            subCategory = dt.Rows[0]["sid"].ToString();
            //imgZoom.ImageUrl = "ProductsImages/" + dt.Rows[0]["images"].ToString();


            Repeater1.DataSource = dt.DefaultView;
            Repeater1.DataBind();
        }
    }
    private void BindTop5Products(int cid)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        // obj.SetCommandSP = "f_BindProducts";
        obj.SetCommandQry = "select top(3)* from View_ProductsWithPromotions where cid=" + cid;
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DataList1.DataSource = dt.DefaultView;
            DataList1.DataBind();
        }
    }
    private string GetDelivertTime(int intDeliveryTime)
    {
        string strDate = "";
        DateTime dt;
        dt = DateTime.Now.AddDays(intDeliveryTime);
        strDate = dt.ToString("dd MMMM yyyy");

        strDate = intDeliveryTime + " days (Delivered by " + strDate + ")";
        return strDate;
    }
    private void GetProducts(int pid)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        // obj.SetCommandSP = "f_BindProducts";

        obj.SetCommandQry = "select * from View_Products where pid=" + pid + " order by product_name";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            string strCid = dt.Rows[0]["cid"].ToString();
            string catName = dt.Rows[0]["cat_name"].ToString();
            if (catName == "Riding Gear")
            {
                idSize.Visible = true;
                rfvSize.Visible = false;              
            }
            else
            {
                idSize.Visible = false;
                rfvSize.Visible = false;               
            }

            lnkCat.HRef = "sub_categories.aspx?cid=" + strCid;

            try
            {
                string strDelivery;
                int intDeliveryTime = 0;
                lblStock.Text = dt.Rows[0]["stock"].ToString();
                intDeliveryTime = int.Parse(dt.Rows[0]["delivery_time"].ToString());
                if (intDeliveryTime != 0)
                {
                    strDelivery = GetDelivertTime(intDeliveryTime * 7);
                    lblDeliveryTime1.Text = strDelivery;
                }
                else
                {
                    lblDeliveryTime1.Text = "Immediate";
                }
            }
            catch { }

            lblCatName.Text = dt.Rows[0]["cat_name"].ToString();
            lblSubCatName.Text = dt.Rows[0]["subcat_name"].ToString();
            lblsku.Text = dt.Rows[0]["sku"].ToString();
            lblProductName.Text = dt.Rows[0]["product_name"].ToString();
            lblProName.Text = dt.Rows[0]["product_name"].ToString();
            // lblPrice.Text = Convert.ToDouble(dt.Rows[0]["price"].ToString()).ToString("n") + "</b>";
            //string strPrice = dt.Rows[0]["price"].ToString();
            int strPrice = Convert.ToInt32(dt.Rows[0]["selling_price"]);

            if (strPrice != 0)
            {
                lblPrice.Text = "&#8377; " + string.Format("{0:n0}", strPrice);
                lblGstText.Text = "(Inclusive of GST)";
            }

            lblPrice.Font.Strikeout = false;

            if (Request.QueryString["dis_price"] != "")
            {
                try
                {

                    //lblPrice.Font.Strikeout = true;

                    //Double d1 = Convert.ToDouble(dt.Rows[0]["price"]);
                    //Double d2 = Convert.ToDouble(Request.QueryString["dis_price"]);
                    //Double d3 = d1 - d2;
                    //lblDiscount.Visible = true;
                    //lblSave.Visible = true;
                    //lblSave.Text = "<b>You Save : " + d3.ToString("n") + "</b>";
                    //lblDiscount.Text = "<b>Discounted Price : " + d2.ToString("n") + "</b>";

                    decimal strDiscPrice = Convert.ToDecimal(Request.QueryString["dis_price"].ToString());

                    int vat = Convert.ToInt32(dt.Rows[0]["vat"]);

                    int d1 = Convert.ToInt32(dt.Rows[0]["selling_price"]);
                    int d2 = (int)strDiscPrice;
                    int d4 = d2 * vat / 100;
                    d2 = d2 + d4;
                    int d3 = d1 - d2;

                    lblDiscount.Visible = true;

                    lblSave.Visible = true;
                    lblSave.Text = "You Save : &#8377; " + string.Format("{0:n0}", d3);
                    lblDiscount.Text = "Discounted Price : &#8377; " + string.Format("{0:n0}", d2);
                }
                catch { }
            }

            if (Session["did"] != null)
            {
                decimal dealerPrice = decimal.Parse(dt.Rows[0]["dealer_price"].ToString());
                if (dealerPrice != 0)
                {
                    lblDealerPrice.Text = "Dealer Price : &#8377; " + string.Format("{0:n0}", dealerPrice);
                }
            }



            lblShortDesc.Text = dt.Rows[0]["short_desc"].ToString();
            lblProDesc.Text = dt.Rows[0]["product_desc"].ToString();

            string strFitment = dt.Rows[0]["fitment"].ToString();
            if (strFitment == "Universal")
            {
                lblFitment.Text = "<b>Fitment:  </b>" + strFitment;
            }
            else
            {
                lblFitment.Text = "<b>Fitment:  </b>" + strFitment;
                lblManufacturer.Text = "<b>Manufacturer:  </b>" + dt.Rows[0]["manufacturer_name"].ToString();
                //lblModelType.Text = "<b>Model Type:  </b>" + dt.Rows[0]["model_type"].ToString();
                // lblModel.Text = "<b>Model:  </b>" + dt.Rows[0]["model"].ToString();
            }




            lblProDesc.Text = dt.Rows[0]["product_desc"].ToString();
            lblProductTags.Text = dt.Rows[0]["product_tags"].ToString();

            string strCat, strSubCat, strBrand = "";
            strCat = dt.Rows[0]["cat_name"].ToString();
            strSubCat = dt.Rows[0]["subcat_name"].ToString();
            strBrand = dt.Rows[0]["brand_name"].ToString();
            lblProDesc.Text = dt.Rows[0]["product_desc"].ToString();

            
            lblBrand.Text = strBrand;


            //string strHeight, strWidth, strLength, strDepth;
            //strHeight = dt.Rows[0]["height"].ToString();
            //strWidth = dt.Rows[0]["width"].ToString();
            //strLength = dt.Rows[0]["length"].ToString();

            //if (strHeight != "0.00")
            //    strHeight = "Height: " + strHeight+"''   ";
            //else
            //    strHeight = "";

            //if (strWidth != "0.00")
            //    strWidth = "&nbsp;&nbsp;&nbsp;&nbsp;Width: " + strWidth + "''   ";
            //else
            //    strWidth = "";

            //if (strLength != "0.00")
            //    strLength = "&nbsp;&nbsp;&nbsp;&nbsp;Length: " + strLength + "''   ";
            //else
            //    strLength = "";

            //lblDimentions.Text = strHeight + strWidth + strLength;

            if (strSubCat != "Boots")
            {              
                ddlSize.Visible = true;
                rfvSize.Visible = true;              
            }
            else
            {
                rfvSize.Visible = false;              
                ddlSize.Visible = false;
            }

        }
    }   
    private void AddtoCart()
    {
        string cartid = "";
        int pid = Int32.Parse(Request.QueryString["pid"].ToString());
        
        if (Session["CartID"] == null || Session["CartID"].ToString() == "0")
        {
            cartid = CreateCart();
            Session["CartID"] = cartid;
        }

        else
        {
            cartid = Session["CartID"].ToString();
        }
        if (Session["ProPid"] != null)
        {
            pid = int.Parse(Session["ProPid"].ToString());
        }

        else
        {
            pid = Int32.Parse(Request.QueryString["pid"].ToString());
        }

        AddProductTocart(pid, cartid);       
    }

    private bool QtyAddedInCart(string cartid, int pid, string color, string size)
    {
        bool b = false;
        int qty = 0;
        int stockQty = 0;
        int balQty = 0;
        string query = "";

        if(size=="")
        {
            query = "select * from cart where CartID='"+ cartid + "' and ProductID='"+pid+"' and Color='"+ color + "'";
        }
        else
        {
            query = "select * from cart where CartID='" + cartid + "' and ProductID='" + pid + "' and Size='" + size + "' and Color='" + color + "'";
        }

       // ProductsBLL obj = new ProductsBLL();
        DataTable dt = new DataTable();

        DBconnection obj = new DBconnection();
        obj.SetCommandQry = query;


        //obj.CartId = cartid;
        //obj.Pid = pid;
        //obj.Size = size;
        //obj.Color = color;

        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            qty = int.Parse(dt.Rows[0]["Quantity"].ToString());
            stockQty = int.Parse(dt.Rows[0]["QtyInStock"].ToString());

            balQty = stockQty - qty;
            if (balQty==0)
            {
                b = true;
            }
        }

        return b;
    }
    private string CreateCart()
    {

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_CreateCart";
        int exe = obj.ExecuteNonQuery();

        string ss = obj.ExecuteScalar().ToString();
        return ss;
    }
    private void AddProductTocart(int pid, string cartid)
    {
        string size = "";
        string color = "";
        int actQty = 0;
        int proQuantity = 0;
        float price = 0;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetFromProduct";
        obj.AddParam("@pid", pid);
        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {            
            string catName = dt.Rows[0]["cat_name"].ToString();
            string subCatName = dt.Rows[0]["subcat_name"].ToString();
            color = ddlColor.SelectedItem.Text;

            try { proQuantity = int.Parse(ddlQty.SelectedValue.ToString()); }
            catch { proQuantity = 1; }

            if (catName == "Riding Gear")
            {
                size = ddlSize.SelectedItem.Text;
                BindQtySize(pid, size, color);
            } 
            else
            {
                BindQtySize(pid, color);
            } 
            

            if (Request.QueryString["dis_price"] != "")
            {
                price = float.Parse(Request.QueryString["dis_price"]);
                Session["Promotional"] = "promotion";
            }
            else
            {
                if (Session["did"] != null)
                {
                    price = float.Parse(dt.Rows[0]["dealer_price"].ToString());

                    // Check Dealer Credit limit and Credit balance

                    int did = int.Parse(Session["did"].ToString());
                    float creditBalance = 0;
                    creditBalance = CheckDealerCreditBalance(did);
                    if (creditBalance < price)
                    {
                        string jv = "<script>alert('Your Credit Limit Is Low to Purchase This Product.');</script>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                        return;
                    }
                }

                else
                {
                    price = float.Parse(dt.Rows[0]["price"].ToString());
                }
               
            }

            try { actQty = Int32.Parse(dt.Rows[0]["quantity"].ToString()); }
            catch { }


            bool b = QtyAddedInCart(cartid, pid, color, size);
            if(b==true)
            {
                return;
            }            
        }

        DBconnection obj1 = new DBconnection();
        obj1.SetCommandSP = "sc_InsertIntoCart";
        obj1.AddParam("@pid", pid);
        obj1.AddParam("@CartID", cartid);
        obj1.AddParam("@Quantity", proQuantity);
        obj1.AddParam("@price", price);
        obj1.AddParam("@Size", size);
        obj1.AddParam("@Color", color);
        obj1.AddParam("@QtyInStock", qty);

        int exe = obj1.ExecuteNonQuery();

        if (exe > 0)
        {
            Session["ProPid"] = null;
            Response.Redirect("cart/viewcart.aspx");
        }
    }
    private float CheckDealerCreditBalance(int did)
    {
        float dealerCreditBalance = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetDealers";
        obj.AddParam("@id", did);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            try
            {
                dealerCreditBalance = float.Parse(dt.Rows[0]["CreditBalanceAmt"].ToString());
            }
            catch
            { dealerCreditBalance = 0; }

        }
        return dealerCreditBalance;
    }
    protected void btnAddtoCart_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            AddtoCart();
        }
    }
    protected void lnkBtnWishList_Click(object sender, EventArgs e)
    {

        if (Session["CustomerID"] != null)
        {
            bool b = true;

            int pid = int.Parse(Request.QueryString["pid"].ToString());
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
    private bool IsAlreadyExist(int pid, int customerId)
    {
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
    private void AddtoWishList(int pid, int customerId)
    {
        ProductsBLL obj = new ProductsBLL();
        obj.Pid = pid;
        obj.CId = customerId;
        int exe = obj.AddToWishList();
        if (exe > 0)
        {
            //int ppid = int.Parse(Request.QueryString["pid"].ToString());
            //int cid = int.Parse(Request.QueryString["cid"].ToString());
            //showmsg("Product Added Successfully In Your Wishlist", "product_details.aspx?cid=" + cid + "&pid=" + ppid + "&dis_price=");

            string jv = "<script>alert('Product Added Successfully In Your Wishlist');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
    }
    public void showmsg(string msg, string RedirectUrl)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "window.location='" + RedirectUrl + "';";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        string price = "";
        string disPrice = "";
        Label lblPrice = (Label)e.Item.FindControl("lblPrice");
        Label lblDisPrice = (Label)e.Item.FindControl("lblDisPrice");


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


        if (lblDisPrice.Text != "")
        {
            lblPrice.Font.Strikeout = true;
            price = lblPrice.Text.ToString();
            disPrice = lblDisPrice.Text.ToString();
            lblPrice.Text = "&#8377; " + string.Format("{0:n0}", price);
            lblDisPrice.Text = "&#8377; " + string.Format("{0:n0}", disPrice);
        }
        else
        {
            price = lblPrice.Text.ToString();
            // disPrice = lblDisPrice.ToString();
            lblPrice.Text = "&#8377; " + string.Format("{0:n0}", price);
            // lblDisPrice.Text = string.Format("{0:F2}", disPrice);
            lblPrice.Font.Strikeout = false;
        }
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label lblImgPath = (Label)e.Item.FindControl("lblImgPath");
        if (lblImgPath != null)
        {
            string strImgPath = lblImgPath.Text;
            Image img1 = (Image)e.Item.FindControl("img1");

            //string[] strImages = strImgPath.Split(',');
            //for (int i = 0; i <= strImages.Length - 1; i++)
            //{
            img1.Visible = true;
            img1.ImageUrl = "ProductsImages/" + strImgPath.ToString();
            // }
        }

        //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //{
        //    Label lblImg2 = (Label)e.Item.FindControl("lblImg2");
        //    Label lblImg3 = (Label)e.Item.FindControl("lblImg3");
        //    Label lblImg4 = (Label)e.Item.FindControl("lblImg4");

        //    HtmlGenericControl divImg2 = (HtmlGenericControl)e.Item.FindControl("divImg2");
        //    HtmlGenericControl divImg3 = (HtmlGenericControl)e.Item.FindControl("divImg3");
        //    HtmlGenericControl divImg4 = (HtmlGenericControl)e.Item.FindControl("divImg4");

        //    if (lblImg2.Text == "")
        //        divImg2.Visible = false;

        //    if (lblImg3.Text == "")
        //        divImg3.Visible = false;

        //    if (lblImg4.Text == "")
        //        divImg4.Visible = false;
        //}
    }

    //protected void btnPost_Click(object sender, EventArgs e)
    //{
    //    if (Page.IsValid)
    //    {
    //        AddProductReview();
    //    }
    //}
    //private void AddProductReview()
    //{
    //    int productId = int.Parse(Request.QueryString["pid"].ToString());
    //    int userId = int.Parse(Session["CustomerID"].ToString());


    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandSP = "z_AddProductReview";
    //    obj.AddParam("@user_id", userId);
    //    obj.AddParam("@product_id", productId);
    //    obj.AddParam("@review_title", txtTitle.Text.Trim());
    //    obj.AddParam("@review", txtDesc.Text.Trim());
    //    obj.AddParam("@rating", RadRating1.DbValue.ToString());

    //    if (obj.ExecuteNonQuery() > 0)
    //    {
    //        //txtAuthor.Text = "";
    //        //string jv = "<script>alert('Author Has Been Added Successfully');</script>";
    //        //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
    //    }
    //}
    protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        RadRating RadRating3 = (RadRating)e.Item.FindControl("RadRating3");
        Label lblDate = (Label)e.Item.FindControl("lblDate");
        Label lblRating = (Label)e.Item.FindControl("lblRating");

        if (lblDate != null)
        {
            DateTime dt = DateTime.Parse(lblDate.Text.ToString());
            lblDate.Text = dt.ToString("MMMM yyyy");
        }

        if (RadRating3 != null)
        {
            RadRating3.DbValue = lblRating.Text;
        }
    }

    //protected void btnCheckPincode_Click(object sender, EventArgs e)
    //{
    //    lblFreeShiping.Text = "";
    //    lblCod.Text = "";
    //    lblStatus.Text = "";


    //    CheckPincodeAvalibality(txtPincode.Text.Trim());
    //}
    //private void CheckPincodeAvalibality(string Pincode)
    //{
    //    try
    //    {
    //        DBconnection obj = new DBconnection();

    //        obj.SetCommandSP = "sc_CheckPincodeAvalibality";
    //        obj.AddParam("@Pincode", Pincode);

    //        // obj.SetCommandQry = "select * from StateCityPincode_tbl where pincode=" + Pincode;

    //        DataTable dt = new DataTable();
    //        dt = obj.ExecuteTable();
    //        if (dt.Rows.Count > 0)
    //        {
    //            string strCod = dt.Rows[0]["cod"].ToString();
    //            string strFreeShipping = dt.Rows[0]["free_shipping"].ToString();
    //            string strStatus = dt.Rows[0]["status"].ToString();
    //            string strDeliveryTime = dt.Rows[0]["transportation_time"].ToString();

    //            if (strStatus == "True")
    //            {
    //                if (strFreeShipping == "True")
    //                {
    //                    lblFreeShiping.Text = "Free shiping";
    //                }
    //                else
    //                {
    //                    lblFreeShiping.Text = "Shiping charges applicable";
    //                }


    //                if (strCod == "True")
    //                {
    //                    lblCod.Text = "COD is available for this item";
    //                }
    //                else
    //                {
    //                    lblCod.Text = "COD is not available for this item";
    //                }


    //                if (strStatus == "True")
    //                {
    //                    lblStatus.Text = "This item can be delivered to your location";
    //                }
    //                else
    //                {
    //                    lblStatus.Text = "This item can't be delivered to your location";
    //                }

    //            }

    //            else
    //            {
    //                lblStatus.Text = "This item can't be delivered to your location";
    //            }

    //        }
    //        else
    //        {
    //            lblStatus.Text = "This item can't be delivered to your location";
    //        }
    //    }
    //    catch { }
    //}
    protected void DataList1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        string price = "";
        string disPrice = "";
        Label lblPrice = (Label)e.Item.FindControl("lblPrice");
        Label lblDisPrice = (Label)e.Item.FindControl("lblDisPrice");

        if (lblDisPrice.Text != "")
        {
            lblPrice.Font.Strikeout = true;
            price = lblPrice.Text.ToString();
            disPrice = lblDisPrice.Text.ToString();
            lblPrice.Text = "&#8377; " + string.Format("{0:F2}", price);
            lblDisPrice.Text = "&#8377; " + string.Format("{0:F2}", disPrice);
        }
        else
        {
            price = lblPrice.Text.ToString();
            // disPrice = lblDisPrice.ToString();
            lblPrice.Text = "&#8377; " + string.Format("{0:F2}", price);
            // lblDisPrice.Text = string.Format("{0:F2}", disPrice);
            lblPrice.Font.Strikeout = false;
        }
    }
    private void BindProductReviews(int pid)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        // obj.SetCommandSP = "f_BindProducts";
        obj.SetCommandQry = "select * from View_ProductsReview where product_id=" + pid + " order by id desc";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DataList2.DataSource = dt.DefaultView;
            DataList2.DataBind();
        }
    }
    private void BindProductReviewsRating(int pid)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        // obj.SetCommandSP = "f_BindProducts";
        obj.SetCommandQry = "select count(id) as noofreviews, sum(rating) as totalreview, sum(rating)/count(id) as averagereview from View_ProductsReview where product_id=" + pid;
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            try
            {
                lblReviews.Text = "(" + dt.Rows[0]["noofreviews"].ToString() + ")";
                RadRating2.DbValue = dt.Rows[0]["averagereview"].ToString();
            }
            catch { lblReviews.Text = "(0)"; }
        }
        else
        { lblReviews.Text = "(0)"; }
    }
    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label lblImgPath = (Label)e.Item.FindControl("lblImgPathB");
        if (lblImgPath != null)
        {
            string strImgPath = lblImgPath.Text;
            Image imgBig = (Image)e.Item.FindControl("imgBig");

            string[] strImages = strImgPath.Split(',');
            //for (int i = 0; i <= strImages.Length - 1; i++)
            //{
            imgBig.Visible = true;
            imgBig.ImageUrl = "ProductsImages/" + strImgPath[0].ToString();
            // }
        }
    }
    protected void DataList1_ItemDataBound1(object sender, RepeaterItemEventArgs e)
    {
        string price = "";
        string disPrice = "";
        Label lblPrice = (Label)e.Item.FindControl("lblPrice");
        Label lblDisPrice = (Label)e.Item.FindControl("lblDisPrice");

        Label lblImgPath = (Label)e.Item.FindControl("lblImgPath");
        if (lblImgPath != null)
        {
            string strImgPath = lblImgPath.Text;
            Image img1 = (Image)e.Item.FindControl("img1");

            string[] strImages = strImgPath.Split(',');
            //for (int i = 0; i <= strImages.Length - 1; i++)
            //{
            img1.Visible = true;
            img1.ImageUrl = "../ProductsImages/" + strImages[0].ToString();
            // }
        }

        if (lblDisPrice.Text != "")
        {
            lblPrice.Font.Strikeout = true;
            price = lblPrice.Text.ToString();
            disPrice = lblDisPrice.Text.ToString();
            lblPrice.Text = "&#8377; " + string.Format("{0:F2}", price);
            lblDisPrice.Text = "&#8377; " + string.Format("{0:F2}", disPrice);
        }
        else
        {
            price = lblPrice.Text.ToString();
            // disPrice = lblDisPrice.ToString();
            lblPrice.Text = "&#8377; " + string.Format("{0:F2}", price);
            // lblDisPrice.Text = string.Format("{0:F2}", disPrice);
            lblPrice.Font.Strikeout = false;
        }
    }
    protected void DataList1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "AddtoWishlist")
        {
            int pid = int.Parse(e.CommandArgument.ToString());

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
    }
    private void GetWarrantyReturnCareText()
    {
        ProductsBLL obj = new ProductsBLL();
        DataTable dt = new DataTable();

        dt = obj.GetWarrantyReturnCareText();
        if (dt.Rows.Count > 0)
        {
            lblWarranty.Text = dt.Rows[0]["warranty"].ToString();
            lblReturns.Text = dt.Rows[0]["returns"].ToString();
            lblCare.Text = dt.Rows[0]["care"].ToString();
        }
        else
        {
            lblWarranty.Text = "";
            lblReturns.Text = "";
            lblCare.Text = "";
        }
    }
    protected void ddlSize_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (Request.QueryString["pid"] != null)
        {
            //ddlQty.SelectedItem.Text = "0";

            int pid = int.Parse(Request.QueryString["pid"].ToString());
            string size = ddlSize.SelectedItem.Text;
            string color = ddlColor.SelectedItem.Text;

            //if(color == "Colour")
            //{
            //    string jv = "<script>alert('Please select color');</script>";
            //    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            //    return;
            //}

            //string color1 = ddlColorRD.SelectedValue;
            //BindColorBox(pid);
            //ddlColorRD.SelectedValue = color1;
           

            if (color != "Colour")
            {
                bool b = IsQuantityExist(pid, size, color);
                //if (b == true)
                //{
                //    btnAddtoCart.Enabled = true;
                //    lblMsg.Text = "";
                //}
                //else
                //{
                //    btnAddtoCart.Enabled = false;
                //    lblMsg.Text = "Size Not Available!";
                //}
            }

            else
            {
                bool b = IsQuantityExisBySize(pid, size);
                if (b == true)
                {
                    btnAddtoCart.Enabled = true;
                    lblMsg.Text = "";
                }
                else
                {
                    btnAddtoCart.Enabled = false;
                    lblMsg.Text = "Size Not Available!";
                }

            }
        }
    }
    
    //protected void ddlBootSize_SelectedIndexChanged(object sender, EventArgs e)
    //{
        //if (Request.QueryString["pid"] != null)
        //{
        //    //ddlQty.SelectedItem.Text = "0";
        //    ddlQty.Items.Clear();
        //    ddlQty.Items.Insert(0, "0");

        //    int pid = int.Parse(Request.QueryString["pid"].ToString());
        //    string size = ddlBootSize.SelectedItem.Text;

        //    bool b = IsQuantityExist(pid, size);
        //    if (b == true)
        //    {
        //        btnAddtoCart.Enabled = true;
        //        lblMsg.Text = "";
        //    }
        //    else
        //    {
        //        btnAddtoCart.Enabled = false;
        //        lblMsg.Text = "Size Not Available!";
        //    }
        //}
   // }
    private bool IsQuantityExist(int pid, string size, string color)
    {
        bool b = false;

        ProductsBLL obj = new ProductsBLL();
        DataTable dt = new DataTable();
        obj.Pid = pid;
        obj.Size = size;
        obj.Color = color;
        dt = obj.GetQuantityBySize();
        if (dt.Rows.Count > 0)
        {
            BindColor(pid);
            ddlColor.SelectedValue = color;

            BindSize(pid);
            ddlSize.SelectedValue = size;

            b = true;
            int q = int.Parse(dt.Rows[0]["stock_qty"].ToString());

            if (q > 10)
            {
                btnAddtoCart.Enabled = true;
                BindQuantity(10);
            }
            else
            {
                if (q == 0)
                {
                    btnAddtoCart.Enabled = false;
                    //lblMsg.Text = "Size Not Available!";
                }
                else
                {
                    btnAddtoCart.Enabled = true;
                    BindQuantity(q);
                }
            }
        }

        else
        {
            ddlQty.Items.Clear();
            ddlQty.Items.Insert(0, "0");
        }

        return b;
    }
    private bool IsQuantityExistByColor(int pid, string color)
    {
        bool b = false;

        ProductsBLL obj = new ProductsBLL();
        DataTable dt = new DataTable();
        obj.Pid = pid;
        obj.Color = color;
        dt = obj.GetQuantityByColor();
        if (dt.Rows.Count > 0)
        {
            //BindSize(pid);
            ddlSize.DataSource = dt;
            ddlSize.DataBind();

            b = true;
            int q = int.Parse(dt.Rows[0]["stock_qty"].ToString());

            if (q > 10)
            {
                btnAddtoCart.Enabled = true;
                BindQuantity(10);
            }
            else
            {
                if (q == 0)
                {
                    btnAddtoCart.Enabled = false;
                    //lblMsg.Text = "Size Not Available!";
                }
                else
                {
                    btnAddtoCart.Enabled = true;
                    BindQuantity(q);
                }
            }
        }

        else
        {
            ddlQty.Items.Clear();
            ddlQty.Items.Insert(0, "0");
        }

        return b;
    }
    private bool IsQuantityExisBySize(int pid, string size)
    {
        bool b = false;

        ProductsBLL obj = new ProductsBLL();
        DataTable dt = new DataTable();
        obj.Pid = pid;
        obj.Size = size;
        dt = obj.GetQuantityBySize1();
        if (dt.Rows.Count > 0)
        {
            string color = dt.Rows[0]["color"].ToString();
            //ddlColor.DataSource = dt;
            //ddlColor.DataBind();
            //BindSize(pid);
            BindColor(pid);
            ddlColor.SelectedValue = color;

            b = true;
            int q = int.Parse(dt.Rows[0]["stock_qty"].ToString());

            if (q > 10)
                BindQuantity(10);
            else
                BindQuantity(q);
        }

        else
        {
            ddlQty.Items.Clear();
            ddlQty.Items.Insert(0, "0");
        }

        return b;
    }   

    //protected void Repeater2_ItemDataBound1(object sender, RepeaterItemEventArgs e)
    //{
    //    Label lblColorCode = (Label)e.Item.FindControl("lblColorCode");
    //    Label lblColorHexCode = (Label)e.Item.FindControl("lblColorHexCode");

    //    if (lblColorHexCode != null)
    //    {
    //        lblColorCode.BackColor = System.Drawing.ColorTranslator.FromHtml(lblColorHexCode.Text);
    //    }       

    //    //ddlColorRD.SelectedValue = lblColorHexCode.Text;
    //    //ddlColorRD.SelectedItem.Text = lblColorCode.Text;



    //}

    //protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    //{
    //    string s = "";
    //}

    protected void ddlColor_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Request.QueryString["pid"] != null)
        {
            bool b;
            int pid = int.Parse(Request.QueryString["pid"].ToString());
            string color = ddlColor.SelectedItem.Text;
            // string size = ddlSize.SelectedItem.Text;

            //if (size != "Size" || size != "")
            //{
            //    b = IsQuantityExist(pid, color, size);
            //}
            //else
            //{

            //    b = IsQuantityExistByColor(pid, color);
            //}

            b = IsQuantityExistByColor(pid, color);
            //if (b == true)
            //{
            //    btnAddtoCart.Enabled = true;
            //    lblMsg.Text = "";
            //}
            //else
            //{
            //    btnAddtoCart.Enabled = false;
            //    lblMsg.Text = "Size Not Available!";
            //}
        }
    }

    //protected void ddlColorRD_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (Request.QueryString["pid"] != null)
    //    {
    //        //ddlQty.SelectedItem.Text = "0";


    //        int pid = int.Parse(Request.QueryString["pid"].ToString());
    //        string color = ddlColorRD.SelectedValue;



    //        bool b = IsQuantityExistByColor(pid, color);
    //        if (b == true)
    //        {
    //            btnAddtoCart.Enabled = true;
    //            lblMsg.Text = "";
    //        }
    //        else
    //        {
    //            btnAddtoCart.Enabled = false;
    //            lblMsg.Text = "Size Not Available!";
    //        }

    //        BindColorBox(pid);

    //        ddlColorRD.SelectedValue = color;
    //    }
    //}

    //protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
    //{
    //    try
    //    {
    //        if (e.CommandName == "SelectColor")
    //        {
    //            string color = e.CommandArgument.ToString();
    //            if (Request.QueryString["pid"] != null)
    //            {
    //                bool b;
    //                int pid = int.Parse(Request.QueryString["pid"].ToString());                   

    //                b = IsQuantityExistByColor(pid, color);
    //                if (b == true)
    //                {
    //                    btnAddtoCart.Enabled = true;
    //                    lblMsg.Text = "";
    //                }
    //                else
    //                {
    //                    btnAddtoCart.Enabled = false;
    //                    lblMsg.Text = "Size Not Available!";
    //                }
    //            }
    //        }
    //    }
    //    catch { }
    //}
}