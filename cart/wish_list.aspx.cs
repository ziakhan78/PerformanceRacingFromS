using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;

public partial class cart_wish_list : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerID"] != null)
        {
            if (!IsPostBack)
            {
                int customerId = int.Parse(Session["CustomerID"].ToString());
                BindWishList(customerId);
            }
        }
        else
        {
            Response.Redirect("../cart/login.aspx");
            //showmsg("Login First!", "login.aspx");
        }
    }

    //private void BindCategory()
    //{
    //    DataTable dt = new DataTable();
    //    DBconnection obj = new DBconnection();
    //    // obj.SetCommandSP = "f_BindProducts";
    //    obj.SetCommandQry = "select * from Category_tbl order by display_order";
    //    dt = obj.ExecuteTable();
    //    if (dt.Rows.Count > 0)
    //    {
    //        DataList2.DataSource = dt;
    //        DataList2.DataBind();
    //    }
    //}

    private void BindWishList(int customerId)
    {
        try
        {
            DataTable dt = new DataTable();
            DBconnection obj = new DBconnection();
            // obj.SetCommandSP = "f_BindProducts";

            obj.SetCommandQry = "select * from View_WishList where customerId=" + customerId + " order by pid asc";


            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
            {
                //lblSubCat.Text = dt.Rows[0]["cat_name"].ToString();
                //lblCatName2.Text = dt.Rows[0]["cat_name"].ToString();

                //string img = dt.Rows[0]["cat_image"].ToString();
                // imgSubCat.Src = "CategoryImages/" + img;

                GridView1.DataSourceID = string.Empty;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSourceID = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();
                
            }
        }
        catch(Exception ex) { }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteFromWishList";
            obj.AddParam("@wid", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                Response.Redirect("wish_list.aspx");
                //int customerId = int.Parse(Session["CustomerID"].ToString());
                //BindWishList(customerId);
               // GetYourWishListQuantity(customerId);
            }
        }

        //TextBox txtQ = (TextBox)GridView1.FindControl("txtQ");

        //if (txtQ.Text != null)
        //{
        //    int quant = int.Parse(txtQ.Text.ToString());
        //    CheckProductQuantity(quant);
        //}

    }

    private void GetYourWishListQuantity(int customerId)
    {
        Label lblWistListQty = (Label)Master.FindControl("lblWistListQty");

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetWishListQtyByCustomerId";
        obj.AddParam("@customerId", customerId);

        DataTable dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblWistListQty.Text = "(" + dt.Rows[0]["qty"].ToString() + ")";
        }
        else
        {
            lblWistListQty.Text = "";
        }
    }
    //protected void RadListView1_ItemDataBound(object sender, RadListViewItemEventArgs e)
    //{
    //    try
    //    {
    //        // RadDataPager1.Visible = (RadDataPager1.PageSize < RadDataPager1.TotalRowCount);
    //        RadDataPager pager = (RadDataPager)RadListView1.FindControl("RadDataPager2");
    //        pager.Visible = (pager.PageSize < pager.TotalRowCount);
    //    }
    //    catch { }

    //    string price = "";
    //    string disPrice = "";
    //    Label lblPrice = (Label)e.Item.FindControl("lblPrice");
    //    Label lblDisPrice = (Label)e.Item.FindControl("lblDisPrice");

    //    if (lblDisPrice.Text != "")
    //    {
    //        lblPrice.Font.Strikeout = true;
    //        price = lblPrice.Text.ToString();
    //        disPrice = lblDisPrice.Text.ToString();
    //        lblPrice.Text = "&#8377; " + string.Format("{0:F2}", price);
    //        lblDisPrice.Text = "&#8377; " + string.Format("{0:F2}", disPrice);
    //    }
    //    else
    //    {
    //        price = lblPrice.Text.ToString();
    //        // disPrice = lblDisPrice.ToString();
    //        lblPrice.Text = "&#8377; " + string.Format("{0:F2}", price);
    //        // lblDisPrice.Text = string.Format("{0:F2}", disPrice);
    //        lblPrice.Font.Strikeout = false;
    //    }
    //}
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
    protected void RadListView1_ItemDeleted(object sender, RadListViewDeletedEventArgs e)
    {
        // Label wid = (Label)e.Item.FindControl("");
    }
    //protected void RadListView1_ItemCommand(object sender, RadListViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "Delete")
    //    {
    //        string i = e.CommandArgument.ToString();
    //        int id = int.Parse(i.ToString());
    //        DBconnection obj = new DBconnection();
    //        obj.SetCommandSP = "z_DeleteFromWishList";
    //        obj.AddParam("@wid", id);
    //        if (obj.ExecuteNonQuery() > 0)
    //        {
    //            int customerId = int.Parse(Session["CustomerID"].ToString());
    //            BindWishList(customerId);
    //        }
    //    }
    //}
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

      
        Label lblColor = (Label)e.Row.FindControl("lblColor");

        if (lblColor != null)
        {
            lblColor.Text = "<br />Color: <b><i>" + lblColor.Text + "</i></b>";
        }



        Label lblSize = (Label)e.Row.FindControl("lblSize");
        if (lblSize != null)
        {
            lblSize.Text = "<br />Size: <b><i>" + lblSize.Text + "</i></b>";
        }


        Label lblImgPath = (Label)e.Row.FindControl("lblImgPath");
        if (lblImgPath != null)
        {
            string strImgPath = lblImgPath.Text;
            Image img1 = (Image)e.Row.FindControl("img1");

            string[] strImages = strImgPath.Split(',');

            Array.Sort(strImages);

            //for (int i = 0; i <= strImages.Length - 1; i++)
            //{
            img1.Visible = true;
            img1.ImageUrl = "../ProductsImages/" + strImages[0].ToString();
            // }
        }
    }


}