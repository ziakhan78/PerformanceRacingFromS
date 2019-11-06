using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_add_costing_tax_master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnSubmit.Text = "Submit";
            Session["value"] = null;
            lblHeading.Text = "Add Duty & Tax Master";
            GetCostingTaxMaster();
            //if (Request.QueryString["id"] != null)
            //{
            //    int id = int.Parse(Request.QueryString["id"].ToString());
            //    GetCostingTaxMaster(id);
            //}
        }
    }
    private void GetCostingTaxMaster()
    {
        CostingTaxBLL obj = new CostingTaxBLL();
        //obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetCostingTaxMaster();
        if (dt.Rows.Count > 0)
        {
            btnSubmit.Text = "Update";
            Session["value"] = "update";
            lblHeading.Text = "Edit Duty & Tax Master";
            txtBcd.Text = dt.Rows[0]["BasicCustomDuty"].ToString();
            txtCvd.Text = dt.Rows[0]["CVD"].ToString();
            txtSad.Text = dt.Rows[0]["SAD"].ToString();
            txtCustomCess.Text = dt.Rows[0]["CustomCess"].ToString();
            txtFrieghtCha.Text = dt.Rows[0]["FrieghtCHA"].ToString();
            txtOctroi.Text = dt.Rows[0]["Octroi"].ToString();
            txtVat.Text = dt.Rows[0]["VAT"].ToString();
            txtMarginForDealer.Text = dt.Rows[0]["MarginForDealer"].ToString();
            txtMargin.Text = dt.Rows[0]["Margin"].ToString();
        }

    }
    private void AddCostingTaxMaster()
    {
        try
        {
            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            CostingTaxBLL obj = new CostingTaxBLL();
            obj.BasicCustomDuty = Convert.ToDecimal(txtBcd.Text.Trim().ToString());
            obj.Cvd = Convert.ToDecimal(txtCvd.Text.Trim().ToString());
            obj.Sad = Convert.ToDecimal(txtSad.Text.Trim().ToString());
            obj.CustomCess = Convert.ToDecimal(txtCustomCess.Text.Trim().ToString());
            obj.FrieghtCha = Convert.ToDecimal(txtFrieghtCha.Text.Trim().ToString());
            obj.Octroi = Convert.ToDecimal(txtOctroi.Text.Trim().ToString());
            obj.Vat = Convert.ToDecimal(txtVat.Text.Trim().ToString());
            obj.MarginForDealer = Convert.ToDecimal(txtMarginForDealer.Text.Trim().ToString());
            obj.Margin = Convert.ToDecimal(txtMargin.Text.Trim().ToString());
            obj.Ipaddress = ipaddress;
            int i = obj.AddCostingTaxMaster();

            if (i > 0)
            {
                Session["value"] = "update";
                btnSubmit.Text = "Update";

                //Clear();
                string jv = "<script>alert('Duty & Tax Master Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateCostingTaxMaster()
    {
        try
        {
            CostingTaxBLL obj = new CostingTaxBLL();
           // obj.Id = id;
            obj.BasicCustomDuty = Convert.ToDecimal(txtBcd.Text.Trim().ToString());
            obj.Cvd = Convert.ToDecimal(txtCvd.Text.Trim().ToString());
            obj.Sad = Convert.ToDecimal(txtSad.Text.Trim().ToString());
            obj.CustomCess = Convert.ToDecimal(txtCustomCess.Text.Trim().ToString());
            obj.FrieghtCha = Convert.ToDecimal(txtFrieghtCha.Text.Trim().ToString());
            obj.Octroi = Convert.ToDecimal(txtOctroi.Text.Trim().ToString());
            obj.Vat = Convert.ToDecimal(txtVat.Text.Trim().ToString());
            obj.MarginForDealer = Convert.ToDecimal(txtMarginForDealer.Text.Trim().ToString());
            obj.Margin = Convert.ToDecimal(txtMargin.Text.Trim().ToString());

            int i = obj.UpdateCostingTaxMaster();

            if (i > 0)
            {

               // Clear();
               // ShowMsg("Costing & Tax Master Has Been Updated Successfully", "view_costing_tax_master.aspx");


                string jv = "<script>alert('Duty & Tax Master Has Been Updated Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }   
    private void Clear()
    {
        txtBcd.Text = "";
        txtCustomCess.Text = "";
        txtCvd.Text = "";
        txtFrieghtCha.Text = "";
        txtMargin.Text = "";
        txtMarginForDealer.Text = "";
        txtOctroi.Text = "";
        txtSad.Text = "";
        txtVat.Text = "";
    } 
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Session["value"] != null)
            {               
                UpdateCostingTaxMaster();
            }
            else
            {
                AddCostingTaxMaster();
            }


            //if (Request.QueryString["id"] != null)
            //{
            //    int id = int.Parse(Request.QueryString["id"].ToString());
            //    UpdateCostingTaxMaster(id);
            //}
            //else
            //{
            //    AddCostingTaxMaster();
            //}
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
   
}