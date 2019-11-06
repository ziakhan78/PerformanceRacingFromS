using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_store_sales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            lblHeading.Text = "Store Sales";
            if (Request.QueryString["pid"] != null)
            {
                int pid = Int32.Parse(Request.QueryString["pid"].ToString());
                AddtoCart(pid);
            }
            AddtoCart(67);
        }
    }
    private void AddtoCart(int pid)
    {
        string cartid = "";

        if (Session["CartID"] == null || Session["CartID"].ToString() == "0")
        {
            cartid = CreateCart();
            Session["CartID"] = cartid;
        }
        else
        {
            cartid = Session["CartID"].ToString();
        }        

        AddProductTocart(pid, cartid);
        
    }
    private string CreateCart()
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_CreateCart";
        //int exe = obj.ExecuteNonQuery();

        string ss = obj.ExecuteScalar().ToString();
        return ss;
    }
    private void AddProductTocart(int pid, string cartid)
    {
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
            //proQuantity = 1;//Int32.Parse(dt.Rows[0]["quantity"].ToString());

            //try { proQuantity = int.Parse(txtQuantity.Text.Trim()); }
            //catch { proQuantity = 1; }

            //try { proQuantity = int.Parse(ddlQty.SelectedValue.ToString()); }
            //catch { proQuantity = 1; }

            proQuantity = 1;

            if (Request.QueryString["dis_price"] != null)
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
        }

        DBconnection obj1 = new DBconnection();
        obj1.SetCommandSP = "sc_InsertIntoCart";
        obj1.AddParam("@pid", pid);
        obj1.AddParam("@CartID", cartid);
        obj1.AddParam("@Quantity", proQuantity);
        obj1.AddParam("@price", price);
        obj1.AddParam("@ActualQty", actQty - 1);

        int exe = obj1.ExecuteNonQuery();

        if (exe > 0)
        {
            // Session["ProPid"] = null;
            // Response.Redirect("cart/viewcart.aspx");

            UpdateFinalCart(cartid);
            GetfromCart(cartid);
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

    protected void ddlQty_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;
        GridViewRow row = (GridViewRow)ddl.NamingContainer;

        if (row != null)
        {

            string strQty = ((DropDownList)(row.FindControl("ddlQty"))).SelectedValue;


            Label lblPrice = row.FindControl("lblPrice") as Label;
            Label lblId = row.FindControl("lblId") as Label;



            int quantity = int.Parse(strQty.ToString());
            int id = int.Parse(lblId.Text.ToString());

            float price = float.Parse(lblPrice.Text.ToString());
            //float totalprice = quantity * price;
            string cartID = Session["CartID"].ToString();


            if (Session["did"] != null)
            {
                // Check Dealer Credit limit and Credit balance

                int did = int.Parse(Session["did"].ToString());
                float creditBalance = 0;
                creditBalance = CheckDealerCreditBalance(did);
                if (creditBalance < (price * quantity))
                {
                    string jv = "<script>alert('Your Credit Limit Is Low to Purchase This Product.');</script>";
                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                    return;
                }
            }



            UpdateCart(quantity, 1, price, cartID, id.ToString());

            UpdateFinalCart(cartID);
            GetfromCart(cartID);
            //Response.Redirect("viewcart.aspx");

        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
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
                // Response.Redirect("viewcart.aspx");

                //string cartid = Session["CartID"].ToString();
                //GetfromCart(cartid);

                GetfromCart(cartID);
            }
        }

        if (e.CommandName == "Update")
        {
            GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
            TextBox txtQ = row.FindControl("txtQ") as TextBox;
            Label lblPrice = row.FindControl("lblPrice") as Label;
            int i = Convert.ToInt32(e.CommandArgument.ToString());

            if (txtQ.Text != null)
            {
                int quantity = int.Parse(txtQ.Text.ToString());
                float price = float.Parse(lblPrice.Text.ToString());
                //float totalprice = quantity * price;
                string cartID = Session["CartID"].ToString();

                UpdateCart(quantity, 1, price, cartID, i.ToString());

                UpdateFinalCart(cartID);
                GetfromCart(cartID);
                //Response.Redirect("viewcart.aspx");

            }
        }
    }

    private void GetfromCart(string cartid)
    {
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "sc_GetProductsByCartid2";
        obj.AddParam("@cartid", cartid);
        DataTable dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            //lblOrderNo.Text = "Order No. : " + dt.Rows[0]["OrderNo"].ToString();
            //lblSubTotal.Text = "&#8377; " + dt.Rows[0]["SubTotal"].ToString();
            //lblGrandTotal.Text = "&#8377; " + dt.Rows[0]["TotalAmount"].ToString();

            decimal subTotal, taxTotal, shippingTotal, totalAmt = 0;
            subTotal = Convert.ToDecimal(dt.Rows[0]["SubTotal"].ToString());
            taxTotal = Convert.ToDecimal(dt.Rows[0]["TaxTotal"].ToString());
            shippingTotal = Convert.ToDecimal(dt.Rows[0]["ShippingTotal"].ToString());
            totalAmt = Convert.ToDecimal(dt.Rows[0]["TotalAmount"].ToString());

            lblSubTotal.Text = "&#8377; " + string.Format("{0:n0}", subTotal);
            lblShippingTotal.Text = "&#8377; " + string.Format("{0:n0}", shippingTotal);
            lblGrandTotal.Text = "&#8377; " + string.Format("{0:n0}", totalAmt);
            lblSubTotal1.Text = dt.Rows[0]["SubTotal"].ToString();


            //lblSubTotal.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["SubTotal"].ToString()).ToString("n");
            //lblTax.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TaxTotal"].ToString()).ToString("n");
            //lblShippingTotal.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["ShippingTotal"].ToString()).ToString("n");
            //lblGrandTotal.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");
            //lblGrossAmount.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");
            //lblGrossAmount1.Text = Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");

            imgEmptcart.Visible = false;
            emptycart.Visible = true;

            GridView1.Visible = true;
          

            GridView1.DataSource = dt;
            GridView1.DataBind();

            decimal subTotalAmt = decimal.Parse(dt.Rows[0]["TotalAmount"].ToString());

            decimal shippAmt = GetShippingAmount("Standard", Convert.ToDecimal(dt.Rows[0]["TotalAmount"].ToString().Trim()));
            if (shippAmt != 0)
            {
                decimal couponDisAmt = 0;
                lblShippingTotal.Text = "&#8377; " + string.Format("{0:F2}", shippAmt);
                decimal finalGrossAmt = subTotalAmt + shippAmt;
                //lblGrossAmount.Text = "&#8377; " + finalGrossAmt.ToString();

                try
                {
                    couponDisAmt = Convert.ToDecimal(dt.Rows[0]["CouponDiscount"].ToString());
                }
                catch { couponDisAmt = 0; }


                lblGrandTotal.Text = "&#8377; " + (finalGrossAmt - couponDisAmt).ToString();
            }
            else
            {
                lblShippingTotal.Text = "&#8377; " + string.Format("{0:F2}", shippAmt);
            }



        }
        else
        {
            emptycart.Visible = false;
            Session["Promotional"] = null;

            GridView1.Visible = false;
          

            imgEmptcart.Visible = true;

            lblEmptyCart.Text = "Their is no item in your cart";
        }
    }
    private void UpdateCart(int quantity, int proQuantity, float price, string cartID, string lblRid)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_UpdateCart";
        obj.AddParam("@Quantity", quantity);
        obj.AddParam("@ActualQty", proQuantity - quantity);
        obj.AddParam("@price", price);
        obj.AddParam("@CartID", cartID);
        obj.AddParam("@RecordID", lblRid);

        int exe = obj.ExecuteNonQuery();

    }
    private void DeleteCart(string cartID, string lblRid)
    {
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "sc_DeleteCart";

        obj.AddParam("@CartID", cartID);
        obj.AddParam("@RecordID", lblRid);


        int exe = obj.ExecuteNonQuery();

    }

    private decimal GetShippingAmount(string shipMethod, decimal totalAmt)
    {
        decimal shippingAmt = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetShippingCharge";
        obj.AddParam("@shipping_type", shipMethod);
        obj.AddParam("@totalAmt", totalAmt);

        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            shippingAmt = Convert.ToDecimal(dt.Rows[0]["shipping_charge1"].ToString());
        }

        return shippingAmt;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Label lblImgPath = (Label)e.Row.FindControl("lblImgPath");
        Label lblPrice = (Label)e.Row.FindControl("lblPrice");

        if (lblImgPath != null)
        {
            string strImgPath = lblImgPath.Text;
            Image img1 = (Image)e.Row.FindControl("img1");

            string[] strImages = strImgPath.Split(',');
            Array.Sort(strImages);
            img1.Visible = true;
            img1.ImageUrl = "../ProductsImages/" + strImages[0].ToString();
        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {



            Label lblQty = (e.Row.FindControl("lblQty") as Label);
            DropDownList ddlQty = (e.Row.FindControl("ddlQty") as DropDownList);

            ddlQty.SelectedValue = lblQty.Text;
            ddlQty.SelectedItem.Text = lblQty.Text;
        }
    }
  

    private void UpdateFinalCart(string cartid)
    {
        float subTotal = CalculateSubTotal(cartid);

        //string shippAmount = GetShippingAmt(countryID);         //Get Country Wise Shipping Amount
        //float ShippingAmt = float.Parse(shippAmount);
        //float ShippingAmt = 10;
        float shippingAmt = 0;

        //string staTax = getStateTax(ststeID);                   // Get State Wise Tax
        // string staTax = "4.25";
        string staTax = "0";
        if (staTax != null)
        {
            float taxTotal = (subTotal * float.Parse(staTax) / 100);
            float totalAmount = (shippingAmt + subTotal + taxTotal);

            if (Session["CustomerID"] != null)
            {
                UpdateCart(subTotal, shippingAmt, taxTotal, totalAmount, int.Parse(Session["CustomerID"].ToString()));
            }
            else if (Session["did"] != null)
            {
                UpdateDealerCart(subTotal, shippingAmt, taxTotal, totalAmount, int.Parse(Session["did"].ToString()));
            }
            else
            {
                UpdateCart1(cartid, subTotal, shippingAmt, taxTotal, totalAmount);
            }
        }
    }

    private float CalculateSubTotal(string cartID)
    {
        float subTotal = 0;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetsubTotalfromCart";
        obj.AddParam("@CartID", cartID);

        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                subTotal += float.Parse(row["Quantity"].ToString()) * float.Parse(row["Price"].ToString());
            }
        }

        return subTotal;

    }
    private void UpdateCart1(string cartid, float subTotal, float shippingAmt, float taxTotal, float totalAmount)
    {
        /************Code for find IP address of user's machine**********/
        string ipaddress;
        ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (ipaddress == "" || ipaddress == null)
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        /***************************************************************/

        DBconnection obj1 = new DBconnection();
        obj1.SetCommandSP = "sc_UpdateFinalCart2";
        obj1.AddParam("@CartID", cartid);
        obj1.AddParam("@SubTotal", subTotal);
        obj1.AddParam("@ShippingAmt", shippingAmt);
        obj1.AddParam("@TaxTotal", taxTotal);
        obj1.AddParam("@TotalAmount", totalAmount);
        obj1.AddParam("@IpAddress", ipaddress);
        obj1.AddParam("@OrderFrom", "Store");
        obj1.AddParam("@AdminUser", Session["AdminUserName"].ToString());

        int exe = obj1.ExecuteNonQuery();
    }
    private void UpdateCart(float subTotal, float shippingAmt, float taxTotal, float totalAmount, int custId)
    {
        /************Code for find IP address of user's machine**********/
        string ipaddress;
        ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (ipaddress == "" || ipaddress == null)
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        /***************************************************************/

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_updateFinalCart";
        obj.AddParam("@CartID", Session["CartID"].ToString());
        obj.AddParam("@SubTotal", subTotal);
        obj.AddParam("@ShippingAmt", shippingAmt);
        obj.AddParam("@TaxTotal", taxTotal);
        obj.AddParam("@TotalAmount", totalAmount);
        obj.AddParam("@Cust_Id", custId);
        obj.AddParam("@IpAddress", ipaddress);
        obj.AddParam("@OrderFrom", "Store");

        int exe = obj.ExecuteNonQuery();
    }

    private void UpdateDealerCart(float subTotal, float shippingAmt, float taxTotal, float totalAmount, int dealerId)
    {
        /************Code for find IP address of user's machine**********/
        string ipaddress;
        ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (ipaddress == "" || ipaddress == null)
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        /***************************************************************/

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_updateDealerFinalCart";
        obj.AddParam("@CartID", Session["CartID"].ToString());
        obj.AddParam("@SubTotal", subTotal);
        obj.AddParam("@ShippingAmt", shippingAmt);
        obj.AddParam("@TaxTotal", taxTotal);
        obj.AddParam("@TotalAmount", totalAmount);
        obj.AddParam("@Dealer_Id", dealerId);
        obj.AddParam("@IpAddress", ipaddress);

        int exe = obj.ExecuteNonQuery();
    }
}