using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.IO;
using System.Net;
using System.Text;

public partial class cart_viewcart : System.Web.UI.Page
{
    string cartid = "";
    private void Page_Load(object sender, System.EventArgs e)
    {

        if (!IsPostBack)
        {            
            //lblAlreadyDiscount.Visible = false;
            lblDiscountAmtText.Text = "";

            try
            {
                emptycart.Visible = true;
                imgEmptcart.Visible = false;
                cartid = Session["CartID"].ToString();
                UpdateFinalCart(cartid);
                GetfromCart(cartid);
            }

            catch(Exception ex)
            {
                emptycart.Visible = false;
                GridView1.Visible = false;
                //btnUpdateCart.Visible = false;
                btnChkOut.Visible = false;
                btnContShopping.Visible = false;
                btnContShopping.Visible = false;
                imgEmptcart.Visible = true;
                lblEmptyCart.Text = "Their is no item in your cart";
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
            // lblOrderNo.Text = "Order No. : " + dt.Rows[0]["OrderNo"].ToString();
            //lblSubTotal.Text = "&#8377; " + dt.Rows[0]["SubTotal"].ToString();
            //lblGrandTotal.Text = "&#8377; " + dt.Rows[0]["TotalAmount"].ToString();

            decimal shippingTotal, totalAmt = 0;
            double subTotal = 0;
            double taxAmt = 0;
            try
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    subTotal = subTotal + Convert.ToDouble(dt.Rows[i]["SubTotal"].ToString());
                    lblSubTotal.Text = subTotal.ToString("n");
                }
            }
            catch { lblSubTotal.Text = "0"; }

            try
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    taxAmt = taxAmt + Convert.ToDouble(dt.Rows[i]["IGSTAmt"].ToString());
                    lblTax.Text = taxAmt.ToString("n");
                }
            }
            catch { lblTax.Text = "0"; }


            //subTotal = Convert.ToDecimal(dt.Rows[0]["SubTotal1"].ToString());
           // taxTotal = Convert.ToDecimal(dt.Rows[0]["IGSTAmt"].ToString());
            shippingTotal = Convert.ToDecimal(dt.Rows[0]["ShippingTotal"].ToString());

            totalAmt = Convert.ToDecimal(dt.Rows[0]["TotalAmount"].ToString());
            // totalAmt = Convert.ToDecimal(dt.Rows[0]["SubTotal1"].ToString());

            //lblSubTotal.Text = "&#8377;" + string.Format("{0:n}", subTotal);
            //lblShippingTotal.Text = "&#8377; " + string.Format("{0:n0}", shippingTotal);
            lblGrandTotal.Text = "&#8377;" + string.Format("{0:n0}", totalAmt);
            lblSubTotal1.Text = dt.Rows[0]["SubTotal"].ToString();

            //lblTax.Text = "&#8377;" + Convert.ToDouble(taxTotal).ToString("n");
            //lblSubTotal.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["SubTotal"].ToString()).ToString("n");
            ////lblTax.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TaxTotal"].ToString()).ToString("n");
            //lblShippingTotal.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["ShippingTotal"].ToString()).ToString("n");
            //lblGrandTotal.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");
            ////lblGrossAmount.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");
            ////lblGrossAmount1.Text = Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");

            imgEmptcart.Visible = false;
            emptycart.Visible = true;

            GridView1.Visible = true;
            btnChkOut.Visible = true;
            // btnUpdateCart.Visible = true;
            btnContShopping.Visible = true;
            btnContShopping.Visible = true;

            GridView1.DataSource = dt;
            GridView1.DataBind();

            GridView2.DataSource = dt;
            GridView2.DataBind();

            decimal subTotalAmt = decimal.Parse(dt.Rows[0]["TotalAmount"].ToString());

            //decimal shippAmt = GetShippingAmount("Standard", Convert.ToDecimal(dt.Rows[0]["TotalAmount"].ToString().Trim()));
            //if (shippAmt != 0)
            //{
            //    decimal couponDisAmt = 0;
            //    lblShippingTotal.Text = "&#8377; " + string.Format("{0:F2}", shippAmt);
            //    decimal finalGrossAmt = subTotalAmt + shippAmt;
            //    //lblGrossAmount.Text = "&#8377; " + finalGrossAmt.ToString();

            //    try
            //    {
            //        couponDisAmt = Convert.ToDecimal(dt.Rows[0]["CouponDiscount"].ToString());
            //    }
            //    catch { couponDisAmt = 0; }


            //    lblGrandTotal.Text = "&#8377; " + (finalGrossAmt - couponDisAmt).ToString();
            //}
            //else
            //{
            //    lblShippingTotal.Text = "&#8377; " + string.Format("{0:F2}", shippAmt);
            //}

            if (Session["did"] != null)
            {
                btnChkOut.Visible = false;
                btnPlaceOrder.Visible = true;
            }
            else
            {
                btnChkOut.Visible = true;
                btnPlaceOrder.Visible = false;
            }

            }

        else
        {
            emptycart.Visible = false;
            Session["Promotional"] = null;

            GridView1.Visible = false;
            btnChkOut.Visible = false;
            //  btnUpdateCart.Visible = false;
            btnContShopping.Visible = false;

            imgEmptcart.Visible = true;

            lblEmptyCart.Text = "Their is no item in your cart";
        }
    }

    private void UpdateCart(int quantity, int proQuantity, float price, string cartID, string lblRid)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_UpdateCart";
        obj.AddParam("@Quantity", quantity);       
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
    //private void UpdateCart(string cartID, float subTotal)
    //{
    //    /************Code for find IP address of user's machine**********/
    //    string ipaddress;
    //    ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
    //    if (ipaddress == "" || ipaddress == null)
    //        ipaddress = Request.ServerVariables["REMOTE_ADDR"];
    //    /***************************************************************/

    //    DBconnection obj = new DBconnection();

    //    obj.SetCommandSP = "sc_UpdateCart_tbl";
    //    obj.AddParam("@Cart_Id", cartID);
    //    obj.AddParam("@SubTotal", subTotal);
    //    obj.AddParam("@IpAddress", ipaddress);

    //    int exe = obj.ExecuteNonQuery();

    //}
    private float CalculateSubTotal(string cartID)
    {
        float subTotal = 0;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        //obj.SetCommandSP = "sc_GetsubTotalfromCart";
        //obj.AddParam("@CartID", cartID);
        obj.SetCommandSP = "sc_GetProductsByCartid3";
        obj.AddParam("@cartid", cartID);

        

        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                //subTotal += float.Parse(row["Quantity"].ToString()) * float.Parse(row["Price"].ToString());
                subTotal += float.Parse(row["subTotal1"].ToString()); // For Vat
            }
        }

        return subTotal;

    }

    //private void updatecart(float ShippingTotal, float TotalAmount, int custid)
    //{
    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandSP = "sp_updateFinalCart";
    //    obj.AddParam("@CartID", Session["CartID"].ToString());
    //    obj.AddParam("@ShippingTotal", ShippingTotal);
    //    obj.AddParam("@TotalAmount", TotalAmount);
    //    obj.AddParam("@Cust_Id", custid);

    //    int exe = obj.ExecuteNonQuery();
    //}
    private int GetCustomerDetails(int custID)
    {
        int stateID = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetCustomerDetails";
        obj.AddParam("@CustID", custID);
        SqlDataReader dr = obj.ExecuteReader();

        if (dr.Read())
        {
            stateID = Int32.Parse(dr["sStateId"].ToString());
            //string state=dr["sState"].ToString();

        }
        return stateID;
    }

    //private void CheckProductQuantity(int quant)
    //{
    //    DBconnection obj1 = new DBconnection();

    //    obj1.SetCommandSP = "sc_ChkProQuantity";

    //    string quantity = obj1.ExecuteScalar().ToString();

    //    if (int.Parse(quantity) < quant)
    //    {
    //        showmsg("Product quantity should be between 1 to '" + quant + "' ");
    //    }


    //}
    public void ShowMsg(string msg)
    {
        try
        {
            //lblmsg.Visible = true;
            //lblmsg.Text = msg;
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
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
                Response.Redirect("viewcart.aspx");

                //string cartid = Session["CartID"].ToString();
                //GetfromCart(cartid);
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

                //UpdateFinalCart(cartID);
                //GetfromCart(cartID);
                Response.Redirect("viewcart.aspx");

            }
        }
    }   
    private string GetStateTax(int ststeID)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sp_GetStateTax";
        obj.AddParam("@state_id", ststeID);

        string sTax = obj.ExecuteScalar().ToString();
        return sTax;
    }
    private string GetShippingAmt(int countryID)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sp_GetShippAmt";
        obj.AddParam("@countryID", countryID);

        string shippAmt = obj.ExecuteScalar().ToString();
        return shippAmt;
    }
    private string GetSubTotal(string cartid)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetSubTotal";
        obj.AddParam("@cart_id", cartid);

        string cartid1 = obj.ExecuteScalar().ToString();
        return cartid1;
    }
    public void ShowMsg(string msg, string redirectUrl)
    {
        try
        {
            //lblmsg.Visible = true;
            // lblmsg.Text = msg;
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "window.location='" + redirectUrl + "';";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
    protected void btnContShopping_Click(object sender, EventArgs e)
    {
        Response.Redirect("../default.aspx");
    }

    //protected void btnUpdateCart_Click(object sender, EventArgs e)
    //{
    //    string cartID = Session["CartID"].ToString();
    //    foreach (GridViewRow row in GridView1.Rows)
    //    {
    //        int quantity = 0;
    //        float price;
    //        string quant = "";
    //        string lblPr = "";
    //        string lblRID = "";

    //        Label lblProName = (Label)row.FindControl("lblProName");
    //        Label lblRrcordId = (Label)row.FindControl("lblRrcordId");
    //        Label lblProQuantity = (Label)row.FindControl("lblProQuantity");
    //        Label lblCartID = (Label)row.FindControl("lblCartID");
    //        Label lblPrice = (Label)row.FindControl("lblPrice");
    //        TextBox txtqty = (TextBox)row.FindControl("txtQ");
    //        CheckBox ckdel = (CheckBox)row.FindControl("ckdel");

    //        if (txtqty.Text != null)
    //        {

    //            quant = txtqty.Text;
    //            lblPr = lblPrice.Text;
    //            lblRID = lblRrcordId.Text;


    //            //if (ckdel.Checked)
    //            //{
    //            //    DeleteCart(CartID, lblRID);
    //            //}
    //            //else
    //            //{
    //            if (quant != null)
    //            {
    //                int proquantity = Int32.Parse(lblProQuantity.Text.Trim().ToString());
    //                quantity = Int32.Parse(quant.Trim().ToString());
    //                //if (Quantity > proquantity)
    //                //{
    //                //    //Response.Write("<script language='javascript'> alert('Quantitiy should be less than the stock quantity of ' +'" + lblProName.Text + "')</script>");
    //                //    //Response.Write("<script language='javascript'> alert('Sorry, we only have '+'" + proquantity.ToString() + "' + 'of this item ('+'" + lblProName.Text + "'+')in stock'')</script>");
    //                //    // return;

    //                //    string jv = "<script>alert('Sorry, we only have ' +'" + proquantity.ToString() + "' + ' of this item ( '+'" + lblProName.Text + "'+' ) in stocks' );</script>";
    //                //    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
    //                //    return;

    //                //}
    //                //else
    //                //{
    //                price = float.Parse(lblPr.Trim().ToString());
    //                UpdateCart(quantity, proquantity, price, cartID, lblRID);

    //                //}
    //                // }
    //            }
    //        }
    //    }
    //    Response.Redirect("ViewCart.aspx");
    //}
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
            int custId = 0;
            if (Session["CustomerID"] != null)
            {
                custId = int.Parse(Session["CustomerID"].ToString());
            }

            else if (Session["did"] != null)
            {
                custId = int.Parse(Session["did"].ToString());
            }


            float taxTotal = (subTotal * float.Parse(staTax) / 100);
            float totalAmount = (shippingAmt + subTotal + taxTotal);
            if (custId != 0)
            {
                UpdateCart(subTotal, shippingAmt, taxTotal, totalAmount, custId);
            }
            else
            {
                UpdateCart1(cartid, subTotal, shippingAmt, taxTotal, totalAmount);
            }
        }
    }
    private void UpdateCart1(string cartid, float subTotal, float shippingAmt, float taxTotal, float totalAmount)
    {
        try
        {
            string orderfrom = "";
            if (Session["did"] != null)
            {
                orderfrom = "Dealer";
            }
            else
            {
                orderfrom = "Online";
            }

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
            obj1.AddParam("@OrderFrom", orderfrom);
            obj1.AddParam("@AdminUser", "Online");

            int exe = obj1.ExecuteNonQuery();
        }
        catch(Exception ex) { }
    }
    private void UpdateCart(float subTotal, float shippingAmt, float taxTotal, float totalAmount, int custId)
    {
        string orderfrom = "";
        if (Session["did"] != null)
        {
            orderfrom = "Dealer";
        }
        else
        {
            orderfrom = "Online";
        }

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
        obj.AddParam("@OrderFrom", orderfrom);
        obj.AddParam("@DealerContactId", 0);
        obj.AddParam("@AdminUser", "Online");

        int exe = obj.ExecuteNonQuery();
    }
    protected void btnChkOut_Click(object sender, EventArgs e)
    {
        // int countryID, ststeID;
        try
        {
            // --zia start code --
            ////if (Session["CustomerID"] != null)
            ////{
            ////    DataTable dt = new DataTable();
            ////    DBconnection con = new DBconnection();
            ////    con.SetCommandSP = "sc_GetCustBillAddr";
            ////    con.AddParam("@CustomerID", Session["CustomerID"]);
            ////    dt = con.ExecuteTable();
            ////    if (dt.Rows.Count > 0)
            ////    {
            ////        countryID = int.Parse(dt.Rows[0]["sCountryId"].ToString());
            ////        ststeID = int.Parse(dt.Rows[0]["sStateId"].ToString());
            ////        string cartid = Session["CartID"].ToString();
            ////        float subTotal = CalculateSubTotal(cartid);


            ////        //string shippAmount = GetShippingAmt(countryID);         //Get Country Wise Shipping Amount
            ////        //float ShippingAmt = float.Parse(shippAmount);
            ////        //float ShippingAmt = 10;
            ////        float shippingAmt = 0;

            ////        //string staTax = getStateTax(ststeID);                   // Get State Wise Tax
            ////        // string staTax = "4.25";
            ////        string staTax = "0";
            ////        if (staTax != null)
            ////        {
            ////            float taxTotal = (subTotal * float.Parse(staTax) / 100);
            ////            float totalAmount = (shippingAmt + subTotal + taxTotal);
            ////            UpdateCart(subTotal, shippingAmt, taxTotal, totalAmount, int.Parse(Session["CustomerID"].ToString()));
            ////        }
            ////    }
            ////}

            ////else
            ////{
            ////    try
            ////    {
            ////        string cartid2 = Session["CartID"].ToString();
            ////        float stotal2 = CalculateSubTotal(cartid2);
            ////        UpdateCart(cartid2, stotal2);
            ////    }
            ////    catch { }
            ////}
            // --zia end code --



            //string cartid2 = Session["CartID"].ToString();
            //float stotal2 = calculateSubTotal(cartid2);
            //UpdateCart(cartid2, stotal2);

            if (Session["CustomerID"] != null)
            {
                Response.Redirect("order_summary.aspx");
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
        catch { }
    }
    //protected void btnCoupon_Click(object sender, EventArgs e)
    //{
    //    bool b = IsCouponValid(txtCouponCode.Text.Trim());

    //    if (b == true)
    //    {
    //        lblAlreadyDiscount.Visible = false;

    //        string coupon_no = txtCouponCode.Text.Trim().ToString();
    //        //decimal cart_total_amt = decimal.Parse(lblSubTotal.Text.Trim().ToString());
    //        decimal cart_total_amt = decimal.Parse(lblSubTotal1.Text.Trim().ToString());
    //        decimal descount_amt = GetDiscountValue(coupon_no, cart_total_amt);

    //        if (descount_amt != 0)
    //        {
    //            // divCoupon.Visible = true;
    //            lblDiscountAmtText.Text = "Discount Amount:";

    //            lblDiscountAmt.Text = "&#8377; " + string.Format("{0:n}", descount_amt);
    //            lblGrandTotal.Text = "&#8377; " + string.Format("{0:n}", cart_total_amt - descount_amt);

    //            UpdateCouponDiscountOnCartTbl(descount_amt);
    //        }
    //        else
    //        {
    //            //divCoupon.Visible = false;
    //            lblDiscountAmtText.Text = "";
    //        }

    //    }
    //    else
    //    {
    //        // divCoupon.Visible = false;
    //        lblAlreadyDiscount.Visible = true;
    //    }
    //}
    private void UpdateCouponDiscountOnCartTbl(decimal CouponDisAmt)
    {
        try
        {

            cartid = Session["CartID"].ToString();
            int Cust_Id = int.Parse(Session["CustomerID"].ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "sc_UpdateCouponDiscountCartTbl";
            obj.AddParam("@Cart_Id", cartid);
            obj.AddParam("@Cust_Id", Cust_Id);
            obj.AddParam("@CouponDiscount", CouponDisAmt);
            int exe = obj.ExecuteNonQuery();
        }
        catch { }
    }
    private bool IsCouponValid(string couponNo)
    {
        bool b = false;

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_IsValidCoupon";
        obj.AddParam("@coupon_no", couponNo);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            b = true;
        }
        return b;
    }
    private decimal GetDiscountValue(string coupon_no, decimal cart_total_amt)
    {
        decimal discount_price = 0;

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetDiscountCoupon";
        obj.AddParam("@coupon_no", coupon_no.ToString());
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            string mode = dt.Rows[0]["price_change_mode"].ToString();

            if (mode == "Percentage")
            {
                decimal percentage = decimal.Parse(dt.Rows[0]["percentage"].ToString());
                discount_price = cart_total_amt * percentage / 100;
            }
            if (mode == "Amount")
            {
                discount_price = decimal.Parse(dt.Rows[0]["price"].ToString());
            }
        }
        return discount_price;
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
    protected void ddlQty_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        DropDownList ddl = (DropDownList)sender;
        GridViewRow row = (GridViewRow)ddl.NamingContainer;

        if (row != null)
        {

            string strQty = ((DropDownList)(row.FindControl("ddlQty"))).SelectedValue;


            Label lblPrice = row.FindControl("lblPrice") as Label;
            Label lblId = row.FindControl("lblId") as Label;
            Label lblVat = row.FindControl("lblVat") as Label;

            

            int quantity = int.Parse(strQty.ToString());
            int id = int.Parse(lblId.Text.ToString());

            float price = float.Parse(lblPrice.Text.ToString());
            //float vat = float.Parse(lblVat.Text.ToString());

            // (Cart.Quantity * Cart.price+(Cart.price*vat/100)) as SubTotal1
           // float totalprice = (quantity * price) + (price * vat / 100);

            string cartID = Session["CartID"].ToString();

            UpdateCart(quantity, 1, price, cartID, id.ToString());

            //UpdateFinalCart(cartID);
            //GetfromCart(cartID);
            Response.Redirect("viewcart.aspx");


        }
    }

 
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Label lblQtyInStock = (Label)e.Row.FindControl("lblQtyInStock");
        Label lblColor = (Label)e.Row.FindControl("lblColor");
        Label lblHsn = (Label)e.Row.FindControl("lblHsn");

        if (lblColor != null)
        {
            lblColor.Text = "<br />Color: <b><i>" + lblColor.Text+ "</i></b>";
        }

        if (lblHsn != null)
        {
            lblHsn.Text = "<br />HSN Code: <b><i>" + lblHsn.Text + "</i></b>";
        }



        Label lblSize = (Label)e.Row.FindControl("lblSize");
        if (lblSize != null)
        {
            lblSize.Text = "<br />Size: <b><i>" + lblSize.Text+ "</i></b>";
        }


        Label lblImgPath = (Label)e.Row.FindControl("lblImgPath");
        if (lblImgPath != null)
        {
            string strImgPath = lblImgPath.Text;
            Image img1 = (Image)e.Row.FindControl("img1");

            string[] strImages = strImgPath.Split(',');
            Array.Sort(strImages);
            img1.Visible = true;
            img1.ImageUrl = "../ProductsImages/" + strImages[0].ToString();            
        }

       
            if (lblQtyInStock != null)
            {                
                Label lblQty = (e.Row.FindControl("lblQty") as Label);
                DropDownList ddlQty = (e.Row.FindControl("ddlQty") as DropDownList);
                int n = int.Parse(lblQtyInStock.Text);

                ddlQty.Items.Clear();
                for (int i = 1; i <= n; i++)
                {
                    ddlQty.Items.Add(i.ToString());
                }
            }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblQty = (e.Row.FindControl("lblQty") as Label);
            DropDownList ddlQty = (e.Row.FindControl("ddlQty") as DropDownList);

            ddlQty.SelectedValue = lblQty.Text;
            ddlQty.SelectedItem.Text = lblQty.Text;
        }
    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        try
        {
            string emailId = Session["DealerEmail"].ToString();
            int custId = int.Parse(Session["did"].ToString());
            string cartID = Session["CartID"].ToString();
            SendOrderMailtoClient(cartID, emailId, custId);
        }
        catch {

            string jv = "<script>alert('Something is wrong please try again!');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
    }

        private void SendOrderMailtoClient(string strCartId, string strEmail, int DealerID)
    {
        string  strBName = ""; string strBAdd = ""; string strBCityZip = ""; 
        try
        {
            try
            {

                SqlDataReader dr;
                DBconnection obj1 = new DBconnection();
                obj1.SetCommandSP = "sc_GetDealerDetailsByDealerId";
                obj1.AddParam("@DealerID", DealerID);
                dr = obj1.ExecuteReader();

                if (dr.Read())
                {
                    strBName = dr["CompanyName"].ToString();
                    strBAdd = dr["Address"].ToString();
                    strBCityZip = dr["City"].ToString();
                  
                    //lblBMobile.Text = "Cell: " + dr["MobileNo1"].ToString();
                    //strBName = dr["CompanyName"].ToString();
                    //strSAdd = dr["Address"].ToString();
                    //strSCityZip = dr["City"].ToString();
                    //lblSPhone.Text = "";
                    //lblSMobile.Text = "Cell: " + dr["MobileNo1"].ToString();
                    //lblGstin.Text = "GSTIN: ";
                    //lblStateCode.Text = "Place of Supply: " + dr["state_name"].ToString() + " (" + dr["state_code_gst"].ToString() + ")";
                    //Session["GstCode"] = dr["state_code_gst"].ToString();

                }

            }
            catch { }

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "sc_GetProductsByCartid2";
            obj.AddParam("@cartid", strCartId);
            DataTable dt = obj.ExecuteTable();

            if (dt.Rows.Count > 0)
            {
                GridView2.DataSource = dt;
                GridView2.DataBind();

                //Calculate Sum and display in Footer Row

                GridView2.FooterRow.Cells[1].Text = "Total";
                decimal total = dt.AsEnumerable().Sum(row => row.Field<decimal>("price"));



                GridView2.FooterRow.Cells[3].HorizontalAlign = HorizontalAlign.Right;
                GridView2.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Right;
                GridView2.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
                GridView2.FooterRow.Cells[6].HorizontalAlign = HorizontalAlign.Right;
                GridView2.FooterRow.Cells[7].HorizontalAlign = HorizontalAlign.Right;
                GridView2.FooterRow.Cells[8].HorizontalAlign = HorizontalAlign.Right;

                //GridView2.FooterRow.Cells[4].Text = total.ToString("N2");

                int qty = dt.AsEnumerable().Sum(row => row.Field<int>("Quantity"));
                GridView2.FooterRow.Cells[3].Text = qty.ToString("N0");

                decimal gstAmt = dt.AsEnumerable().Sum(row => row.Field<decimal>("GSTAmt"));
                GridView2.FooterRow.Cells[5].Text = gstAmt.ToString("N2");

                // decimal gstAmt = dt.AsEnumerable().Sum(row => row.Field<decimal>("GSTAmount"));
                GridView2.FooterRow.Cells[6].Text = gstAmt.ToString("N2");

                // for IGST

                decimal igstAmt = dt.AsEnumerable().Sum(row => row.Field<decimal>("IGSTAmt"));
                GridView2.FooterRow.Cells[7].Text = igstAmt.ToString("N2");

                decimal subTotalAmt = dt.AsEnumerable().Sum(row => row.Field<decimal>("SubTotal1"));
                GridView2.FooterRow.Cells[8].Text = subTotalAmt.ToString("N2");



                if (Session["GstCode"] != null)
                {
                    string gstCode = Session["GstCode"].ToString();
                    if (gstCode == "27")
                    {
                        GridView2.Columns[5].Visible = true;
                        GridView2.Columns[6].Visible = true;
                        GridView2.Columns[7].Visible = false;
                    }
                    else
                    {
                        GridView2.Columns[5].Visible = false;
                        GridView2.Columns[6].Visible = false;
                        GridView2.Columns[7].Visible = true;
                    }
                }




                DateTime orderDate;
                string ReadFileName = "";
                MailMessage mail = new MailMessage();
               // mail.To.Add("sales@performanceracing.in");
                mail.To.Add(strEmail);
                mail.From = new MailAddress("mail@performanceracing.in");
                mail.Bcc.Add("zia@goradiainfotech.com");

                mail.Subject = strBName+" Order by Dealer";

                mail.IsBodyHtml = true;
                string PathVal = Server.MapPath("~");
                ReadFileName = PathVal + "/Mail/dealer_order_mail.htm";
                string strMessage = "";
                StreamReader sr1 = new StreamReader(ReadFileName);
                strMessage = sr1.ReadToEnd();

                // Billing Address

                strMessage = strMessage.Replace("XXXName", strBName);
                strMessage = strMessage.Replace("XXXAdd", strBAdd);
                strMessage = strMessage.Replace("XXXCity", strBCityZip);

                // Shipping Address
               // strMessage = strMessage.Replace("XXXShipA", strBAdd);
               // strMessage = strMessage.Replace("XXXSC", strBCityZip);

                // Order Details
                strMessage = strMessage.Replace("XXXOrderNo", "Order No: " + dt.Rows[0]["OrderNo"].ToString());
                orderDate = DateTime.Parse(dt.Rows[0]["CreatedOn"].ToString());
                string strDate = orderDate.ToString("dd MMMM yyyy");
                strMessage = strMessage.Replace("XXXdate", "Order Date: " + strDate);

                // Payment Details
                strMessage = strMessage.Replace("XXXSub", "Total Before Tax: &#8377; " + lblSubTotal.Text);
                strMessage = strMessage.Replace("XXXTax", "Total Tax Amount:	&#8377; " + lblTax.Text);               
                strMessage = strMessage.Replace("XXXShip", "Shipping: &#8377; " + Convert.ToDouble(dt.Rows[0]["ShippingTotal"].ToString()).ToString("n"));
                strMessage = strMessage.Replace("XXXTotal", "Total Amount: &#8377; " + lblGrandTotal.Text);

                mail.Body += strMessage;

                //mail.Body = GetGridviewData(GridView1);
                strMessage = strMessage.Replace("XXXlist", GetGridviewData(GridView2));
                mail.Body = strMessage;
                sr1.Close();

                //mail.IsBodyHtml = true;
                // Create the credentials to login to the gmail account associated with my custom domain 

                //SmtpClient emailClient = new SmtpClient();
                //emailClient.Credentials = new NetworkCredential("mail@performanceracing.in", "lnFl6#60");
                //emailClient.Port = 25;
                //emailClient.Host = "mail.performanceracing.in";
                //emailClient.EnableSsl = false;
                //emailClient.Send(mail);

                SmtpClient emailClient = new SmtpClient();
                emailClient.Credentials = new NetworkCredential("mail@performanceracing.in", "D+85Hy9V*");
                emailClient.Port = 587;
                emailClient.Host = "smtp.zoho.com";
                emailClient.EnableSsl = true;
                emailClient.Send(mail);

                //string jv = "<script>alert('Your Order Confirmation Details Is Sent To Your Registered Email-id!');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

                Session["CartID"] = null;
                //Session["CustomerID"] = null;
                //Session["UserEmail"] = null;


                showmsg("Thank you for your order. We will revert back to you shortly.", "../Default.aspx");
            }
        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
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

    public string GetGridviewData(GridView gv)
    {

        StringBuilder strBuilder = new StringBuilder();

        StringWriter strWriter = new StringWriter(strBuilder);

        HtmlTextWriter htw = new HtmlTextWriter(strWriter);

        gv.RenderControl(htw);

        return strBuilder.ToString();

    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }

   
}

