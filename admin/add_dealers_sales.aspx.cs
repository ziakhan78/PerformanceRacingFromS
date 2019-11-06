using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Linq;
using System.Data.SqlClient;

public partial class Admin_add_dealers_sales : System.Web.UI.Page
{
    string cartid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        txtSku.Focus();

        if (!IsPostBack)
        {
            btnSubmit.Visible = false;
            txtSku.Text = "";
            Session["CartID"] = null;
            btnSubmit.Text = "Submit";           
            lblHeading.Text = "Add Dealers Sales";           
        }
    }
    protected void txtSku_TextChanged(object sender, EventArgs e)
    {
        try
        {
            string sku = txtSku.Text.Trim().ToString();
            int pid = GetProductIdBySku(sku);
            AddtoCart(pid);

            txtSku.Text = "";
            txtSku.Focus();
        }
        catch(Exception ex) { }
    }
    private int GetProductIdBySku(string sku)
    {
        int pid = 0;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetProductIdBySku";
        obj.AddParam("@sku", sku);
        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            pid= Int32.Parse(dt.Rows[0]["pid"].ToString());
        }

        return pid;
    }
    private void AddtoCart(int pid)
    {
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
            proQuantity = 1;

           // price = float.Parse(dt.Rows[0]["price"].ToString());

            price = float.Parse(dt.Rows[0]["dealer_price"].ToString()); // Dealer Price

            //if (Request.QueryString["dis_price"] != "")
            //{
            //    price = float.Parse(Request.QueryString["dis_price"]);
            //    Session["Promotional"] = "promotion";
            //}
            //else
            //{
            //    price = float.Parse(dt.Rows[0]["price"].ToString());
            //}

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
            //Session["ProPid"] = null;
            // Response.Redirect("cart/viewcart.aspx");

            UpdateFinalCart(cartid);
            GetfromCart(cartid);
        }
    } 
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {           
            cartid = Session["CartID"].ToString();
            UpdateFinalCart(cartid);
            Session["CartID"] = null;
            ShowMsg("Order has been created sucessfully.","add_dealers_sales.aspx");
        }
    }
    public void ShowMsg(string msg, string redirectUrl)
    {
        try
        {
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
    protected void CVcategory_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            //CVHScode.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select HSCode from hs_code_master_tbl where HSCode=''";
                object res = obj.ExecuteScalar();
                if (res != null)
                    args.IsValid = false;
                else
                    args.IsValid = true;
            }
            catch
            {
                args.IsValid = true;
            }
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            cartid = Session["CartID"].ToString();

            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "sc_DeleteCart";
            obj.AddParam("@CartID", cartid);
            obj.AddParam("@RecordID", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                //Response.Redirect("add_store_order.aspx");

                //string cartid = Session["CartID"].ToString();
                //GetfromCart(cartid);

                UpdateFinalCart(cartid);
                GetfromCart(cartid);
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
                cartid = Session["CartID"].ToString();

                UpdateCart(quantity, 1, price, cartid, i.ToString());

                //UpdateFinalCart(cartID);
                //GetfromCart(cartID);
                //Response.Redirect("add_store_order.aspx");

                UpdateFinalCart(cartid);
                GetfromCart(cartid);

            }
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
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

        if (e.Row.RowType == DataControlRowType.DataRow)
        {



            Label lblQty = (e.Row.FindControl("lblQty") as Label);
            DropDownList ddlQty = (e.Row.FindControl("ddlQty") as DropDownList);

            ddlQty.SelectedValue = lblQty.Text;
            ddlQty.SelectedItem.Text = lblQty.Text;
        }
    }
    private void GetfromCart(string cartid)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetDealerProductsByCartid";
        obj.AddParam("@cartid", cartid);
        DataTable dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            btnSubmit.Visible = true;
            lblOrderNo.Text = "Order No. : " + dt.Rows[0]["OrderNo"].ToString();

            //lblSubTotal.Text = "&#8377; " + dt.Rows[0]["SubTotal"].ToString();
            //lblGrandTotal.Text = "&#8377; " + dt.Rows[0]["TotalAmount"].ToString();

            decimal subTotal, taxTotal, shippingTotal, totalAmt = 0;
            subTotal = Convert.ToDecimal(dt.Rows[0]["SubTotal"].ToString());
            taxTotal = Convert.ToDecimal(dt.Rows[0]["TaxTotal"].ToString());
            shippingTotal = Convert.ToDecimal(dt.Rows[0]["ShippingTotal"].ToString());

            totalAmt = Convert.ToDecimal(dt.Rows[0]["TotalAmount"].ToString());
            // totalAmt = Convert.ToDecimal(dt.Rows[0]["SubTotal1"].ToString());

            lblSubTotal.Text = "Subtotal: &#8377;" + string.Format("{0:n0}", subTotal);
            //lblShippingTotal.Text = "&#8377; " + string.Format("{0:n0}", shippingTotal);
            lblGrandTotal.Text = "Grand Total: &#8377; " + string.Format("{0:n0}", totalAmt);
            lblSubTotal1.Text = dt.Rows[0]["SubTotal"].ToString();

            // lblTax.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TaxTotal"].ToString()).ToString("n");
            //lblSubTotal.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["SubTotal"].ToString()).ToString("n");
            ////lblTax.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TaxTotal"].ToString()).ToString("n");
            //lblShippingTotal.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["ShippingTotal"].ToString()).ToString("n");
            //lblGrandTotal.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");
            ////lblGrossAmount.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");
            ////lblGrossAmount1.Text = Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");

            // imgEmptcart.Visible = false;
            // emptycart.Visible = true;

            GridView1.Visible = true;
            // btnChkOut.Visible = true;
            // btnUpdateCart.Visible = true;
            // btnContShopping.Visible = true;
            // btnContShopping.Visible = true;

            GridView1.DataSource = dt;
            GridView1.DataBind();

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


            //Calculate Sum and display in Footer Row
            decimal total = dt.AsEnumerable().Sum(row => row.Field<decimal>("price"));
            //GridView2.FooterRow.Cells[1].Text = "Total";

            GridView1.FooterRow.Cells[1].Text = "Total";

            GridView1.FooterRow.Cells[3].HorizontalAlign = HorizontalAlign.Right;
            GridView1.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Right;
            GridView1.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
            GridView1.FooterRow.Cells[6].HorizontalAlign = HorizontalAlign.Right;
            GridView1.FooterRow.Cells[7].HorizontalAlign = HorizontalAlign.Right;
            GridView1.FooterRow.Cells[8].HorizontalAlign = HorizontalAlign.Right;
            GridView1.FooterRow.Cells[9].HorizontalAlign = HorizontalAlign.Right;
            GridView1.FooterRow.Cells[10].HorizontalAlign = HorizontalAlign.Right;
           

            GridView1.FooterRow.Cells[4].Text = total.ToString("N2");
            int qty = dt.AsEnumerable().Sum(row => row.Field<int>("Quantity"));
            GridView1.FooterRow.Cells[4].Text = qty.ToString("N0");

            decimal gstAmt = dt.AsEnumerable().Sum(row => row.Field<decimal>("GSTAmt"));
            GridView1.FooterRow.Cells[7].Text = gstAmt.ToString("N2");

            // decimal gstAmt = dt.AsEnumerable().Sum(row => row.Field<decimal>("GSTAmount"));
            GridView1.FooterRow.Cells[8].Text = gstAmt.ToString("N2");

            // for IGST

            decimal igstAmt = dt.AsEnumerable().Sum(row => row.Field<decimal>("IGSTAmt"));
            GridView1.FooterRow.Cells[9].Text = igstAmt.ToString("N2");

            decimal subTotalAmt1 = dt.AsEnumerable().Sum(row => row.Field<decimal>("SubTotal1"));
            GridView1.FooterRow.Cells[10].Text = subTotalAmt1.ToString("N2");


            string gstCode = GetGstStateCodeByCustId(int.Parse(ddlCustomers.SelectedValue.ToString()));
            if (gstCode == "27")
            {
                GridView1.Columns[7].Visible = true;
                GridView1.Columns[8].Visible = true;
                GridView1.Columns[9].Visible = false;
            }
            else
            {
                GridView1.Columns[7].Visible = false;
                GridView1.Columns[8].Visible = false;
                GridView1.Columns[9].Visible = true;
            }
        }

        else
        {
            // emptycart.Visible = false;
            Session["Promotional"] = null;

            GridView1.Visible = false;
            //  btnChkOut.Visible = false;
            //  btnUpdateCart.Visible = false;
            //  btnContShopping.Visible = false;

            //  imgEmptcart.Visible = true;

            //   lblEmptyCart.Text = "Their is no item in your cart";
        }
    }
    private string GetGstStateCodeByCustId(int CustID)
    {
        string gstStateCode = "";
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetRegisterdCust";
        obj.AddParam("@CustomerID", CustID);
        dr = obj.ExecuteReader();

        if (dr.Read())
        {
            gstStateCode = dr["state_code_gst"].ToString();
        }
        return gstStateCode;
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
            UpdateCart(subTotal, shippingAmt, taxTotal, totalAmount, int.Parse(ddlCustomers.SelectedValue.ToString()));
            //if (Session["CustomerID"] != null)
            //{
            //    UpdateCart(subTotal, shippingAmt, taxTotal, totalAmount, int.Parse(Session["CustomerID"].ToString()));
            //}
            //else
            //{
            //    UpdateCart1(cartid, subTotal, shippingAmt, taxTotal, totalAmount);
            //}
        }
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
        obj1.AddParam("@OrderFrom", "Dealer");

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
        obj.AddParam("@OrderFrom", "Dealer");
        obj.AddParam("@DealerContactId", 0);
        obj.AddParam("@AdminUser", Session["AdminUserName"].ToString());


        int exe = obj.ExecuteNonQuery();
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
           // Label lblVat = row.FindControl("lblVat") as Label;

            int quantity = int.Parse(strQty.ToString());
            int id = int.Parse(lblId.Text.ToString());

            float price = float.Parse(lblPrice.Text.ToString());
            //float vat = float.Parse(lblVat.Text.ToString());

            // (Cart.Quantity * Cart.price+(Cart.price*vat/100)) as SubTotal1
            // float totalprice = (quantity * price) + (price * vat / 100);

            cartid = Session["CartID"].ToString();

            UpdateCart(quantity, 1, price, cartid, id.ToString());
            UpdateFinalCart(cartid);
            //GetfromCart(cartID);
            // Response.Redirect("viewcart.aspx");

            GetfromCart(cartid);


        }
    }
 
}