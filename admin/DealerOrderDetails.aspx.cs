using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class admin_DealerOrderDetails : System.Web.UI.Page
{

    string cartid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["CartID"] != null)
            {
                int CustID = Int32.Parse(Request.QueryString["DealerID"].ToString());
                cartid = Request.QueryString["CartID"].ToString();
              
                GetfromCart(cartid);

                FillRegisteredCust(CustID);
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

            decimal subTotal, taxTotal, shippingTotal, totalAmt = 0;
            subTotal = Convert.ToDecimal(dt.Rows[0]["SubTotal"].ToString());
            taxTotal = Convert.ToDecimal(dt.Rows[0]["TaxTotal"].ToString());
            shippingTotal = Convert.ToDecimal(dt.Rows[0]["ShippingTotal"].ToString());
            totalAmt = Convert.ToDecimal(dt.Rows[0]["TotalAmount"].ToString());

            lblSubTotal.Text = "&#8377; " + string.Format("{0:n0}", subTotal);
            lblTax.Text = "&#8377; " + string.Format("{0:n0}", taxTotal);
            lblShippingTotal.Text = "&#8377; " + string.Format("{0:n0}", shippingTotal);
            //lblGrandTotal.Text = "&#8377; " + string.Format("{0:n0}", totalAmt);
            // lblGrossAmount.Text = "&#8377; " + string.Format("{0:n0}", totalAmt);



            // lblSubTotal.Text = Convert.ToDouble(dt.Rows[0]["SubTotal"].ToString()).ToString("n");
            //lblTax.Text = Convert.ToDouble(dt.Rows[0]["TaxTotal"].ToString()).ToString("n");
            // lblShippingTotal.Text = Convert.ToDouble(dt.Rows[0]["ShippingTotal"].ToString()).ToString("n");           

            double netAmt = 0;
            double couponDisAmt = 0;
            double grossAmt = Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString());
            try
            {
                couponDisAmt = Convert.ToDouble(dt.Rows[0]["CouponDiscount"].ToString());
            }
            catch { couponDisAmt = 0; }

            // lblGrossAmount.Text = grossAmt.ToString("n");
            lblGrossAmount.Text = "&#8377; " + string.Format("{0:n0}", grossAmt);

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
        }
        else
        {
        }
    }
    private void FillRegisteredCust(int dealerId)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetDealersContacts";
        obj.AddParam("@id", dealerId);
        dr = obj.ExecuteReader();

        if (dr.Read())
        {



            lblCompany.Text = dr["CompanyName"].ToString();
            lblBFName.Text = dr["Name"].ToString();
         
            lblBAddress1.Text = dr["Address1"].ToString() + " " + dr["Address2"].ToString();
           



        }
    }
    protected void btnBack_Click1(object sender, EventArgs e)
    {
        Response.Redirect("ViewDealersOrders.aspx");
    }
}
