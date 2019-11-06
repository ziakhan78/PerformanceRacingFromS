using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class admin_OrderDetail : System.Web.UI.Page
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

                string type = Request.QueryString["type"].ToString();
                if (type == "Store" || type == "Online")
                {
                    FillRegisteredCust(CustID);
                }
                else
                {
                    GetDealerDetailsByDealerId(CustID);
                }

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
            double shippingTotal = 0;
            double taxAmt = 0;
            double grossAmt = 0;
            double subTotal = 0;
           
            

            // subTotal = Convert.ToDouble(dt.Rows[0]["SubTotal"].ToString());
            // taxTotal = Convert.ToDouble(dt.Rows[0]["IGSTAmt"].ToString());
            shippingTotal = Convert.ToDouble(dt.Rows[0]["ShippingTotal"].ToString());
            netAmt = Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString());

            //lblSubTotal.Text = "&#8377; " + string.Format("{0:n0}", subTotal);
            //lblTax.Text = "&#8377; " + string.Format("{0:n0}", taxTotal);
            lblShippingTotal.Text = "&#8377; " + string.Format("{0:n0}", shippingTotal);
            //lblGrandTotal.Text = "&#8377; " + string.Format("{0:n0}", totalAmt);
            // lblGrossAmount.Text = "&#8377; " + string.Format("{0:n0}", totalAmt);



            // lblSubTotal.Text = Convert.ToDouble(dt.Rows[0]["SubTotal"].ToString()).ToString("n");
            //lblTax.Text = Convert.ToDouble(dt.Rows[0]["TaxTotal"].ToString()).ToString("n");
            // lblShippingTotal.Text = Convert.ToDouble(dt.Rows[0]["ShippingTotal"].ToString()).ToString("n");  

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

                        
            grossAmt = Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString());
            try
            {
                couponDisAmt = Convert.ToDouble(dt.Rows[0]["CouponDiscount"].ToString());
            }
            catch { couponDisAmt = 0; }

            // lblGrossAmount.Text = grossAmt.ToString("n");
            //lblGrossAmount.Text = "&#8377; " + string.Format("{0:n0}", grossAmt);

            if (couponDisAmt == 0)
            {
                TRDisAmt.Visible = false;
                lblTotalAmount.Text = "&#8377; " + string.Format("{0:n0}", grossAmt);
            }
            else
            {
                TRDisAmt.Visible = true;
                netAmt = grossAmt - couponDisAmt;
                lblDiscountAmt.Text = couponDisAmt.ToString("n");
                lblTotalAmount.Text = "&#8377; " + string.Format("{0:n0}", netAmt);//netAmt.ToString("n");
            }


            lblOrderNo.Text = dt.Rows[0]["OrderNo"].ToString();
            lblOrderDate.Text = dt.Rows[0]["CreatedOn"].ToString();
            lblOrderStatus.Text = dt.Rows[0]["Status"].ToString();
            lblip.Text = dt.Rows[0]["IpAddress"].ToString();

            GridView1.DataSource = dt;
            GridView1.DataBind();

            //Calculate Sum and display in Footer Row

            GridView1.FooterRow.Cells[1].Text = "Total";
            decimal total = dt.AsEnumerable().Sum(row => row.Field<decimal>("price"));            

            

            GridView1.FooterRow.Cells[3].HorizontalAlign = HorizontalAlign.Right;
            GridView1.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Right;
            GridView1.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
            GridView1.FooterRow.Cells[6].HorizontalAlign = HorizontalAlign.Right;
            GridView1.FooterRow.Cells[7].HorizontalAlign = HorizontalAlign.Right;
            GridView1.FooterRow.Cells[8].HorizontalAlign = HorizontalAlign.Right;
            GridView1.FooterRow.Cells[4].Text = total.ToString("N2");

            int qty = dt.AsEnumerable().Sum(row => row.Field<int>("Quantity"));
            GridView1.FooterRow.Cells[3].Text = qty.ToString("N0");

            decimal priceTotal = dt.AsEnumerable().Sum(row => row.Field<decimal>("price"));
            GridView1.FooterRow.Cells[4].Text = priceTotal.ToString("N2");

            decimal gstAmt = dt.AsEnumerable().Sum(row => row.Field<decimal>("GSTAmt"));
            GridView1.FooterRow.Cells[5].Text = gstAmt.ToString("N2");
          
            GridView1.FooterRow.Cells[6].Text = gstAmt.ToString("N2");

            // for IGST
            decimal igstAmt = dt.AsEnumerable().Sum(row => row.Field<decimal>("IGSTAmt"));
            GridView1.FooterRow.Cells[7].Text = igstAmt.ToString("N2");

            decimal subTotalAmt = dt.AsEnumerable().Sum(row => row.Field<decimal>("SubTotal1"));
            GridView1.FooterRow.Cells[8].Text = subTotalAmt.ToString("N2");

            if (Session["GstCode"] != null)
            {
                string gstCode = Session["GstCode"].ToString();
                if (gstCode == "27")
                {
                    GridView1.Columns[5].Visible = true;
                    GridView1.Columns[6].Visible = true;
                    GridView1.Columns[7].Visible = false;
                }
                else
                {
                    GridView1.Columns[5].Visible = false;
                    GridView1.Columns[6].Visible = false;
                    GridView1.Columns[7].Visible = true;
                }
            }
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
            lblBAddress1.Text = dr["billAddress1"].ToString() + " " + dr["billAddress2"].ToString();
            // lblBAddress2.Text = dr["BillAddress2"].ToString();
            lblBZip.Text = dr["billZip"].ToString();
            lblBCity.Text = dr["billCity"].ToString();
            //lblBCountry.Text = dr["billCountry"].ToString();
            //lblBState.Text = dr["billState"].ToString();
            lblBPhone.Text = dr["billPhoneCC"].ToString() + "-" + dr["billPhoneAC"].ToString() + "-" + dr["billPhone"].ToString();






            lblSFName.Text = dr["sFName"].ToString() + " " + dr["sLName"].ToString();
            //lblSFName.Text = dr["sLName"].ToString();
            // lblSDOB.Text = dr["sDOB"].ToString();
            lblSAddress1.Text = dr["sAddress1"].ToString() + " " + dr["sAddress2"].ToString();
            //lblSAddress2.Text = dr["sAddress2"].ToString();
            lblSZip.Text = dr["sZip"].ToString();
            lblSCity.Text = dr["sCity"].ToString();
            // lblSCountry.Text = dr["sCountry"].ToString();
            //lblSState.Text = dr["sState"].ToString();
            lblSPhone.Text = dr["sPhoneCC"].ToString() + "-" + dr["sPhoneAC"].ToString() + "-" + dr["sPhone"].ToString();

           // lblGstin.Text = "GSTIN: ";
           // lblStateCode.Text = "Place of Supply: " + dr["state_name"].ToString() + " (" + dr["state_code_gst"].ToString() + ")";
            Session["GstCode"] = dr["state_code_gst"].ToString();

        }
    }
    private void GetDealerDetailsByDealerId(int DealerID)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetDealerDetailsByDealerId";
        obj.AddParam("@DealerID", DealerID);
        dr = obj.ExecuteReader();



        if (dr.Read())
        {
            lblBFName.Text = dr["CompanyName"].ToString();
            lblBAddress1.Text = dr["Address"].ToString();
            lblBCity.Text = dr["City"].ToString();
            lblBPhone.Text = "";
            lblBMobile.Text = "Cell: " + dr["MobileNo1"].ToString();

            lblSFName.Text = dr["CompanyName"].ToString();
            lblSAddress1.Text = dr["Address"].ToString();
            lblSCity.Text = dr["City"].ToString();
            lblSPhone.Text = "";
            lblSMobile.Text = "Cell: " + dr["MobileNo1"].ToString();

           // lblGstin.Text = "GSTIN: ";
          //  lblStateCode.Text = "Place of Supply: " + dr["state_name"].ToString() + " (" + dr["state_code_gst"].ToString() + ")";
         //   Session["GstCode"] = dr["state_code_gst"].ToString();

        }
    }
}
