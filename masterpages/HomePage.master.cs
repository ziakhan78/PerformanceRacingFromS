using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

public partial class masterpages_HomePage : System.Web.UI.MasterPage
{
    CultureInfo cInfo = new CultureInfo("hi-IN");
    protected void Page_Load(object sender, EventArgs e)
    {
        //string pageName = this.ContentPlaceHolder1.Page.GetType().FullName;

        string cartid = "";
        //emptyCart.Visible = true;
       // btnViewCart.Visible = false;
       // btnChecout.Visible = false;
        if (Session["CustomerID"] != null)
        {
            int customerId = int.Parse(Session["CustomerID"].ToString());
            GetYourWishListQuantity(customerId);
        }
        if(Session["UserType"]!=null)
        {
            string userType = Session["UserType"].ToString();
            if (userType=="Dealer")
            {
                btnlogout.Visible = false;
                btnLogin.Visible = false;
                btnDealersLogin.Visible = false;
                btnDealersLogout.Visible = true;
            }
            else
            {
                btnlogout.Visible = true;
                btnLogin.Visible = false;
                btnDealersLogin.Visible = false;
                btnDealersLogout.Visible = false;
            }
        }
        else
        {
            btnlogout.Visible = false;
            btnLogin.Visible = true;
            btnDealersLogin.Visible = true;
            btnDealersLogout.Visible = false;
        }
       
       
        // btnRegis.Visible = true;
        try
        {
            if (Session["uname"] != null)
            {
                btnlogout.Visible = true;
                btnLogin.Visible = false;
                // btnRegis.Visible = false;
                lblUsername.Text = "<i class='fa fa-user'></i> Welcome : " + Session["uname"].ToString();
            }

            cartid = Session["CartID"].ToString();
            GetViewcartQuantity(cartid);
            GetfromCart(cartid);
        }
        catch
        {
            lblItems.Text = "0";
            //lblPrice.Text = "0";
        }

        try
        {
            if (Session["DealerName"] != null)
            {
                


                btnDealersLogout.Visible = true;
                btnDealersLogin.Visible = false;
                lblDealer.Visible = true;
                lblDealer.Text = "<i class='fa fa-user'></i> Welcome : " + Session["DealerName"].ToString();
            }

          
        }
        catch
        {
          
        }


    }

    protected void btnRegis_Click(object sender, EventArgs e)
    {
        Response.Redirect("../cart/registration.aspx");
    }
    protected void btnViewCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("../cart/viewcart.aspx");
    }
    private void GetViewcartQuantity(string cartid)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetQtyByCartid";
        obj.AddParam("@cartid", cartid);

        DataTable dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblItems.Text = dt.Rows[0]["Column1"].ToString();
            // lblPrice.Text = Convert.ToDouble(dt.Rows[0]["Column2"].ToString()).ToString("n");
        }
        else
        {
            lblItems.Text = "0";
            // lblPrice.Text = "0";
        }

    }



    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Redirect("search.aspx?search=" + txtSearch.Text.Trim().ToString());
    }

    private void GetYourWishListQuantity(int customerId)
    {
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
    protected void btnlogout_Click(object sender, EventArgs e)
    {

        Session.Abandon();
        try
        {
            Response.Redirect("~/cart/login.aspx");
        }
        catch { }
    }
    protected void GridView1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string cartID = Session["CartID"].ToString();

            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "sc_DeleteCart";
            obj.AddParam("@CartID", cartID);
            obj.AddParam("@RecordID", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                //Response.Redirect("ViewCart.aspx");
                string cartid = Session["CartID"].ToString();
                GetViewcartQuantity(cartid);
                GetfromCart(cartid);
            }
        }
    }

    protected void GridView1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
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
    }

    private void GetfromCart(string cartid)
    {
        NumberFormatInfo nfi = CultureInfo.CurrentCulture.NumberFormat;
        nfi = (NumberFormatInfo)nfi.Clone();

        DBconnection obj = new DBconnection();
        //if (Session["Promotional"] != null)
        //{
        //    obj.SetCommandSP = "sc_GetProductsfromPromotion";
        //}
        //else
        //{
        obj.SetCommandSP = "sc_GetProductsByCartid2";
        // }
        obj.AddParam("@cartid", cartid);

        DataTable dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

           // btnViewCart.Visible = true;
           // btnChecout.Visible = true;
          //  emptyCart.Visible = false;

         

            decimal subTotal = 0;
            subTotal = Convert.ToDecimal(dt.Rows[0]["SubTotal"].ToString());
           // lblSubTotal.Text = " &#8377; " + string.Format("{0:n0}", subTotal);
            lblSubTotal.Text = Convert.ToDecimal(subTotal).ToString("C0", cInfo);
          

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
           // emptyCart.Visible = true;
          //  btnViewCart.Visible = false;
          //  btnChecout.Visible = false;

            // lblEmptyCart.Text = "Their is no item in your cart";
        }
    }

   

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int cid = int.Parse(ddlCategory.SelectedValue.ToString());
        //Response.Redirect("~/products.aspx?cid=" + cid);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string searchValue = txtSearch.Text.Trim().ToString();
        Session["Searchvalue"] = searchValue;
        Response.Redirect("~/search_products.aspx");
    }
    protected void ddlManufacturers_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int cid = int.Parse(ddlManufacturers.SelectedValue.ToString());
        string cid = ddlManufacturers.SelectedItem.Text.ToString();
        Response.Redirect("~/products.aspx?dis_price&bikes=" + cid);
    }



    protected void btnDealersLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        try
        {
         

            btnDealersLogin.Visible = true;
            btnDealersLogout.Visible = false;
            lblDealer.Visible = false;

           Server.Transfer("DealersLogin.aspx");
        }
        catch { }
    }

}
