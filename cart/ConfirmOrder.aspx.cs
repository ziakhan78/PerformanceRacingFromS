using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using System.IO;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
//using AuthorizeNet;

public partial class ConfirmOrder : System.Web.UI.Page
{
    string cartid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblAlreadyDiscount.Visible = false;
            lblDiscountAmtText.Text = "";
            divCoupon.Visible = false;

            if (Session["CustomerID"] != null)
            {
                GetCustomerDetails();

                cartid = Session["CartID"].ToString();
                GetfromCart(cartid);

            }
            else
            {
                Response.Redirect("login.aspx");
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
            try
            {
                string strShippingTotal = "";
               // string strShippingTotal = "";
               // string strShippingTotal = "";

                //this.lblabc.Text = string.Format("{0:c}", lblabc.Text);
                // this.lblabc.Text = Convert.ToDouble(lblabc.Text).ToString("c");

                lblSubTotal.Text = Convert.ToDouble(dt.Rows[0]["SubTotal"].ToString()).ToString("n");
                //lblTaxTotal.Text = Convert.ToDouble(dt.Rows[0]["TaxTotal"].ToString()).ToString("n");

                strShippingTotal = dt.Rows[0]["ShippingTotal"].ToString();
                if (strShippingTotal=="")
                {
                    lblShippingTotal.Text = "";
                }
                else
                {
                    lblShippingTotal.Text = Convert.ToDouble(dt.Rows[0]["ShippingTotal"].ToString()).ToString("n");
                }


               
                lblGrossAmount.Text = Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");

                lblDiscountAmt.Text = "";
                lblDiscountAmtText.Text = "";
                lblTotalAmount.Text = Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");


                //lblSubTotal.Text = "Rs. " + Convert.ToDouble(dt.Rows[0]["SubTotal"].ToString()).ToString("n");
                //lblTaxTotal.Text = "Rs. " + Convert.ToDouble(dt.Rows[0]["TaxTotal"].ToString()).ToString("n");
                //lblShippingTotal.Text = "Rs. " + Convert.ToDouble(dt.Rows[0]["ShippingTotal"].ToString()).ToString("n");
                //lblGrossAmount.Text = "Rs. " + Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");
                lblOrderNo.Text = "Order No. : " + dt.Rows[0]["OrderNo"].ToString();
                GridView1.DataSource = dt;
                GridView1.DataBind();


                decimal subTotalAmt = decimal.Parse(dt.Rows[0]["TotalAmount"].ToString());

                decimal shippAmt = GetShippingAmount(rbtnType.SelectedItem.Text, Convert.ToDecimal(lblTotalAmount.Text.Trim()));
                if (shippAmt != 0)
                {
                    decimal couponDisAmt = 0;
                    lblShippingTotal.Text = string.Format("{0:F2}", shippAmt);
                    decimal finalGrossAmt = subTotalAmt + shippAmt;
                    lblGrossAmount.Text = finalGrossAmt.ToString();

                    try
                    {
                        couponDisAmt = Convert.ToDecimal(dt.Rows[0]["CouponDiscount"].ToString());
                    }
                    catch { couponDisAmt = 0; }


                    lblTotalAmount.Text = (finalGrossAmt - couponDisAmt).ToString();
                }
                else
                {
                    lblShippingTotal.Text = "";
                }




            }
            catch { }
        }
        else
        {
        }
    }
    private void UpdateCart_Tbl()
    {
        cartid = Session["CartID"].ToString();
        string sComment = ""; //txtComment.Text.ToString();
        int Cust_Id = int.Parse(Session["CustomerID"].ToString());

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sp_UpdateConfirmedOrderCart_Tbl";
        obj.AddParam("@CartID", cartid);
        obj.AddParam("@Cust_Id", Cust_Id);
        obj.AddParam("@Comment", sComment);

        int exe = obj.ExecuteNonQuery();

        //if (exe > 0)
        //{
        //    //SendMailtoClient();
        //    //SendMailtoAdmin();
        //}

    }
    public void showmsg(string msg)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
    private void UpdateQuantity(int pid, int Qty)
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_UpdateQuantity";
        obj.AddParam("@pid", pid);
        obj.AddParam("@Qty", Qty);

        int exe = obj.ExecuteNonQuery();
    }
    protected void btnChkOut_Click(object sender, EventArgs e)
    {
        // Response.Redirect("payment.aspx");

        Response.Redirect("OrderSummary.aspx");

        //    Session["CartIDCheckout"] = Session["CartID"].ToString();
        //    try
        //    {
        //        UpdateCart_Tbl();
        //        Response.Redirect("CheckOut1.aspx");

        //        //if (radPaymentMode.SelectedItem.Text == "Shopping")
        //        //{
        //        //    Response.Redirect("CheckOut1.aspx");
        //        //}
        //        //else
        //        //{
        //        //SendOrderMail();

        //        //Session["CartIDForOrderDetails"] = Session["CartID"];
        //        //Session["CartID"] = null;
        //        //Response.Redirect("ThankYou.aspx");
        //        // }
        //    }
        //    catch (Exception excp) { showmsg("Error: " + excp.Message); }

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
    protected void btnApply_Click(object sender, EventArgs e)
    {
        bool b = IsCouponValid(txtCouponCode.Text.Trim());       

        if (b == true)
        {            
            lblAlreadyDiscount.Visible = false;

            string coupon_no = txtCouponCode.Text.Trim().ToString();
            //decimal cart_total_amt = decimal.Parse(lblSubTotal.Text.Trim().ToString());
            decimal cart_total_amt = decimal.Parse(lblGrossAmount.Text.Trim().ToString());
            decimal descount_amt = GetDiscountValue(coupon_no, cart_total_amt);

            if (descount_amt != 0)
            {
                divCoupon.Visible = true;
                lblDiscountAmtText.Text = "Discount Amount :";

                lblDiscountAmt.Text = "&#8377" + string.Format("{0:F2}", descount_amt);
                lblTotalAmount.Text = string.Format("{0:F2}", cart_total_amt - descount_amt);

                UpdateCouponDiscountOnCartTbl(descount_amt);
            }
            else
            {
                divCoupon.Visible = false;
                lblDiscountAmtText.Text = "";
            }
          
        }
        else
        {
            divCoupon.Visible = false;
            lblAlreadyDiscount.Visible = true;
        }
    }
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
    protected void GetCustomerDetails()
    {
        try
        {
            if (Session["CustomerID"] != null)
            {
                DataTable Baddrdt = new DataTable();
                DBconnection con = new DBconnection();
                con.SetCommandSP = "sc_GetCustBillAddr";
                con.AddParam("@CustomerID", Session["CustomerID"]);
                Baddrdt = con.ExecuteTable();

                foreach (DataRow custdr in Baddrdt.Rows)
                {
                    //ddltitle.DataBind();

                    Session["countryID"] = custdr["sCountryId"].ToString();
                    Session["ststeID"] = custdr["sStateId"].ToString();

                    //txtSPhone1.Text = custdr["sPhone1"].ToString().Trim();
                    //txtSPhone2.Text = custdr["sPhone2"].ToString().Trim();
                    //txtSPhone3.Text = custdr["sPhone3"].ToString().Trim();

                    //txtSMobile1.Text = custdr["sMobile1"].ToString().Trim();
                    //txtSMobile2.Text = custdr["sMobile2"].ToString().Trim();             

                    //txtSCompanyName.Text = custdr["SCompanyName"].ToString().Trim();

                }
            }
        }
        catch { }
    }
    protected void rbtnType_SelectedIndexChanged(object sender, EventArgs e)
    {
        cartid = Session["CartID"].ToString();
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetProductsByCartid2";
        obj.AddParam("@cartid", cartid);

        DataTable dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            try
            {
                decimal couponDisAmt = 0;
                decimal descount_amt = GetShippingAmount(rbtnType.SelectedItem.Text, Convert.ToDecimal(lblTotalAmount.Text.Trim()));
                if (descount_amt != 0)
                {
                    decimal finalGrossAmt = Convert.ToDecimal(dt.Rows[0]["TotalAmount"].ToString());
                    try
                    {
                        couponDisAmt = Convert.ToDecimal(dt.Rows[0]["CouponDiscount"].ToString());
                    }
                    catch { couponDisAmt = 0; }

                    lblShippingTotal.Text = string.Format("{0:F2}", descount_amt);

                    lblGrossAmount.Text = string.Format("{0:F2}", finalGrossAmt + descount_amt);
                    //decimal finalGrossAmt = decimal.Parse(lblGrossAmount.Text) + descount_amt;

                    finalGrossAmt = finalGrossAmt + descount_amt;
                    lblTotalAmount.Text = (finalGrossAmt - couponDisAmt).ToString();
                }
                else
                {
                    lblShippingTotal.Text = "";
                }
            }
            catch { }
        }
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
}
