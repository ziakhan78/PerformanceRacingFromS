using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.Text;
using System.Net;
using System.IO;

public partial class cart_order_summary : System.Web.UI.Page
{
    public string action1 = string.Empty;
    public string hash1 = string.Empty;
    public string txnid1 = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            key.Value = ConfigurationManager.AppSettings["MERCHANT_KEY"];

            if (!IsPostBack)
            {
                
                string cartid = Session["CartID"].ToString();
                GetfromCart(cartid);


                // frmError.Visible = false; // error form
            }
            else
            {
                //frmError.Visible = true;
            }
            if (string.IsNullOrEmpty(Request.Form["hash"]))
            {
                btnChkOut.Visible = true;
            }
            else
            {
                btnChkOut.Visible = false;
            }

        }
        catch (Exception ex)
        {
            Response.Write("<span style='color:red'>" + ex.Message + "</span>");
        }

    }



    public string Generatehash512(string text)
    {

        byte[] message = Encoding.UTF8.GetBytes(text);

        UnicodeEncoding UE = new UnicodeEncoding();
        byte[] hashValue;
        SHA512Managed hashString = new SHA512Managed();
        string hex = "";
        hashValue = hashString.ComputeHash(message);
        foreach (byte x in hashValue)
        {
            hex += String.Format("{0:x2}", x);
        }
        return hex;

    }   
    private string PreparePOSTForm(string url, System.Collections.Hashtable data)      // post form
    {
        //Set a name for the form
        string formID = "PostForm";
        //Build the form using the specified data to be posted.
        StringBuilder strForm = new StringBuilder();
        strForm.Append("<form id=\"" + formID + "\" name=\"" +
                       formID + "\" action=\"" + url +
                       "\" method=\"POST\">");

        foreach (System.Collections.DictionaryEntry key in data)
        {

            strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                           "\" value=\"" + key.Value + "\">");
        }


        strForm.Append("</form>");
        //Build the JavaScript which will do the Posting operation.
        StringBuilder strScript = new StringBuilder();
        strScript.Append("<script language='javascript'>");
        strScript.Append("var v" + formID + " = document." +
                         formID + ";");
        strScript.Append("v" + formID + ".submit();");
        strScript.Append("</script>");
        //Return the form and the script concatenated.
        //(The order is important, Form then JavaScript)
        return strForm.ToString() + strScript.ToString();
    }
    private void GetfromCart(string cartid)
    {
        DBconnection obj = new DBconnection();        
        obj.SetCommandSP = "sc_GetProductsByCartid2";        
        obj.AddParam("@cartid", cartid);
        DataTable dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            decimal taxTotal, shippingTotal, totalAmt = 0;
            double subTotal = 0;
            double taxAmt = 0;
            //lblOrderNo.Text = "Order No. : " + dt.Rows[0]["OrderNo"].ToString();
            //lblSubTotal.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["SubTotal"].ToString()).ToString("n");
            //lblTax.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TaxTotal"].ToString()).ToString("n");
            //lblShippingTotal.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["ShippingTotal"].ToString()).ToString("n");
            //lblGrandTotal.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");
            //lblGrossAmount.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");

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


            //subTotal = Convert.ToDecimal(dt.Rows[0]["SubTotal"].ToString());
            //taxTotal = Convert.ToDecimal(dt.Rows[0]["IGSTAmt"].ToString());
            shippingTotal = Convert.ToDecimal(dt.Rows[0]["ShippingTotal"].ToString());
            totalAmt = Convert.ToDecimal(dt.Rows[0]["TotalAmount"].ToString());

            lblSubTotal.Text = "&#8377; " + string.Format("{0:n}", subTotal);
            //lblTax.Text = "&#8377; " + string.Format("{0:n0}", taxTotal);
            lblShippingTotal.Text = "&#8377; " + string.Format("{0:n0}", shippingTotal);
            lblGrandTotal.Text = "&#8377; " + string.Format("{0:n0}", totalAmt);
           // lblGrossAmount.Text = "&#8377; " + string.Format("{0:n0}", totalAmt);


            lblProduct.Text = dt.Rows[0]["product_name"].ToString();

            GridView1.Visible = true;

            GridView1.DataSource = dt;
            GridView1.DataBind();

            decimal subTotalAmt = decimal.Parse(dt.Rows[0]["TotalAmount"].ToString());
            lblGrandTotal1.Text = Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n0");

            //Calculate Sum and display in Footer Row

            //GridView1.FooterRow.Cells[1].Text = "Total";
            //decimal total = dt.AsEnumerable().Sum(row => row.Field<decimal>("price"));

            //GridView1.FooterRow.Cells[3].HorizontalAlign = HorizontalAlign.Right;
            //GridView1.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Right;
            //GridView1.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
            //GridView1.FooterRow.Cells[6].HorizontalAlign = HorizontalAlign.Right;
            //GridView1.FooterRow.Cells[7].HorizontalAlign = HorizontalAlign.Right;
            //GridView1.FooterRow.Cells[8].HorizontalAlign = HorizontalAlign.Right;
            //GridView1.FooterRow.Cells[4].Text = total.ToString("N2");

            //int qty = dt.AsEnumerable().Sum(row => row.Field<int>("Quantity"));
            //GridView1.FooterRow.Cells[3].Text = qty.ToString("N0");

            //decimal priceTotal = dt.AsEnumerable().Sum(row => row.Field<decimal>("price"));
            //GridView1.FooterRow.Cells[4].Text = priceTotal.ToString("N2");

            //decimal gstAmt = dt.AsEnumerable().Sum(row => row.Field<decimal>("GSTAmt"));
            //GridView1.FooterRow.Cells[5].Text = gstAmt.ToString("N2");

            //GridView1.FooterRow.Cells[6].Text = gstAmt.ToString("N2");

            //// for IGST
            //decimal igstAmt = dt.AsEnumerable().Sum(row => row.Field<decimal>("IGSTAmt"));
            //GridView1.FooterRow.Cells[7].Text = igstAmt.ToString("N2");

            //decimal subTotalAmt = dt.AsEnumerable().Sum(row => row.Field<decimal>("SubTotal1"));
            //GridView1.FooterRow.Cells[8].Text = subTotalAmt.ToString("N2");

            //if (Session["GstCode"] != null)
            //{
            //    string gstCode = Session["GstCode"].ToString();
            //    if (gstCode == "27")
            //    {
            //        GridView1.Columns[5].Visible = true;
            //        GridView1.Columns[6].Visible = true;
            //        GridView1.Columns[7].Visible = false;
            //    }
            //    else
            //    {
            //        GridView1.Columns[5].Visible = false;
            //        GridView1.Columns[6].Visible = false;
            //        GridView1.Columns[7].Visible = true;
            //    }
            //}
        }
        else
        {
            GridView1.Visible = false;
        }
    }   
    protected void btnChkOut_Click(object sender, EventArgs e)
    {
        try
        {
            GetCustomerDetails();

            string[] hashVarsSeq;
            string hash_string = string.Empty;

            if (string.IsNullOrEmpty(Request.Form["txnid"])) // generating txnid
            {
                Random rnd = new Random();
                string strHash = Generatehash512(rnd.ToString() + DateTime.Now);
                txnid1 = strHash.ToString().Substring(0, 20);
            }
            else
            {
                txnid1 = Request.Form["txnid"];
            }
            if (string.IsNullOrEmpty(Request.Form["hash"])) // generating hash value
            {
                //if (
                //    string.IsNullOrEmpty(ConfigurationManager.AppSettings["MERCHANT_KEY"]) ||
                //    string.IsNullOrEmpty(txnid1) ||
                //    string.IsNullOrEmpty(Request.Form["amount"]) ||
                //    string.IsNullOrEmpty(Request.Form["firstname"]) ||
                //    string.IsNullOrEmpty(Request.Form["email"]) ||
                //    string.IsNullOrEmpty(Request.Form["phone"]) ||
                //    string.IsNullOrEmpty(Request.Form["productinfo"]) ||
                //    string.IsNullOrEmpty(Request.Form["surl"]) ||
                //    string.IsNullOrEmpty(Request.Form["furl"])
                //    )
                //{
                //    //error

                //    frmError.Visible = true;
                //    return;
                //}

                //else
                //{
                //    frmError.Visible = false;

                hashVarsSeq = ConfigurationManager.AppSettings["hashSequence"].Split('|'); // spliting hash sequence from config
                hash_string = "";
                foreach (string hash_var in hashVarsSeq)
                {
                    if (hash_var == "key")
                    {
                        hash_string = hash_string + ConfigurationManager.AppSettings["MERCHANT_KEY"];
                        hash_string = hash_string + '|';
                    }
                    else if (hash_var == "txnid")
                    {
                        hash_string = hash_string + txnid1;
                        hash_string = hash_string + '|';
                    }
                    else if (hash_var == "amount")
                    {
                        hash_string = hash_string + Convert.ToDecimal(lblGrandTotal1.Text).ToString("g29");
                        hash_string = hash_string + '|';
                    }
                    else if (hash_var == "productinfo")
                    {
                        hash_string = hash_string + lblProduct.Text.Trim(); // Convert.ToDecimal(Request.Form[hash_var]).ToString("g29");                       
                        hash_string = hash_string + '|';
                    }
                    else if (hash_var == "firstname")
                    {
                        hash_string = hash_string + firstName.Value;  // Convert.ToDecimal(Request.Form[hash_var]).ToString("g29");                       
                        hash_string = hash_string + '|';
                    }
                    else if (hash_var == "email")
                    {
                        hash_string = hash_string + emailId.Value;  // Convert.ToDecimal(Request.Form[hash_var]).ToString("g29");                       
                        hash_string = hash_string + '|';
                    }

                    else
                    {
                        hash_string = hash_string + ""; // (Request.Form[hash_var] != null ? Request.Form[hash_var] : "");// isset if else                       
                        hash_string = hash_string + '|';
                    }
                }

                hash_string += ConfigurationManager.AppSettings["SALT"];    // appending SALT
                hash1 = Generatehash512(hash_string).ToLower();         //generating hash
                                                                        //action1 = ConfigurationManager.AppSettings["PAYU_BASE_URL"] + "/_payment";  // setting URL
                action1 = ConfigurationManager.AppSettings["PAYU_BASE_URL"];  // setting URL

            }


            //}


            else if (!string.IsNullOrEmpty(Request.Form["hash"]))
            {
                hash1 = Request.Form["hash"];
                // action1 = ConfigurationManager.AppSettings["PAYU_BASE_URL"] + "/_payment";
                action1 = ConfigurationManager.AppSettings["PAYU_BASE_URL"];
            }

            if (!string.IsNullOrEmpty(hash1))
            {
                hash.Value = hash1;
                txnid.Value = txnid1;

                System.Collections.Hashtable data = new System.Collections.Hashtable(); // adding values in gash table for data post
                data.Add("hash", hash.Value);
                data.Add("txnid", txnid.Value);
                data.Add("key", key.Value);
                string AmountForm = Convert.ToDecimal(lblGrandTotal1.Text).ToString("g29");// eliminating trailing zeros
                lblGrandTotal1.Text = AmountForm;
                data.Add("amount", AmountForm);
                data.Add("firstname", firstName.Value);
                data.Add("email", emailId.Value);
                data.Add("phone", phone.Value);
                data.Add("productinfo", lblProduct.Text.Trim());
               
                data.Add("surl", "https://performanceracing.in/cart/ResponseHandling.aspx");
               // data.Add("surl", "http://localhost:49539/cart/ResponseHandling.aspx");

                 data.Add("furl", "https://performanceracing.in/cart/ResponseHandling.aspx");
              // data.Add("furl", "http://localhost:49539/cart/ResponseHandling.aspx");
                data.Add("lastname", lastName.Value);
                
                 data.Add("curl", "https://performanceracing.in/cart/ResponseHandling.aspx");
               //data.Add("curl", "http://localhost:49539/cart/ResponseHandling.aspx");

                data.Add("address1", add1.Value);
                data.Add("address2", add2.Value);
                data.Add("city", city.Value);
                data.Add("state", state.Value);
                data.Add("country", country.Value);
                data.Add("zipcode", pin.Value);
                data.Add("udf1", "");
                data.Add("udf2", "");
                data.Add("udf3", "");
                data.Add("udf4", "");
                data.Add("udf5", "");
                data.Add("pg", "");


                //System.Collections.Hashtable data = new System.Collections.Hashtable(); // adding values in gash table for data post
                //data.Add("hash", hash.Value);
                //data.Add("txnid", txnid.Value);
                //data.Add("key", key.Value);
                ////string AmountForm = Convert.ToDecimal(amount.Text.Trim()).ToString("g29");// eliminating trailing zeros
                ////amount.Text = AmountForm;
                ////data.Add("amount", AmountForm);
                //data.Add("amount", 10);
                //data.Add("firstname", firstname.Text.Trim());
                //data.Add("email", email.Text.Trim());
                //data.Add("phone", phone.Text.Trim());
                //data.Add("productinfo", productinfo.Text.Trim());
                //data.Add("surl", surl.Text.Trim());
                //data.Add("furl", furl.Text.Trim());
                //data.Add("lastname", lastname.Text.Trim());
                //data.Add("curl", curl.Text.Trim());
                //data.Add("address1", address1.Text.Trim());
                //data.Add("address2", address2.Text.Trim());
                //data.Add("city", city.Text.Trim());
                //data.Add("state", state.Text.Trim());
                //data.Add("country", country.Text.Trim());
                //data.Add("zipcode", zipcode.Text.Trim());
                //data.Add("udf1", udf1.Text.Trim());
                //data.Add("udf2", udf2.Text.Trim());
                //data.Add("udf3", udf3.Text.Trim());
                //data.Add("udf4", udf4.Text.Trim());
                //data.Add("udf5", udf5.Text.Trim());
                //data.Add("pg", pg.Text.Trim());


                string strForm = PreparePOSTForm(action1, data);
                Page.Controls.Add(new LiteralControl(strForm));

            }

            else
            {
                //no hash

            }

        }

        catch (Exception ex)
        {
            Response.Write("<span style='color:red'>" + ex.Message + "</span>");
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Label lblQtyInStock = (Label)e.Row.FindControl("lblQtyInStock");
        Label lblColor = (Label)e.Row.FindControl("lblColor");
        Label lblHsn = (Label)e.Row.FindControl("lblHsn");

        if (lblColor != null)
        {
            lblColor.Text = "<br />Color: <b><i>" + lblColor.Text + "</i></b>";
        }

        if (lblHsn != null)
        {
            lblHsn.Text = "<br />HSN Code: <b><i>" + lblHsn.Text + "</i></b>";
        }

        Label lblSize = (Label)e.Row.FindControl("lblSize");
        if (lblSize != null)
        {
            lblSize.Text = "<br />Size: <b><i>" + lblSize.Text + "</i></b>";
        }


        Label lblImgPath = (Label)e.Row.FindControl("lblImgPath");
        if (lblImgPath != null)
        {
            string strImgPath = lblImgPath.Text;
            Image img1 = (Image)e.Row.FindControl("img1");

            string[] strImages = strImgPath.Split(',');
            //for (int i = 0; i <= strImages.Length - 1; i++)
            //{
            img1.Visible = true;
            img1.ImageUrl = "../ProductsImages/" + strImages[0].ToString();
            // }
        }
    }

    protected void GetCustomerDetails()
    {
        try
        {
            if (Session["CustomerID"] != null)
            {
                DataTable Baddrdt = new DataTable();
                DBconnection con = new DBconnection();
                con.SetCommandSP = "sc_GetCustAddress";
                con.AddParam("@CustomerID", Session["CustomerID"]);
                Baddrdt = con.ExecuteTable();

                foreach (DataRow custdr in Baddrdt.Rows)
                {  
                    firstName.Value = custdr["billFName"].ToString().Trim();
                    lastName.Value = custdr["billLName"].ToString().Trim();             
                    emailId.Value = custdr["email"].ToString().Trim();
                    
                    //Billing Address

                    phone.Value = custdr["billPhoneCC"].ToString().Trim() + custdr["billPhoneAC"].ToString().Trim() + custdr["billPhone"].ToString().Trim();
                    add1.Value = custdr["billAddress1"].ToString().Trim();
                    add2.Value = custdr["billAddress2"].ToString().Trim();
                    city.Value = custdr["billCity"].ToString().Trim();
                    pin.Value = custdr["bilZip"].ToString().Trim();
                    state.Value = custdr["state_name"].ToString().Trim();                   
                    country.Value = custdr["country_name"].ToString().Trim();

                    // Shiping Address

                    //phone.Value = custdr["sPhone1"].ToString().Trim()+ custdr["sPhone2"].ToString().Trim()+ custdr["sPhone3"].ToString().Trim(); 
                }
            }
        }
        catch { }
    }
}
