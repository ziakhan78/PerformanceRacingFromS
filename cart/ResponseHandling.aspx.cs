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
using System.IO;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;
using System.Linq;

public partial class ResponseHandling : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Panel2.Visible = false;

            string[] merc_hash_vars_seq;
            string merc_hash_string = string.Empty;
            string merc_hash = string.Empty;
            string txnId = string.Empty;
            string key = string.Empty;
            string amount = string.Empty;
            string productinfo = string.Empty;
            string email = string.Empty;
            string firstname = string.Empty;

            string hash_seq = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
            string s = Request.Form["status"];

            string txnStatus = "";
            string strCartId = Session["CartID"].ToString();
            int intCustId = int.Parse(Session["CustomerID"].ToString());
            string StrEmail = Session["UserEmail"].ToString();

            decimal totalAmtfromCart = GetfromCart(strCartId);

            amount = Request.Form["amount"];
            amount = amount.Remove(amount.Length - 3);
            decimal amtFromPayU = Convert.ToDecimal(amount);
            txnId = Request.Form["txnid"];
            txnStatus = Request.Form["status"].ToLower();

            bool b = IfTransactionKeyExist(txnId);
            if (b == true)
            {
                Response.Write("Transaction Failed.");
            }

            else if (totalAmtfromCart == amtFromPayU)
            {
                if (txnStatus == "success" || txnStatus == "captured")
                {
                    merc_hash_vars_seq = hash_seq.Split('|');
                    Array.Reverse(merc_hash_vars_seq);
                    merc_hash_string = ConfigurationManager.AppSettings["SALT"] + "|" + Request.Form["status"];

                    foreach (string merc_hash_var in merc_hash_vars_seq)
                    {
                        merc_hash_string += "|";
                        merc_hash_string = merc_hash_string + (Request.Form[merc_hash_var] != null ? Request.Form[merc_hash_var] : "");
                    }

                    merc_hash = Generatehash512(merc_hash_string).ToLower();

                    if (merc_hash != Request.Form["hash"])
                    {
                        Response.Write("Hash value did not matched");
                    }
                    else
                    {
                        txnId = Request.Form["txnid"];
                        txnStatus = Request.Form["status"];
                        //lblStatus.Text = txnStatus;
                        //lblTxn.Text = txnId;
                        amount = Request.Form["amount"];
                        // lblAmt.Text = amount;
                        email = Request.Form["email"];
                        //lblEmail.Text = email;
                        productinfo = Request.Form["productinfo"];
                        // lblProduct.Text = productinfo;
                        key = Request.Form["key"];
                        // lblKey.Text = key;
                        firstname = Request.Form["firstname"];
                        // lblName.Text = firstname;

                        GetCustomerDetails(intCustId);
                        SendOrderMailtoClient(strCartId, StrEmail, intCustId);
                        UpdateCartTbl(strCartId, intCustId, txnId.ToString(), txnStatus);

                        GetProDetailinCartByCartId(strCartId);

                        Panel2.Visible = true;
                        Session.Abandon();

                        //Response.Write("value matched");
                        //Hash value did not matched
                    }
                }
                else
                {
                    Panel2.Visible = false;
                    txnId = Request.Form["txnid"];
                    txnStatus = Request.Form["status"];
                    amount = Request.Form["amount"];
                    email = Request.Form["email"];
                    productinfo = Request.Form["productinfo"];
                    key = Request.Form["key"];
                    firstname = Request.Form["firstname"];
                    UpdateCartTbl(strCartId, intCustId, txnId.ToString(), txnStatus);
                    Session.Abandon();
                }

            }

            else
            {
                Response.Write("Transaction Failed.");
            }
        }

        catch (Exception ex)
        {
            Response.Write("<span style='color:red'>" + ex.Message + "</span>" + "<a href='https://performanceracing.in/'> Go to Website </a>");
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

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }

    private void SendOrderMailtoClient(string strCartId, string strEmail, int custId)
    {
        string strBAdd = ""; string strBCityZip = ""; string strSAdd = ""; string strSCityZip = ""; string strBName = ""; string strSName = "";
        string strBPh = ""; string strBCell = ""; string strSPh = ""; string strSCell = ""; string strPlace = ""; string strGstin = ""; string strComp = "";

        try
        {
            try
            {
                DataTable dt1 = new DataTable();
                CustomersBLL obj1 = new CustomersBLL();
                obj1.Id = custId;
                dt1 = obj1.GetCustomer();

                if (dt1.Rows.Count > 0)
                {
                    // Billing Address

                    string custType = dt1.Rows[0]["Customer_Type"].ToString();
                    if (custType == "Company")
                    {
                        strComp = dt1.Rows[0]["Company_Name"].ToString() + "<br />" + dt1.Rows[0]["billFName"].ToString() + " " + dt1.Rows[0]["billLName"].ToString();
                    }
                    else
                    {
                        strComp = dt1.Rows[0]["billFName"].ToString() + " " + dt1.Rows[0]["billLName"].ToString();
                    }

                    strBName = dt1.Rows[0]["billFName"].ToString() + " " + dt1.Rows[0]["billLName"].ToString();

                    strBAdd = dt1.Rows[0]["billAddress1"].ToString() + " " + dt1.Rows[0]["billAddress2"].ToString();
                    strBCityZip = dt1.Rows[0]["billCity"].ToString() + "-" + dt1.Rows[0]["billZip"].ToString();
                    strBCell = "Cell: " + dt1.Rows[0]["billMobileCC"].ToString() + dt1.Rows[0]["billMobile"].ToString();
                    strBPh = "Tel: " + dt1.Rows[0]["billPhoneCC"].ToString() + "-" + dt1.Rows[0]["billPhoneAc"].ToString() + "-" + dt1.Rows[0]["billPhone"].ToString();
                    strPlace = "Place of Supply: " + dt1.Rows[0]["state_name"].ToString() + " (" + dt1.Rows[0]["state_2_code"].ToString() + " - " + dt1.Rows[0]["state_code_gst"].ToString() + ")";
                    strGstin = "GSTIN: " + dt1.Rows[0]["GSTIN"].ToString();

                    // Shipping Address

                    strSName = dt1.Rows[0]["sFName"].ToString() +" "+ dt1.Rows[0]["sLName"].ToString();
                    strSAdd = dt1.Rows[0]["sAddress1"].ToString() + " " + dt1.Rows[0]["sAddress2"].ToString();
                    strSCityZip = dt1.Rows[0]["sCity"].ToString() + "-" + dt1.Rows[0]["sZip"].ToString();
                    strSPh = "Tel: " + dt1.Rows[0]["sPhoneCC"].ToString() + "-" + dt1.Rows[0]["sPhoneAc"].ToString() + "-" + dt1.Rows[0]["sPhone"].ToString(); 
                    strSCell = "Cell: " + dt1.Rows[0]["sMobileCC"].ToString() + dt1.Rows[0]["sMobile"].ToString(); 
                   
                }
            }
            catch { }

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "sc_GetProductsByCartid2";
            obj.AddParam("@cartid", strCartId);
            DataTable dt = obj.ExecuteTable();

            if (dt.Rows.Count > 0)
            {
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

                //GridView2.FooterRow.Cells[4].Text = total.ToString("N2");

                int qty = dt.AsEnumerable().Sum(row => row.Field<int>("Quantity"));
                GridView1.FooterRow.Cells[3].Text = qty.ToString("N0");

                decimal gstAmt = dt.AsEnumerable().Sum(row => row.Field<decimal>("GSTAmt"));
                GridView1.FooterRow.Cells[5].Text = gstAmt.ToString("N2");

                // decimal gstAmt = dt.AsEnumerable().Sum(row => row.Field<decimal>("GSTAmount"));
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

                DateTime orderDate;
                string ReadFileName = "";
                MailMessage mail = new MailMessage();
                mail.To.Add(strEmail);
               mail.To.Add("sales@performanceracing.in");
                mail.From = new MailAddress("mail@performanceracing.in");
                mail.Bcc.Add("zia@goradiainfotech.com");
                mail.Bcc.Add("vickyj@performanceracing.in");
                mail.Bcc.Add("prasad@performanceracing.in");
                mail.Bcc.Add("ds1@performanceracing.in");

                mail.Subject = "Online Order Confirmation";

                mail.IsBodyHtml = true;
                string PathVal = Server.MapPath("~");
                ReadFileName = PathVal + "/Mail/order_mail.htm";
                string strMessage = "";
                StreamReader sr1 = new StreamReader(ReadFileName);
                strMessage = sr1.ReadToEnd();

                // Billing Address

                strMessage = strMessage.Replace("XXXName", strBName);
                strMessage = strMessage.Replace("XXXComp", strComp);
                
                strMessage = strMessage.Replace("XXXAdd", strBAdd);
                strMessage = strMessage.Replace("XXXCity", strBCityZip);
                strMessage = strMessage.Replace("XXXPh", strBPh);
                strMessage = strMessage.Replace("XXXCell", strBCell);
                strMessage = strMessage.Replace("XXXPlace", strPlace);
                strMessage = strMessage.Replace("XXXGSTIN", strGstin);

                // Shipping Address
                strMessage = strMessage.Replace("XXXSName", strSName);
                strMessage = strMessage.Replace("XXXShipA", strSAdd);
                strMessage = strMessage.Replace("XXXSC", strSCityZip);
                strMessage = strMessage.Replace("XXXSPh", strSPh);
                strMessage = strMessage.Replace("XXXMobS", strSCell);
               

                // Order Details
                strMessage = strMessage.Replace("XXXOrderNo", "Invoice No.: " + dt.Rows[0]["OrderNo"].ToString());
                orderDate = DateTime.Parse(dt.Rows[0]["CreatedOn"].ToString());
                string strDate = orderDate.ToString("dd MMMM yyyy");
                strMessage = strMessage.Replace("XXXdate", "Invoice Date: " + strDate);

                // Payment Details
                strMessage = strMessage.Replace("XXXSub", "Total Before Tax: " + Convert.ToDouble(dt.Rows[0]["SubTotal"].ToString()).ToString("n"));
                strMessage = strMessage.Replace("XXXTax", "Total Tax Amount: " + Convert.ToDouble(dt.Rows[0]["IGSTAmt"].ToString()).ToString("n"));
                strMessage = strMessage.Replace("XXXShip", "Shipping: " + Convert.ToDouble(dt.Rows[0]["ShippingTotal"].ToString()).ToString("n")); 
                strMessage = strMessage.Replace("XXXRounded", "Rounded Off: " + dt.Rows[0]["Rounded"].ToString());
                strMessage = strMessage.Replace("XXXTotal", "Total Amount: &#8377;" + Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n0"));



                mail.Body += strMessage;

                //mail.Body = GetGridviewData(GridView1);
                strMessage = strMessage.Replace("XXXlist", GetGridviewData(GridView1));
                mail.Body = strMessage;
                sr1.Close();

                //mail.IsBodyHtml = true;
                // Create the credentials to login to the gmail account associated with my custom domain 

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

                // showmsg("Thank you for your order. An e-invoice with your order details has been sent to your registered email-id.", "../Default.aspx");
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

    protected void GetCustomerDetails(int custId)
    {
        try
        {

            DataTable dt = new DataTable();
            CustomersBLL obj = new CustomersBLL();
            obj.Id = custId;
            dt = obj.GetCustomer();

            if (dt.Rows.Count > 0)
            {
                // Billing Address

                //string strBName = dt.Rows[0]["billFName"].ToString() + dt.Rows[0]["billLName"].ToString();
                string strBAdd = dt.Rows[0]["billAddress1"].ToString() + "<br />" + dt.Rows[0]["billAddress2"].ToString();
                string strBCityZip = dt.Rows[0]["billCity"].ToString() + "-" + dt.Rows[0]["billZip"].ToString();


                // Shipping Address

                //  string strSName = dt.Rows[0]["billFName"].ToString() + dt.Rows[0]["billLName"].ToString();
                string strSAdd = dt.Rows[0]["sAddress1"].ToString() + "<br />" + dt.Rows[0]["sAddress2"].ToString();
                string strSCityZip = dt.Rows[0]["sCity"].ToString() + "-" + dt.Rows[0]["sZip"].ToString();
            }

        }
        catch { }
    }

    private void UpdateCartTbl(string cartId, int custId, string txnId, string txnStatus)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "sc_UpdateCart_Tbl_after_sucess_pg";
            obj.AddParam("@Cart_Id", cartId);
            obj.AddParam("@Cust_Id", custId);
            obj.AddParam("@TxnId", txnId);
            obj.AddParam("@TxnStatus", txnStatus);
            int exe = obj.ExecuteNonQuery();
        }
        catch { }
    }


    private void GetProDetailinCartByCartId(string cartid)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetProDetailsFromCartByCartId";
        obj.AddParam("@cartid", cartid);
        DataTable dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                string pid = row["ProductID"].ToString();
                string size = row["Size"].ToString();
                string color = row["Color"].ToString();
                int sold_qty = int.Parse(row["Quantity"].ToString());

                UpdateQtyinProQtyTbl(pid, size, color, sold_qty);
            }
        }
    }

    private void UpdateQtyinProQtyTbl(string pid, string size, string color, int sold_qty)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateQtyInProductQuantityTbl";
            obj.AddParam("@pid", pid);
            obj.AddParam("@size", size);
            obj.AddParam("@color", color);
            obj.AddParam("@sold_qty", sold_qty);
            int exe = obj.ExecuteNonQuery();
        }
        catch { }

    }

    private decimal GetfromCart(string cartid)
    {
        decimal totalAmt = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetProductsByCartid2";
        obj.AddParam("@cartid", cartid);
        DataTable dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            //double subTotal = 0;
            //double taxAmt = 0;            
            //lblOrderNo.Text = "Order No. : " + dt.Rows[0]["OrderNo"].ToString();
            //lblSubTotal.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["SubTotal"].ToString()).ToString("n");
            //lblTax.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TaxTotal"].ToString()).ToString("n");
            //lblShippingTotal.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["ShippingTotal"].ToString()).ToString("n");
            //lblGrandTotal.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n");
            //lblGrossAmount.Text = "&#8377; " + Convert.ToDouble(dt.Rows[0]["TotalAmount"].ToString()).ToString("n"); 
            //subTotal = Convert.ToDecimal(dt.Rows[0]["SubTotal"].ToString());
            //taxTotal = Convert.ToDecimal(dt.Rows[0]["IGSTAmt"].ToString());
            //shippingTotal = Convert.ToDecimal(dt.Rows[0]["ShippingTotal"].ToString());
            string amt = Convert.ToDecimal(dt.Rows[0]["TotalAmount"].ToString()).ToString("n0");
            totalAmt = Convert.ToDecimal(amt);
        }
        return totalAmt;
    }

    private bool IfTransactionKeyExist(string txnId)
    {
        bool b = false;

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetTransactionKey";
        obj.AddParam("@TxnId", txnId);
        DataTable dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            b = true;
        }
        return b;
    }
}