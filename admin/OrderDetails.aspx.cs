using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_OrderDetails : System.Web.UI.Page
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
        obj.SetCommandSP = "sp_GetProductsByCartid";
        obj.AddParam("@cartid", cartid);

        DataTable dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            //lblSubTotal.Text = "Rs. " + dt.Rows[0]["SubTotal"].ToString();
            //lblShippingTotal.Text = "Rs. " + dt.Rows[0]["ShippingTotal"].ToString();
            lblTotalAmount.Text = Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");
            lblOrderNo.Text = dt.Rows[0]["OrderNo"].ToString();
            //lblOrderNo2.Text = "Order No. : " + dt.Rows[0]["OrderNo"].ToString();

            lblOrderDate.Text = dt.Rows[0]["CreatedOn"].ToString();
            lblOrderStatus.Text = dt.Rows[0]["Status"].ToString();

            // lblSpeInstruction.Text = dt.Rows[0]["Comment"].ToString();

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
        obj.SetCommandSP = "z_GetRegisteredUser";
        obj.AddParam("@userid", CustID);
        dr = obj.ExecuteReader();

        if (dr.Read())
        {

            lblName.Text = dr["FName"].ToString() + " " + dr["LName"].ToString();
            lblAddress.Text = dr["add1"].ToString() + " " + dr["add2"].ToString();
            lblEmailid.Text = dr["emailId"].ToString();
            lblMobile.Text = dr["mobile"].ToString();
            lblPin.Text = dr["pin"].ToString();
            lblCity.Text = dr["city"].ToString();
            lblCountry.Text = dr["country"].ToString();
            lblState.Text = dr["state"].ToString();
            lblPhone.Text = dr["phac"].ToString() + "-" + dr["phone"].ToString();

        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        Label lblTrackName = (Label)e.Row.FindControl("lblTrackName");
        if (lblTrackName != null)
        {
            string str = lblTrackName.Text.Trim().ToString();
            if (str.Length > 30)
            {
                lblTrackName.Text = str.Substring(0, 29) + "...";
            }
            else
            {
                lblTrackName.Text = str;
            }
        }
    }
}