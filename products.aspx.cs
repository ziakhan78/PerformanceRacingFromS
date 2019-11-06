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

public partial class products : System.Web.UI.Page
{
    CultureInfo cInfo = new CultureInfo("hi-IN");

    DataTable dt;
    ProductsBLL obj = new ProductsBLL();
    int cid = 0;
    int sid = 0;
    string sort = "";
    string queryBrand = null;

    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadListView1.CurrentPageIndex.ToString();
      //  Response.Cookies["currentpage"]["pageIndex"] = RadListView2.CurrentPageIndex.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (!IsPostBack)
        {           

            lblSearchValue.Visible = false;
           // BindCategories();
            if (Request.QueryString["cid"] != null)
            {
                cid = int.Parse(Request.QueryString["cid"].ToString());
                Session["cid"] = cid;
                BindProductsByCatId(cid);
                //GetCatSubcatSubsubcat(cid);
            }

            if (Request.QueryString["bikes"] != null)
            {
                string bikes = Request.QueryString["bikes"].ToString();
                BindBikeProducts(bikes);
            }

            if (Request.QueryString["sid"] != null)
            {
                //int cid = int.Parse(Request.QueryString["cid"].ToString());
                // int cid = int.Parse(Session["cid"].ToString());
                // GetCatSubcatSubsubcat(cid);

                sid = int.Parse(Request.QueryString["sid"].ToString());
                Session["sid"] = sid;
                BindProductsBySubCat(sid);
            }

            //if (Session["Searchvalue"] != null)
            //{
            //    lblSearchValue.Visible = true;
            //    string searchValue = Session["Searchvalue"].ToString();
            //    BindSearchProducts(searchValue);
            //    lblSearchValue.Text = "<b>Search Result For: </b>" + searchValue;
            //}

            string value = "";
            if (Session["Sort"] == null)
            {
                value = "1";
                Session["Sort"] = value;
            }
            else
            {
                value = Session["Sort"].ToString();
            }

            if (value == "1")
                sort = "ORDER BY price Asc";
            if (value == "2")
                sort = "ORDER BY price Desc";
            if (value == "3")
                sort = "ORDER BY product_name Asc";
            if (value == "4")
                sort = "ORDER BY product_name Desc";

           
           

            if (Request.QueryString["manufacturer"] != null)
            {
                cid = int.Parse(Request.QueryString["cid"].ToString());
                sid = int.Parse(Request.QueryString["sid"].ToString());
                string manufacturer = Request.QueryString["manufacturer"].ToString();
                string brand = null;
                queryBrand = null;
                BindProductsByZia(cid, sid, manufacturer, brand, sort);
            }

            try
            {
                if (Request.QueryString["brand"] != "")
                {
                    cid = int.Parse(Request.QueryString["cid"].ToString());
                    sid = int.Parse(Request.QueryString["sid"].ToString());

                    string brand = Request.QueryString["brand"].ToString();
                    string manufacturer = null;
                    BindProductsByZia(cid, sid, manufacturer, brand, sort);
                }
            }
            catch { }

            try
            {
                if (Request.QueryString["brand"] != "" && Request.QueryString["manufacturer"] != "")
                {
                    cid = int.Parse(Request.QueryString["cid"].ToString());
                    sid = int.Parse(Request.QueryString["sid"].ToString());

                    string manufacturer = Request.QueryString["manufacturer"].ToString();
                    string brand = Request.QueryString["brand"].ToString();
                    BindProductsByZia(cid, sid, manufacturer, brand, sort);
                }
            }
            catch { }
        }

        
    }


    //private void GetCatSubcatSubsubcat(int cid)
    //{
    //    try
    //    {
    //        DataTable dt = new DataTable();
    //        DBconnection obj = new DBconnection();
    //        // obj.SetCommandSP = "f_BindProducts";

    //        //obj.SetCommandQry = "select * from View_Cat_SubCat_SubSubCat where cid=" + cid + " order by sid, ssid asc";

    //        obj.SetCommandQry = "select * from Category_tbl where cid=" + cid;

    //        dt = obj.ExecuteTable();
    //        if (dt.Rows.Count > 0)
    //        {
    //            lblCatName.Text = dt.Rows[0]["cat_name"].ToString();
    //            // lblSubCatName.Text = dt.Rows[0]["subcat_name"].ToString();
    //            //lblSubSubCatName.Text = dt.Rows[0]["subsubcat_name"].ToString();
    //        }
    //    }
    //    catch { }
    //}
    private void BindProductsByCatId(int cid)
    {
        ProductsBLL obj = new ProductsBLL();
        obj.CId = cid;
        dt = obj.GetProductByCatId();
        if (dt.Rows.Count > 0)
        {
            RadListView1.Visible = true;

            // lblCatName1.Text = dt.Rows[0]["cat_name"].ToString();
            lblCatName.Text = dt.Rows[0]["cat_name"].ToString();
            //lblSubCatName.Text = dt.Rows[0]["subcat_name"].ToString();

            RadListView1.DataSourceID = null;
            RadListView1.DataSource = dt.DefaultView;
            RadListView1.DataBind();

            RadListView2.Visible = true;
            RadListView2.DataSourceID = null;
            RadListView2.DataSource = dt.DefaultView;
            RadListView2.DataBind();

            if (Session["View"] != null)
            {
                string view = Session["View"].ToString();
                if (view == "Grid")
                {
                    lnkBtnGridView.CssClass = "active";
                    RadListView1.Visible = true;
                    RadListView2.Visible = false;
                }
                else
                {
                    lnkBtnListView.CssClass = "active";
                    RadListView1.Visible = false;
                    RadListView2.Visible = true;
                }
            }
            else
            {
                Session["View"] = "Grid";
                lnkBtnGridView.CssClass = "active";
                RadListView1.Visible = true;
                RadListView2.Visible = false;
            }


        }
        else
        {
            Session["View"] = "Grid";
            lnkBtnGridView.CssClass = "active";
            RadListView1.Visible = false;
            RadListView2.Visible = false;
            lblMsg.Text = "There are no items to be displayed.";
        }
    }
    private void BindProducts(int ssid)
    {
        ProductsBLL obj = new ProductsBLL();
        //obj.Ssid = ssid;
        dt = obj.GetProductBySubSubCatId();
        if (dt.Rows.Count > 0)
        {


            //lblCatName1.Text = dt.Rows[0]["cat_name"].ToString();
            //lblCatName.Text = dt.Rows[0]["cat_name"].ToString();
            //lblSubCatName.Text = dt.Rows[0]["subcat_name"].ToString();

            RadListView1.Visible = true;
            RadListView1.DataSourceID = null;
            RadListView1.DataSource = dt.DefaultView;
            RadListView1.DataBind();

            RadListView2.Visible = true;
            RadListView2.DataSourceID = null;
            RadListView2.DataSource = dt.DefaultView;
            RadListView2.DataBind();

            if (Session["View"] != null)
            {
                string view = Session["View"].ToString();
                if (view == "Grid")
                {
                    lnkBtnGridView.CssClass = "active";
                    RadListView1.Visible = true;
                    RadListView2.Visible = false;
                }
                else
                {
                    lnkBtnListView.CssClass = "active";
                    RadListView1.Visible = false;
                    RadListView2.Visible = true;
                }
            }
            else
            {
                Session["View"] = "Grid";
                lnkBtnGridView.CssClass = "active";
                RadListView1.Visible = true;
                RadListView2.Visible = false;
            }
        }
        else
        {
            Session["View"] = "Grid";
            lnkBtnGridView.CssClass = "active";
            RadListView1.Visible = false;
            RadListView2.Visible = false;
            lblMsg.Text = "There are no items to be displayed.";
        }
    }
    private void BindProductsBySubCat(int sid)
    {
        ProductsBLL obj = new ProductsBLL();
        //obj.CId = cid;
        obj.SId = sid;
        dt = obj.GetProductBySubCatId();
        if (dt.Rows.Count > 0)
        {
            string strCid = dt.Rows[0]["cid"].ToString();
            lblCatName.Text = dt.Rows[0]["cat_name"].ToString();
            lblSubCat.Text = dt.Rows[0]["subcat_name"].ToString();


            lnkCat.HRef = "sub_categories.aspx?cid=" + strCid;



            RadListView1.Visible = true;
            RadListView1.DataSourceID = null;
            RadListView1.DataSource = dt.DefaultView;
            RadListView1.DataBind();

            RadListView2.Visible = true;
            RadListView2.DataSourceID = null;
            RadListView2.DataSource = dt.DefaultView;
            RadListView2.DataBind();

            if (Session["View"] != null)
            {
                string view = Session["View"].ToString();
                if (view == "Grid")
                {
                    lnkBtnGridView.CssClass = "active";
                    RadListView1.Visible = true;
                    RadListView2.Visible = false;
                }
                else
                {
                    lnkBtnListView.CssClass = "active";
                    RadListView1.Visible = false;
                    RadListView2.Visible = true;
                }
            }
            else
            {
                Session["View"] = "Grid";
                lnkBtnGridView.CssClass = "active";
                RadListView1.Visible = true;
                RadListView2.Visible = false;
            }
        }
        else
        {
            Session["View"] = "Grid";
            lnkBtnGridView.CssClass = "active";
            RadListView1.Visible = false;
            RadListView2.Visible = false;
            lblMsg.Text = "There are no items to be displayed.";
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
    //protected void chkPriceList_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    // ddlSort.SelectedIndex = 0;
    //    int cid = int.Parse(Request.QueryString["cid"].ToString());

    //    // string strPrice = "";
    //    string[] arrPrice = new string[3];

    //    foreach (ListItem li in chkPriceList.Items)
    //    {
    //        if (li.Selected == true)
    //        {
    //            arrPrice = li.Value.Split('-');

    //            //strPrice = strPrice + "'" + li.Value + "'" + ",";
    //        }
    //    }
    //    try
    //    {
    //        Session["Price1"] = arrPrice[0].Trim().ToString();
    //        Session["Price2"] = arrPrice[1].Trim().ToString();

    //        string strValue = "";
    //        string value = ddlSort.SelectedValue.ToString();
    //        if (value == "1")
    //            strValue = "Asc";
    //        if (value == "2")
    //            strValue = "Desc";


    //        if (value == "0")
    //        {
    //            BindProducts1();
    //        }
    //        if (value == "1")
    //        {
    //            strValue = "Asc";
    //            BindSortedProducts(strValue);
    //        }
    //        if (value == "2")
    //        {
    //            strValue = "Desc";
    //            BindSortedProducts(strValue);
    //        }

    //        // BindProducts1();


    //        // BindProductsByPriceRange(arrPrice[0].Trim().ToString(), arrPrice[1].Trim().ToString(), cid);
    //    }
    //    catch { }
    //}
    protected void lnkShowAll_Click(object sender, EventArgs e)
    {
        // chkPriceList.ClearSelection();
        // chkOccasion.ClearSelection();
        RadListView1.DataSourceID = null;
        RadListView1.DataSourceID = "dsProducts";
        RadListView1.DataBind();
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
            string manufacturer = null;
            string brand = null;

            string value = ddlSort.SelectedValue.ToString();
            if (value == "1")
                strValue = "ORDER BY price Asc";
            if (value == "2")
                strValue = "ORDER BY price Desc";
            if (value == "3")
                strValue = "ORDER BY product_name Asc";
            if (value == "4")
                strValue = "ORDER BY product_name Desc";

            Session["Sort"] = value;

            // BindSortedProducts(strValue);
            try
            {
                string s = Request.QueryString["m"].ToString();
            }
            catch { }
            cid = int.Parse(Session["cid"].ToString());
            sid = int.Parse(Session["sid"].ToString());
            try
            {
                manufacturer = Request.QueryString["manufacturer"].ToString();
            }
            catch { }
            try
            {
                brand = Request.QueryString["brand"].ToString();
            }
            catch { }
            BindProductsByZia(cid, sid, manufacturer, brand, strValue);

        }
        catch { }
    }
    protected void chkMaterials_SelectedIndexChanged(object sender, EventArgs e)
    {
        ////ddlSort.SelectedIndex = 0;
        ////BindProducts1();
        //string strValue = "";
        //string value = ddlSort.SelectedValue.ToString();
        //if (value == "1")
        //    strValue = "Asc";
        //if (value == "2")
        //    strValue = "Desc";


        //if (value == "0")
        //{
        //    BindProducts1();
        //}
        //if (value == "1")
        //{
        //    strValue = "Asc";
        //    BindSortedProducts(strValue);
        //}
        //if (value == "2")
        //{
        //    strValue = "Desc";
        //    BindSortedProducts(strValue);
        //}
    }
    protected void chkColors_SelectedIndexChanged(object sender, EventArgs e)
    {
        ////ddlSort.SelectedIndex = 0;
        ////BindProducts1();
        //string strValue = "";
        //string value = ddlSort.SelectedValue.ToString();
        //if (value == "1")
        //    strValue = "Asc";
        //if (value == "2")
        //    strValue = "Desc";


        //if (value == "0")
        //{
        //    BindProducts1();
        //}
        //if (value == "1")
        //{
        //    strValue = "Asc";
        //    BindSortedProducts(strValue);
        //}
        //if (value == "2")
        //{
        //    strValue = "Desc";
        //    BindSortedProducts(strValue);
        //}
    }
    private void BindProducts1()
    {
        try
        {

            string strColor = "";



            //foreach (ListItem li in chkColors.Items)
            //{
            //    if (li.Selected == true)
            //    {
            //        strColor = strColor + "colors like '%" + li.Text + "%' or ";
            //    }
            //}


            //int sid = int.Parse(Request.QueryString["cid"].ToString());

            //DataTable dt = new DataTable();
            //DBconnection obj = new DBconnection();

            //if (chkPriceList.SelectedIndex == -1)
            //{
            //    Session["Price1"] = 0;
            //    Session["Price2"] = 100000;
            //    obj.SetCommandQry = "select * from View_ProductsWithPromotions where price between " + Session["Price1"] + " and " + Session["Price2"] + " and cid=" + sid + " ORDER BY pid desc";
            //}


            //if (chkColors.SelectedIndex != -1)
            //{
            //    strColor = strColor.Remove(strColor.Length - 3);
            //    obj.SetCommandQry = "select * from View_ProductsWithPromotions where price between " + Session["Price1"] + " and " + Session["Price2"] + " and cid=" + sid + " and (" + strColor + ") ORDER BY pid desc";
            //}


            //dt = obj.ExecuteTable();
            //if (dt.Rows.Count > 0)
            //{
            //    lblMsg.Text = "";
            //    //if (dt.Rows.Count > 12)
            //    //{
            //    //    RadDataPager1.Visible = true;
            //    //}
            //    //else
            //    //{
            //    //    RadDataPager1.Visible = false;
            //    //}
            //    RadListView1.Visible = true;
            //    RadListView1.DataSourceID = null;
            //    RadListView1.DataSource = dt;
            //    RadListView1.DataBind();
            //}
            //else
            //{

            //    RadListView1.Visible = false;
            //    //RadDataPager1.Visible = false;
            //    lblMsg.Text = "There are no items to be displayed.";
            //}

        }
        catch
        {
            //RadListView1.DataSourceID = null;
            //RadListView1.DataSourceID = "dsProducts";
            //RadListView1.DataBind();

            int cid = int.Parse(Request.QueryString["cid"].ToString());
            BindProductsByCatId(cid);
        }
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
                    strManufacturer = strManufacturer + "manufacturer_name like '%" + li.Text + "%' or ";
                }
            }

            foreach (ListItem li in chkBrands.Items)
            {
                if (li.Selected == true)
                {
                    strBrands = strBrands + "brand_name like '%" + li.Text + "%' or ";
                }
            }
            
            if(strManufacturer!="")
                strManufacturer = strManufacturer.Remove(strManufacturer.Length - 3);
            
            if(strBrands !="")
                strBrands = strBrands.Remove(strBrands.Length - 3);

            int cid = int.Parse(Request.QueryString["cid"].ToString());
            int sid = int.Parse(Request.QueryString["sid"].ToString());

            string ids = "cid= " + cid + " and sid=" + sid;

            DataTable dt = new DataTable();
            DBconnection obj = new DBconnection();

            obj.SetCommandQry = "select * from View_ProductsWithPromotions where " + ids + "  " + sortField + "";

            if (chkManufacturer.SelectedIndex != -1)
            {
                obj.SetCommandQry = "select * from View_ProductsWithPromotions where " + ids + " and (" + strManufacturer + ") " + sortField + "";
            }

            if (chkBrands.SelectedIndex != -1)
            {
                obj.SetCommandQry = "select * from View_ProductsWithPromotions where " + ids + " and (" + strBrands + ") " + sortField + "";
            }

            if (chkManufacturer.SelectedIndex != -1 && chkBrands.SelectedIndex != -1)
            {
                obj.SetCommandQry = "select * from View_ProductsWithPromotions where  " + ids + " and (" + strManufacturer + ") and (" + strBrands + ")  " + sortField + "";
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

                RadListView2.Visible = true;
                RadListView2.DataSourceID = null;
                RadListView2.DataSource = dt.DefaultView;
                RadListView2.DataBind();

                if (Session["View"] != null)
                {
                    string view = Session["View"].ToString();
                    if (view == "Grid")
                    {
                        lnkBtnGridView.CssClass = "active";
                        RadListView1.Visible = true;
                        RadListView2.Visible = false;
                    }
                    else
                    {
                        lnkBtnListView.CssClass = "active";
                        RadListView1.Visible = false;
                        RadListView2.Visible = true;
                    }
                }
                else
                {
                    Session["View"] = "Grid";
                    lnkBtnGridView.CssClass = "active";
                    RadListView1.Visible = true;
                    RadListView2.Visible = false;
                }
            }
            else
            {
                Session["View"] = "Grid";
                lnkBtnGridView.CssClass = "active";
                RadListView1.Visible = false;
                RadListView2.Visible = false;
                lblMsg.Text = "There are no items to be displayed.";
            }

        }
        catch(Exception ex)
        {
            //int cid = int.Parse(Request.QueryString["cid"].ToString());
            //BindProductsByCatId(cid);
        }
    }
    //private void ManageGrid()
    //{
    //    try
    //    {        

    //        if (Session["SearchByAlfhabetic"] != null)
    //        {
    //            SearchByAlphabet(Session["SearchByAlfhabetic"].ToString());
    //            RadListView1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
    //            Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
    //        }

    //        else
    //        {
    //            BindGrid();
    //        }
    //    }
    //    catch
    //    {
    //        BindGrid();
    //    }
    //}
    protected void RadListView1_PageIndexChanged(object sender, RadListViewPageChangedEventArgs e)
    {
        RadListView1.CurrentPageIndex = e.NewPageIndex;

        string strValue = "";
        string value = ddlSort.SelectedValue.ToString();
        if (value == "0")
            strValue = "ORDER BY pid Desc";
        if (value == "1")
            strValue = "ORDER BY price Asc";
        if (value == "2")
            strValue = "ORDER BY price Desc";
        if (value == "3")
            strValue = "ORDER BY product_name Desc";
        if (value == "4")
            strValue = "ORDER BY product_name Desc";

        try
        {

            if (Request.QueryString["bikes"] != null)
            {
                string bikes = Request.QueryString["bikes"].ToString();
                BindBikeProducts(bikes);
            }
            else
            {
                BindSortedProducts(strValue);
                RadListView1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }
        }
        catch
        {
            RadListView1.DataSourceID = "dsProductsBycatid";
            RadListView1.DataBind();
            RadListView1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
            Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
        }
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
        string[] b = { "product_name", "brand", "sku", "manufacturer", "model" };

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
        string s = "";
        cid = int.Parse(Session["cid"].ToString());
        sid = int.Parse(Session["sid"].ToString());
        string strManufacturer = "";
        string strBrand = null;
        

        foreach (ListItem li in chkManufacturer.Items)
        {
            if (li.Selected == true)
            {
                s = s + li.Text + ",";
                strManufacturer = strManufacturer + "manufacturer_name like '%" + li.Text + "%' or ";
            }
        }
        if (strManufacturer != "")
        {
            strManufacturer = strManufacturer.Remove(strManufacturer.Length - 3);
            Session["QueryManufacturer"] = strManufacturer;
        }

        s = s.Remove(s.Length - 1);
        Session["Manufacturer"] = s;

        if (Session["Brand"] != null)
        {
            strBrand = Session["Brand"].ToString();
            queryBrand = Session["QueryBrand"].ToString();
        }

        Response.Redirect("products.aspx?cid=" + cid + "&sid=" + sid + "&manufacturer=" + strManufacturer + "&brand=" + queryBrand + "&m=" + s+ "&b=" + strBrand);
    }
    protected void chkBrands_SelectedIndexChanged(object sender, EventArgs e)
    {
        string b = "";
        string strManufacturer = "";
        cid = int.Parse(Session["cid"].ToString());
        sid = int.Parse(Session["sid"].ToString());
        string strBrand = null;
        string queryManufacturer = null;

        foreach (ListItem li in chkBrands.Items)
        {
            if (li.Selected == true)
            {
                b = b + li.Text + ",";
                strBrand = strBrand + "brand_name like '%" + li.Text + "%' or ";
            }
        }
        if (strBrand != "")
        {
            strBrand = strBrand.Remove(strBrand.Length - 3);
            Session["QueryBrand"] = strBrand;
        }


        b = b.Remove(b.Length - 1);
        Session["Brand"] = b;

        if(Session["Manufacturer"]!=null)
        {
            strManufacturer = Session["Manufacturer"].ToString();
            queryManufacturer = Session["QueryManufacturer"].ToString();
        }

        Response.Redirect("products.aspx?cid=" + cid + "&sid=" + sid + "&manufacturer=" + queryManufacturer + "&brand=" + strBrand + "&b=" + b + "&m=" + strManufacturer);
    }

    private void BindBikeProducts(string strBike)
    {
        ProductsBLL obj = new ProductsBLL();
        obj.Manufacturer = strBike;
        dt = obj.GetProductsByBike();
        if (dt.Rows.Count > 0)
        {
            RadListView1.Visible = true;
            RadListView1.DataSourceID = null;
            RadListView1.DataSource = dt.DefaultView;
            RadListView1.DataBind();


            RadListView2.Visible = true;
            RadListView2.DataSourceID = null;
            RadListView2.DataSource = dt.DefaultView;
            RadListView2.DataBind();

            if (Session["View"] != null)
            {
                string view = Session["View"].ToString();
                if (view == "Grid")
                {
                    lnkBtnGridView.CssClass = "active";
                    RadListView1.Visible = true;
                    RadListView2.Visible = false;
                }
                else
                {
                    lnkBtnListView.CssClass = "active";
                    RadListView1.Visible = false;
                    RadListView2.Visible = true;
                }
            }
            else
            {
                Session["View"] = "Grid";
                lnkBtnGridView.CssClass = "active";
                RadListView1.Visible = true;
                RadListView2.Visible = false;
            }
        }
        else
        {
            Session["View"] = "Grid";
            lnkBtnGridView.CssClass = "active";
            RadListView1.Visible = false;
            RadListView2.Visible = false;
            lblMsg.Text = "There are no items to be displayed.";
        }
    }

    private void BindProductsByZia(int cid, int sid, string manufacturer, string brand, string sort)
    {
        string[] man;
        string[] brnd;
        try
        {
            chkManufacturer.DataSourceID = "dsManufacturers";
            chkManufacturer.DataBind();

            chkBrands.DataSourceID = "dsBrands";
            chkBrands.DataBind();

            // bind sorting

            string ss = Session["Sort"].ToString();
            ddlSort.SelectedIndex = int.Parse(ss);


            if (manufacturer != null)
            {
                try
                {
                    man = Session["Manufacturer"].ToString().Split(',');
                }
                catch
                {
                    man = Request.QueryString["m"].ToString().Split(',');
                }

                for (int i = 0; i <= man.Length - 1; i++)
                {
                    foreach (ListItem li in chkManufacturer.Items)
                    {

                        if (man[i] == li.Text)
                        {
                            li.Selected = true;
                        }
                    }
                }
            }


            if (brand != null)
            {

                try
                {
                    brnd = Session["Brand"].ToString().Split(',');
                }
                catch
                {
                    brnd = Request.QueryString["b"].ToString().Split(',');
                }

                for (int j = 0; j <= brnd.Length - 1; j++)
                {
                    foreach (ListItem li in chkBrands.Items)
                    {

                        if (brnd[j] == li.Text)
                        {
                            li.Selected = true;
                        }
                    }
                }
            }

            DataTable dt = new DataTable();
            DBconnection obj = new DBconnection();

            obj.SetCommandQry = "select * from View_ProductsWithPromotions where cid=" + cid + " and sid=" + sid + " " + sort + "";

            if (manufacturer != null)
            {
                obj.SetCommandQry = "select * from View_ProductsWithPromotions where cid=" + cid + " and sid=" + sid + " and (" + manufacturer + ") " + sort + "";
            }

            if (brand != null)
            {
                obj.SetCommandQry = "select * from View_ProductsWithPromotions where cid=" + cid + " and sid=" + sid + " and brand_name=" + brand + " ";
            }

            if (manufacturer!= null && brand!= null)
            {
                //obj.SetCommandQry = "select * from View_ProductsWithPromotions where cid=" + cid + " and sid=" + sid + " and manufacturer_name=" + manufacturer + " and brand_name = " + brand + " ";
                obj.SetCommandQry = "select * from View_ProductsWithPromotions where cid=" + cid + " and sid=" + sid + " and (" + manufacturer + ") and (" + brand + ")  " + sort + "";
            }

            // obj.SetCommandQry = "select * from View_ProductsWithPromotions where  " + ids + " and (" + strManufacturer + ") and (" + strBrands + ")  " + sortField + "";


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
                //RadListView1.Visible = true;
                RadListView1.DataSourceID = null;
                RadListView1.DataSource = dt;
                RadListView1.DataBind();

                //RadListView2.Visible = true;
                RadListView2.DataSourceID = null;
                RadListView2.DataSource = dt;
                RadListView2.DataBind();

                if (Session["View"] != null)
                {
                    string view = Session["View"].ToString();
                    if (view == "Grid")
                    {
                        lnkBtnGridView.CssClass = "active";
                        RadListView1.Visible = true;
                        RadListView2.Visible = false;
                    }
                    else
                    {
                        lnkBtnListView.CssClass = "active";
                        RadListView1.Visible = false;
                        RadListView2.Visible = true;
                    }
                }
                else
                {
                    Session["View"] = "Grid";
                    lnkBtnGridView.CssClass = "active";
                    RadListView1.Visible = true;
                    RadListView2.Visible = false;
                }
            }
            else
            {
                Session["View"] = "Grid";
                lnkBtnGridView.CssClass = "active";
                RadListView1.Visible = false;
                RadListView2.Visible = false;
                //RadDataPager1.Visible = false;
                lblMsg.Text = "There are no items to be displayed.";
            }


     


        }
        catch (Exception ex)
        {
            //int cid = int.Parse(Request.QueryString["cid"].ToString());
            //BindProductsByCatId(cid);
        }
    }

    protected void lnkBtnGridView_Click(object sender, EventArgs e)
    {
        lnkBtnGridView.CssClass = "active";
        lnkBtnListView.CssClass = " ";
        RadListView1.Visible = true;
        RadListView2.Visible = false;

        Session["View"] = "Grid";
    }

    protected void lnkBtnListView_Click(object sender, EventArgs e)
    {
        lnkBtnListView.CssClass = "active";
        lnkBtnGridView.CssClass = " ";
        RadListView1.Visible = false;
        RadListView2.Visible = true;

        Session["View"] = "List";
    }
}