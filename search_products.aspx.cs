using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using System.Globalization;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

public partial class search_products : System.Web.UI.Page
{
    CultureInfo cInfo = new CultureInfo("hi-IN");

    DataTable dt;
    ProductsBLL obj = new ProductsBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                // BindCategories();
                lblSearchValue.Visible = false;

                if (Session["Searchvalue"] != null)
                {
                    lblSearchValue.Visible = true;
                    string searchValue = Session["Searchvalue"].ToString();
                    BindSearchProducts(searchValue);
                    lblSearchValue.Text = "<b>Search Result For: </b>" + searchValue;
                }
            }
            catch { }
        }
    }  
   
    protected void DataList1_ItemDataBound(object sender, Telerik.Web.UI.RadListViewItemEventArgs e)
    {
        try
        {
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

            //try
            //{
            //    //RadDataPager1.Visible = (RadDataPager1.PageSize < RadDataPager1.TotalRowCount);
            //    RadDataPager pager = (RadDataPager)RadListView1.FindControl("RadDataPager1");
            //    pager.Visible = (pager.PageSize < pager.TotalRowCount);
            //}
            //catch { }

            // HtmlGenericControl divDiscount = e.Item.FindControl("divDiscount") as HtmlGenericControl;
            HtmlGenericControl divDiscount1 = e.Item.FindControl("divDiscount1") as HtmlGenericControl;

            string price = "";

            string disPrice = "";
            Label lblPrice = (Label)e.Item.FindControl("lblPrice");
            Label lblDisPrice = (Label)e.Item.FindControl("lblDisPrice");

            //Label lblNew = (Label)e.Item.FindControl("lblNew");
            //Label lblLatestPro = (Label)e.Item.FindControl("lblLatestPro");
            Label lblPerce = (Label)e.Item.FindControl("lblPerce");
            //Label lblDiscount = (Label)e.Item.FindControl("lblDiscount");

            //if (lblLatestPro != null)
            //{
            //    if (lblLatestPro.Text == "True")
            //    {
            //        divDiscount.Visible = true;
            //        lblNew.Visible = true;
            //        lblNew.Text = "New";
            //    }
            //    else
            //    {
            //        lblNew.Visible = false;
            //        lblNew.Text = "";
            //        divDiscount.Visible = false;
            //    }
            //}

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
                //lblPrice.Text = price;//String.Format("<del>{0}</del>", myPrice.ToString("c"));
                lblPrice.Text = Convert.ToDecimal(price).ToString("C0", cInfo);
                lblDisPrice.Text = Convert.ToDecimal(disPrice).ToString("C0", cInfo);
                //lblDisPrice.Text = "&#8377; " + disPrice;
            }
            else
            {
                price = lblPrice.Text.ToString();
                // disPrice = lblDisPrice.ToString();
               // lblPrice.Text = price;
                // lblDisPrice.Text = string.Format("{0:F2}", disPrice);

                lblPrice.Text = Convert.ToDecimal(price).ToString("C0", cInfo);
                lblPrice.Font.Strikeout = false;
            }
        }
        catch { }

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
            //showmsg("Product Added Successfully In Your Wishlist", "wish_list.aspx");

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
    protected void RadListView1_ItemCommand(object sender, RadListViewCommandEventArgs e)
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
                    Response.Redirect("cart/wish_list.aspx");
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
    protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string strValue = "";
            string value = ddlSort.SelectedValue.ToString();
            if (value == "1")
                strValue = "ORDER BY selling_price Asc";
            if (value == "2")
                strValue = "ORDER BY selling_price Desc";
            if (value == "3")
                strValue = "ORDER BY product_name Asc";
            if (value == "4")
                strValue = "ORDER BY product_name Desc";

            BindSortedProducts(strValue);

        }
        catch { }
    }   
    private void BindSortedProducts(string sortField)
    {
        try
        {
            string strManufacturer = "";
            string strBrands = "";


            foreach (ListItem li in chkManufacturer.Items)
            {
                if (li.Selected == true)
                {
                    strManufacturer = strManufacturer + "manufacturer like '%" + li.Text + "%' or ";
                }
            }

            foreach (ListItem li in chkBrands.Items)
            {
                if (li.Selected == true)
                {
                    strBrands = strBrands + "brand like '%" + li.Text + "%' or ";
                }
            }
            
            if(strManufacturer!="")
                strManufacturer = strManufacturer.Remove(strManufacturer.Length - 3);
            
            if(strBrands !="")
                strBrands = strBrands.Remove(strBrands.Length - 3);

           // int cid = int.Parse(Request.QueryString["cid"].ToString());
           // int sid = int.Parse(Request.QueryString["sid"].ToString());

          //  string ids = "cid= " + cid + " and sid=" + sid;

            DataTable dt = new DataTable();
            DBconnection obj = new DBconnection();

            obj.SetCommandQry = "select * from View_ProductsWithPromotions where " + Session["SearchValue"].ToString() + "  " + sortField + "";

            if (chkManufacturer.SelectedIndex != -1)
            {
                obj.SetCommandQry = "select * from View_ProductsWithPromotions where " + Session["SearchValue"].ToString() + " and (" + strManufacturer + ") " + sortField + "";
            }

            if (chkBrands.SelectedIndex != -1)
            {
                obj.SetCommandQry = "select * from View_ProductsWithPromotions where " + Session["SearchValue"].ToString() + " and (" + strBrands + ") " + sortField + "";
            }

            if (chkManufacturer.SelectedIndex != -1 && chkBrands.SelectedIndex != -1)
            {
                obj.SetCommandQry = "select * from View_ProductsWithPromotions where  " + Session["SearchValue"].ToString() + " and (" + strManufacturer + ") and (" + strBrands + ")  " + sortField + "";
            }



            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
            {
                lblMsg.Text = "";
                //if (dt.Rows.Count > 12)
                //{
                //    RadDataPager1.Visible = true;
                //}
                //else
                //{
                //    RadDataPager1.Visible = false;
                //}
                RadListView1.Visible = true;
                RadListView1.DataSourceID = null;
                RadListView1.DataSource = dt;
                RadListView1.DataBind();
            }
            else
            {

                RadListView1.Visible = false;
                //RadDataPager1.Visible = false;
                lblMsg.Text = "There are no items to be displayed.";
            }

        }
        catch
        {
            //int cid = int.Parse(Request.QueryString["cid"].ToString());
            //BindProductsByCatId(cid);
        }
    }
    protected void RadListView1_PageIndexChanged(object sender, RadListViewPageChangedEventArgs e)
    {
        RadListView1.CurrentPageIndex = e.NewPageIndex;
        string strValue = "";
        string value = ddlSort.SelectedValue.ToString();
        if (value == "1")
            strValue = "Asc";
        if (value == "2")
            strValue = "Desc";

     
            BindSortedProducts(strValue);
       
    }

    //private void BindCategories()
    //{
    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandSP = "z_GetProductsForCategories";

    //    DataSet ds = new DataSet();
    //    ds = obj.ExecuteDataSet();

    //    ds.Relations.Add(new DataRelation("CategoriesRelation", ds.Tables[0].Columns["cid"],
    //        ds.Tables[1].Columns["cid"]));
    //    rMainCategories.DataSource = ds.Tables[0];
    //    rMainCategories.DataBind();
    //}
    //protected void rMainCategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    if (e.Item.ItemType == ListItemType.Item ||
    //    e.Item.ItemType == ListItemType.AlternatingItem)
    //    {
    //        DataRowView drv = e.Item.DataItem as DataRowView;
    //        Repeater rSubCategories = e.Item.FindControl("rSubCategories") as Repeater;
    //        rSubCategories.DataSource = drv.CreateChildView("CategoriesRelation");
    //        rSubCategories.DataBind();
    //    }
    //}

    private void BindSearchProducts(string searchField)
    {
        string ss = "";
        string[] b = { "product_name", "brand_name", "sku", "manufacturer_name", "model_type" };

        string[] a = searchField.Split(' ');
        for (int j = 0; j <= 2; j++)
        {
            for (int i = 0; i <= a.Length - 1; i++)
            {
                ss = ss + b[j] + " like  '%'+'" + a[i] + "'+ '%'" + " or ";
            }
        }

        ss = ss.Substring(0, ss.Length - 3);
        Session["SearchValue"] = ss;


        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_ProductsWithPromotions where " + ss + " ";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadListView1.Visible = true;

            RadListView1.DataSourceID = null;
            RadListView1.DataSource = dt;
            RadListView1.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            lblMsg.Text = "No Products Found";
            RadListView1.Visible = false;
        }
    }
    protected void chkManufacturer_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strValue = "";
        string value = ddlSort.SelectedValue.ToString();

        if (value == "0")
            strValue = "ORDER BY product_name Desc";
        if (value == "1")
            strValue = "ORDER BY selling_price Asc";
        if (value == "2")
            strValue = "ORDER BY selling_price Desc";
        if (value == "3")
            strValue = "ORDER BY product_name Desc";
        if (value == "4")
            strValue = "ORDER BY product_name Desc";
        

        BindSortedProducts(strValue);

    }
    protected void chkBrands_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strValue = "";
        string value = ddlSort.SelectedValue.ToString();
        if (value == "0")
            strValue = "ORDER BY product_name Desc";
        if (value == "1")
            strValue = "ORDER BY selling_price Asc";
        if (value == "2")
            strValue = "ORDER BY selling_price Desc";
        if (value == "3")
            strValue = "ORDER BY product_name Desc";
        if (value == "4")
            strValue = "ORDER BY product_name Desc";

        BindSortedProducts(strValue);
    }
}