using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_add_dealer_costing_tax_master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnSubmit.Text = "Submit";
            Session["value"] = null;
            lblHeading.Text = "Add Dealers Costing";
            GetCostingTaxMaster();            
        }
    }
    private void GetCostingTaxMaster()
    {
        CostingTaxBLL obj = new CostingTaxBLL();
        //obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetDealerCostingTaxMaster();
        if (dt.Rows.Count > 0)
        {
            btnSubmit.Text = "Update";
            Session["value"] = "update";
            lblHeading.Text = "Edit Dealers Costing";
            txtVat.Text = dt.Rows[0]["vat"].ToString();
            txtDealerDis.Text = dt.Rows[0]["discount"].ToString();
            txtVatCst.Text = dt.Rows[0]["vat_cst"].ToString();          
           
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
            obj.Vat = Convert.ToDecimal(txtVat.Text.Trim().ToString());
            obj.Margin = Convert.ToDecimal(txtDealerDis.Text.Trim().ToString());
            obj.VatCst = Convert.ToDecimal(txtVatCst.Text.Trim().ToString());          
           
            obj.Ipaddress = ipaddress;
            int i = obj.AddDealerCostingTaxMaster();

            if (i > 0)
            {
                Session["value"] = "update";
                btnSubmit.Text = "Update";

                //Clear();
                string jv = "<script>alert('Dealer Costing Has Been Added Successfully');</script>";
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
            obj.Vat = Convert.ToDecimal(txtVat.Text.Trim().ToString());
            obj.Margin = Convert.ToDecimal(txtDealerDis.Text.Trim().ToString());
            obj.VatCst = Convert.ToDecimal(txtVatCst.Text.Trim().ToString());             

            int i = obj.UpdateDealerCostingTaxMaster();

            if (i > 0)
            {

               // Clear();
               // ShowMsg("Costing & Tax Master Has Been Updated Successfully", "view_costing_tax_master.aspx");


                string jv = "<script>alert('Dealer Costing Has Been Updated Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }   
    private void Clear()
    {      
        txtDealerDis.Text = "";       
        txtVatCst.Text = "";
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