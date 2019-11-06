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

public partial class bargain_basement : System.Web.UI.Page
{
    DataTable dt;
    ProductsBLL obj = new ProductsBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            BindBargainProducts();
        }
    }

    private void BindBargainProducts()
    {
        ProductsBLL obj = new ProductsBLL();
        dt = obj.GetAllBargainProducts();
        if (dt.Rows.Count > 0)
        {
            RadListView1.Visible = true;         

            RadListView1.DataSourceID = null;
            RadListView1.DataSource = dt.DefaultView;
            RadListView1.DataBind();
        }
        else
        {
            RadListView1.Visible = false;
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
                img1.ImageUrl = "../BargainProductsImages/" + strImages[0].ToString();
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
                lblPrice.Text = price;//String.Format("<del>{0}</del>", myPrice.ToString("c"));
                lblDisPrice.Text = "&#8377; " + disPrice;
            }
            else
            {
                price = lblPrice.Text.ToString();
                // disPrice = lblDisPrice.ToString();
                lblPrice.Text = price;
                // lblDisPrice.Text = string.Format("{0:F2}", disPrice);
                lblPrice.Font.Strikeout = false;
            }
        }
        catch { }

    }
   
    protected void lnkShowAll_Click(object sender, EventArgs e)
    {
        // chkPriceList.ClearSelection();
        // chkOccasion.ClearSelection();
        RadListView1.DataSourceID = null;
        RadListView1.DataSourceID = "dsProducts";
        RadListView1.DataBind();
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
                    strBrands = strBrands + "brands like '%" + li.Text + "%' or ";
                }
            }


            //int sid = int.Parse(Request.QueryString["cid"].ToString());

            DataTable dt = new DataTable();
            DBconnection obj = new DBconnection();


            if (chkManufacturer.SelectedIndex == -1)
            {
                obj.SetCommandQry = "select * from View_ProductsWithPromotions ORDER BY selling_price " + sortField + "";
            }

            if (chkBrands.SelectedIndex == -1)
            {
                obj.SetCommandQry = "select * from View_ProductsWithPromotions ORDER BY selling_price " + sortField + "";
            }

            if (chkManufacturer.SelectedIndex != -1 && chkBrands.SelectedIndex != -1)
            {
                obj.SetCommandQry = "select * from View_ProductsWithPromotions where  (" + strManufacturer + ") and (" + strBrands + ") ORDER BY selling_price " + sortField + "";
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
        catch { }
    }
    protected void RadListView1_PageIndexChanged(object sender, RadListViewPageChangedEventArgs e)
    {
       
    }

}