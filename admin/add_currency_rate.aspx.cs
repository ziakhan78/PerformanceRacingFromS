using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class admin_add_currency_rate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {           
            lblHeading.Text = "Add Currency Rate";
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetCurrencyRate(id);
            }
        }
    }
    private void GetCurrencyRate(int id)
    {
        MastersBLL obj = new MastersBLL();
        obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetCurrencyRateById();
        if (dt.Rows.Count > 0)
        {
            lblHeading.Text = "Edit Currency Rate";
            ddlCurrency.SelectedItem.Text = dt.Rows[0]["currency"].ToString();
            ddlCurrency.SelectedValue = dt.Rows[0]["currency"].ToString();
            txtCurrencyRate.Text = dt.Rows[0]["rate"].ToString();
        }

    }
    private void AddCurrencyRate()
    {
        try
        {
            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            MastersBLL obj = new MastersBLL();
            obj.Currency = ddlCurrency.SelectedItem.Text.Trim().ToString();
            obj.CurrencyRate = decimal.Parse(txtCurrencyRate.Text.Trim().ToString());
            obj.Ipaddress = ipaddress;

            int i = obj.AddCurrencyRate();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('Currency Rate Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateCurrencyRate(int id)
    {
        try
        {
            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            MastersBLL obj = new MastersBLL();
            obj.Id = id;
            obj.Currency = ddlCurrency.SelectedItem.Text.Trim().ToString();
            obj.CurrencyRate = decimal.Parse(txtCurrencyRate.Text.Trim().ToString());
            obj.Ipaddress = ipaddress;
            int i = obj.UpdateCurrencyRate();

            if (i > 0)
            {
                Clear();
                   
                //string jv = "<script>alert('Currency Rate Has Been Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                showmsg("Currency Rate Has Been Updated Successfully", "view_currency_rate.aspx");
            }
        }
        catch { }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    private void Clear()
    {
        txtCurrencyRate.Text = "";
    }   
   
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateCurrencyRate(id);
            }
            else
            {
                AddCurrencyRate();
            }
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
    protected void CVCurrency_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVCurrency.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select currency from currency_rate_tbl where currency='" + ddlCurrency.SelectedItem.Text.Trim().ToString() + "'";
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

    
}