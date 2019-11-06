using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_PrintOrderDetails1 : System.Web.UI.Page
{   
    string cartid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["CartID"] != null)
            {
                int CustID = Int32.Parse(Request.QueryString["CustID"].ToString());
                cartid = Request.QueryString["CartID"].ToString();
                FillRegisteredCust(CustID);
                GetfromCart(cartid);
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
            double netAmt = 0;
            double couponDisAmt = 0;
            double shippingAmt = 0;
            double taxAmt = 0;
            double grossAmt = 0;
            double subTotal = 0;

            try
            {
                subTotal = Convert.ToDouble(dt.Rows[0]["SubTotal"].ToString());
                lblSubTotal.Text = subTotal.ToString("n");
            }
            catch { lblSubTotal.Text = "0"; }

            try
            {
                taxAmt = Convert.ToDouble(dt.Rows[0]["TaxTotal"].ToString());
                lblTax.Text = taxAmt.ToString("n");
            }
            catch { lblTax.Text = "0"; }

            try
            {
                shippingAmt = Convert.ToDouble(dt.Rows[0]["ShippingTotal"].ToString());
                lblShippingTotal.Text = shippingAmt.ToString("n");
            }
            catch { lblShippingTotal.Text = "0"; }

            try
            {
                couponDisAmt = Convert.ToDouble(dt.Rows[0]["CouponDiscount"].ToString());
            }
            catch { couponDisAmt = 0; }

            //try
            //{
            //    grossAmt = Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString());
            //    grossAmt = grossAmt + shippingAmt + taxAmt;
            //    lblGrossAmount.Text = grossAmt.ToString("n");
            //}
            //catch { lblGrossAmount.Text = "0"; }                 


            if (couponDisAmt == 0)
            {
                TRGrossAmt.Visible = false;
                TRDisAmt.Visible = false;
                netAmt = subTotal + shippingAmt + taxAmt;
                lblGrossAmount.Text = subTotal.ToString("n");
                lblTotalAmount.Text = netAmt.ToString("n");
            }
            else
            {
                TRGrossAmt.Visible = true;
                TRDisAmt.Visible = true;
                grossAmt = subTotal - couponDisAmt;
                netAmt = grossAmt + shippingAmt + taxAmt;
                lblDiscountAmt.Text = couponDisAmt.ToString("n");
                lblGrossAmount.Text = grossAmt.ToString("n");
                lblTotalAmount.Text = netAmt.ToString("n");
            }


            lblOrderNo.Text = dt.Rows[0]["OrderNo"].ToString();
            lblOrderDate.Text = dt.Rows[0]["CreatedOn"].ToString();
            lblOrderStatus.Text = dt.Rows[0]["Status"].ToString();
            // lblip.Text = dt.Rows[0]["IpAddress"].ToString();

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
        }
    }
    private void FillRegisteredCust(int CustID)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetRegisterdCust";
        obj.AddParam("@CustomerID", CustID);
        dr = obj.ExecuteReader();

        if (dr.Read())
        {
            // lblTitle.Text = dr["Title"].ToString();
            lblBFName.Text = dr["billFName"].ToString() + " " + dr["billLName"].ToString();
            //lblBLName.Text = dr["LastName"].ToString();
            //lblBDOB.Text = dr["DOB"].ToString();
            lblBAddress1.Text = dr["BillAddress1"].ToString() + " " + dr["BillAddress2"].ToString();
            // lblBAddress2.Text = dr["BillAddress2"].ToString();
            lblBZip.Text = dr["BillZip"].ToString();
            lblBCity.Text = dr["BillCity"].ToString();
            //lblBCountry.Text = dr["BillCountry"].ToString();
            //lblBState.Text = dr["billState"].ToString();
            lblBPhone.Text = dr["billPhoneCC"].ToString() + "-" + dr["billPhoneAc"].ToString() + "-" + dr["billPhone"].ToString();


            //if (dr["BillFax3"].ToString() == "")
            //{
            //    lblBFax.Visible = false;

            //}
            //else
            //{
            //    lblBFax.Visible = true;
            //    lblBFax.Text = dr["BillFax1"].ToString() + "-" + dr["BillFax2"].ToString() + "-" + dr["BillFax3"].ToString();
            //}

            if (dr["billMobile"].ToString() == "")
            {
                lblSMobile.Visible = false;

            }
            else
            {
                lblBMobile.Visible = true;
                lblBMobile.Text = dr["billMobileCC"].ToString() + "-" + dr["billMobile"].ToString();
            }

            lblSFName.Text = dr["sFName"].ToString() + " " + dr["sLName"].ToString();
            //lblSFName.Text = dr["sLName"].ToString();
            // lblSDOB.Text = dr["sDOB"].ToString();
            lblSAddress1.Text = dr["sAddress1"].ToString() + " " + dr["sAddress2"].ToString();
            //lblSAddress2.Text = dr["sAddress2"].ToString();
            lblSZip.Text = dr["sZip"].ToString();
            lblSCity.Text = dr["sCity"].ToString();
            //lblSCountry.Text = dr["sCountry"].ToString();
           // lblSState.Text = dr["sState"].ToString();
            lblSPhone.Text = dr["sPhoneCC"].ToString() + "-" + dr["sPhoneAc"].ToString() + "-" + dr["sPhone"].ToString();




            //if (dr["sFax3"].ToString() == "")
            //{
            //    lblSFax.Visible = false;

            //}
            //else
            //{
            //    lblSFax.Visible = true;
            //    lblSFax.Text = dr["sFax1"].ToString() + "-" + dr["sFax2"].ToString() + "-" + dr["sFax3"].ToString();
            //}

            if (dr["sMobileCC"].ToString() == "")
            {
                lblSMobile.Visible = false;

            }
            else
            {
                lblSMobile.Visible = true;
                lblSMobile.Text = dr["sMobileCC"].ToString() + "-" + dr["sMobile"].ToString();
            }


        }
    }
}