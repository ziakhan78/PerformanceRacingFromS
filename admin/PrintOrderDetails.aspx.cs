using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_PrintOrderDetails : System.Web.UI.Page
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
                if (type == "Store" || type=="Online")
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
            double shippingAmt = 0;
            double taxAmt = 0;
            double grossAmt = 0;
            double subTotal = 0;

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
                    lblTaxTotal.Text = taxAmt.ToString("n");
                }
            }
            catch { lblTaxTotal.Text = "0"; }

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


            try
            {
                netAmt = Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString());
                lblTotalAmount.Text = netAmt.ToString("n0");

                long number = Convert.ToInt32(netAmt);
                lblAmtinWord.Text = ConvertNumberToWord.ConvertNumbertoWords(number) + " Only";
            }
            catch { lblTotalAmount.Text = "0"; }



            lblRounded.Text = dt.Rows[0]["Rounded"].ToString();




            //try
            //{
            //    grossAmt = Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString());
            //    grossAmt = grossAmt + shippingAmt + taxAmt;
            //    lblGrossAmount.Text = grossAmt.ToString("n");
            //}
            //catch { lblGrossAmount.Text = "0"; }                 


            //if (couponDisAmt == 0)
            //{
            //    //TRGrossAmt.Visible = false;
            //    //TRDisAmt.Visible = false;
            //    //netAmt = subTotal + shippingAmt + taxAmt;
            //    //lblGrossAmount.Text = subTotal.ToString("n");
            //    //lblTotalAmount.Text = netAmt.ToString("n");
            //}
            //else
            //{
            //   // TRGrossAmt.Visible = true;
            //   // TRDisAmt.Visible = true;
            //    //grossAmt = subTotal - couponDisAmt;
            //   // netAmt = grossAmt + shippingAmt + taxAmt;
            //    //lblDiscountAmt.Text = couponDisAmt.ToString("n");
            //    //lblGrossAmount.Text = grossAmt.ToString("n");
            //    lblTotalAmount.Text = netAmt.ToString("n");
            //}


            lblOrderNo.Text = "Invoice No.: " + dt.Rows[0]["OrderNo"].ToString();

            // lblOrderStatus.Text = dt.Rows[0]["Status"].ToString();
            // lblip.Text = dt.Rows[0]["IpAddress"].ToString();

            DateTime dtAdded = DateTime.Parse(dt.Rows[0]["CreatedOn"].ToString());
            lblOrderDate.Text = "Invoice Date: " + dtAdded.ToString("dd MMMM yyyy");

            //GridView1.DataSource = dt;
            //GridView1.DataBind();

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


            lblUser.Text = dt.Rows[0]["AdminUser"].ToString();
            lblMode.Text= dt.Rows[0]["OrderFrom"].ToString();

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
            string custType = dr["Customer_Type"].ToString();
            // lblTitle.Text = dr["Title"].ToString();
            lblBFName.Text = dr["billFName"].ToString() + " " + dr["billLName"].ToString();
            //lblBLName.Text = dr["LastName"].ToString();
            //lblBDOB.Text = dr["DOB"].ToString();
            lblBAddress1.Text = dr["BillAddress1"].ToString() + " " + dr["BillAddress2"].ToString();
            // lblBAddress2.Text = dr["BillAddress2"].ToString();
            // lblBZip.Text = dr["BillZip"].ToString();
            lblBCity.Text = dr["BillCity"].ToString() + " - " + dr["BillZip"].ToString();
            //lblBCountry.Text = dr["BillCountry"].ToString();
            //lblBState.Text = dr["billState"].ToString();
            lblBPhone.Text ="Tel: "+ dr["billPhoneCC"].ToString() + "-" + dr["billPhoneAc"].ToString() + "-" + dr["billPhone"].ToString();


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
                lblBMobile.Text = "Cell: " + dr["billMobileCC"].ToString() + "-" + dr["billMobile"].ToString();
            }

            lblSFName.Text = dr["sFName"].ToString() + " " + dr["sLName"].ToString();
            //lblSFName.Text = dr["sLName"].ToString();
            // lblSDOB.Text = dr["sDOB"].ToString();
            lblSAddress1.Text = dr["sAddress1"].ToString() + " " + dr["sAddress2"].ToString();
            //lblSAddress2.Text = dr["sAddress2"].ToString();
           // lblSZip.Text = dr["sZip"].ToString();
            lblSCity.Text = dr["sCity"].ToString() + " - " + dr["sZip"].ToString();
            //lblSCountry.Text = dr["sCountry"].ToString();
            // lblSState.Text = dr["sState"].ToString();
            lblSPhone.Text = "Tel: " + dr["sPhoneCC"].ToString() + "-" + dr["sPhoneAc"].ToString() + "-" + dr["sPhone"].ToString();




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
                lblSMobile.Text = "Cell: " + dr["sMobileCC"].ToString() + "-" + dr["sMobile"].ToString();
            }
            lblStateCode.Text = "Place of Supply: " + dr["state_name"].ToString() + " (" + dr["state_2_code"].ToString() + " - " + dr["state_code_gst"].ToString() + ")";
            Session["GstCode"] = dr["state_code_gst"].ToString();
            if (custType == "Company")
            {
                trCompName.Visible = true;
                trGstin.Visible = true;
                lblCompName.Text = dr["Company_Name"].ToString();
                lblGstin.Text = "GSTIN: " + dr["GSTIN"].ToString();                
               
            }
            else
            {
                trCompName.Visible = false;
                trGstin.Visible = false;
            }

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

            lblGstin.Text = "GSTIN: ";
            lblStateCode.Text = "Place of Supply: " + dr["state_name"].ToString() + " (" + dr["state_code_gst"].ToString() + ")";
            Session["GstCode"] = dr["state_code_gst"].ToString();

        }
    }
}