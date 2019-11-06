using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_add_pincode_delivery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetPincodeDelivery(id);
            }
        }
    }
    private void GetPincodeDelivery(int id)
    {
        PincodeDeliveryBLL objPincodeDelivery = new PincodeDeliveryBLL();
        objPincodeDelivery.Id = id;
        DataTable dt = new DataTable();
        dt = objPincodeDelivery.GetPincodeDelivery();
        if (dt.Rows.Count > 0)
        {
            string strServiceAvailable, strCod, strShipping;
            ddlState.SelectedItem.Text = dt.Rows[0]["state_name"].ToString();
            ddlCity.SelectedItem.Text = dt.Rows[0]["city_name"].ToString();
            txtPincode.Text = dt.Rows[0]["pincode"].ToString();
            
            strShipping = dt.Rows[0]["free_shipping"].ToString();
            if (strShipping == "True")
                chkFreeDil.Checked = true;
            else
                chkFreeDil.Checked = false;

            strCod = dt.Rows[0]["cod"].ToString();
            if (strCod == "True")
                chkIsCod.Checked = true;
            else
                chkIsCod.Checked = false;

            strServiceAvailable = dt.Rows[0]["status"].ToString();
            if (strServiceAvailable == "True")
                chkServiceAvailable.Checked = true;
            else
                chkServiceAvailable.Checked = false;

            txtTranspotationTime.Text = dt.Rows[0]["transportation_time"].ToString();
        }
    }
    private void AddPincodeDelivery()
    {
        try
        {
            bool bCod = chkIsCod.Checked;
            bool bFreeDelivery = chkFreeDil.Checked;
            bool bServiceAvailable = chkServiceAvailable.Checked;

            PincodeDeliveryBLL objPincodeDelivery = new PincodeDeliveryBLL();
            objPincodeDelivery.State = ddlState.SelectedItem.Text.Trim();
            objPincodeDelivery.City = ddlCity.SelectedItem.Text.Trim();
            objPincodeDelivery.Pincode = txtPincode.Text.Trim();
            objPincodeDelivery.ServiceAvailable = bServiceAvailable;
            objPincodeDelivery.Cod = bCod;
            objPincodeDelivery.Shipping = bFreeDelivery;
            objPincodeDelivery.TransportationTime = int.Parse(txtTranspotationTime.Text.Trim());           

            int i = objPincodeDelivery.AddPincodeDelivery();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('Pincode Delivery Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdatePincodeDelivery(int id)
    {
        try
        {
            bool bCod = chkIsCod.Checked;
            bool bFreeDelivery = chkFreeDil.Checked;
            bool bServiceAvailable = chkServiceAvailable.Checked;
            PincodeDeliveryBLL objPincodeDelivery = new PincodeDeliveryBLL();
            objPincodeDelivery.Id = id;
            objPincodeDelivery.State = ddlState.SelectedItem.Text.Trim();
            objPincodeDelivery.City = ddlCity.SelectedItem.Text.Trim();
            objPincodeDelivery.Pincode = txtPincode.Text.Trim();
            objPincodeDelivery.ServiceAvailable = bServiceAvailable;
            objPincodeDelivery.Cod = bCod;
            objPincodeDelivery.Shipping = bFreeDelivery;
            objPincodeDelivery.TransportationTime = int.Parse(txtTranspotationTime.Text.Trim());

            int i = objPincodeDelivery.UpdatePincodeDelivery();

            if (i > 0)
            {

                Clear();
                showmsg("Pincode Delivery Has Been Updated Successfully", "view_pincode.aspx");


                //string jv = "<script>alert('Occasion Has Been Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
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
       // txtPincodeDelivery.Text = "";
    }   
   
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdatePincodeDelivery(id);
            }
            else
            {
                AddPincodeDelivery();
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
    protected void CVColor_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
          //  CVColor.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
               // obj.SetCommandQry = "select PincodeDelivery_name from PincodeDelivery_master_tbl where PincodeDelivery_name='" + txtPincodeDelivery.Text.Trim().ToString() + "'";
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