using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_add_hsn_master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnSubmit.Text = "Submit";
            Session["value"] = null;
            lblHeading.Text = "Add HS Code, GST & Custom Duty Master";           
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetHSCodeMaster(id);
            }
        }
    }
    private void GetHSCodeMaster(int id)
    {
        HSCodeBll obj = new HSCodeBll();
        obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetHSCodeMasterById();
        if (dt.Rows.Count > 0)
        {
            btnSubmit.Text = "Update";
            Session["value"] = "update";
            lblHeading.Text = "Edit HS Code, GST & Custom Duty Master";
            txtHSCode.Text = dt.Rows[0]["HSCode"].ToString();           
            txtCustomDuty.Text = dt.Rows[0]["CustomDuty"].ToString();
            string strGST = dt.Rows[0]["VAT"].ToString();
            //txtVat.Text = dt.Rows[0]["VAT"].ToString();


            ddlGST.SelectedIndex = 1;
            ddlGST.SelectedItem.Text = strGST;


        }

    }
    private void AddHSCodeMaster()
    {
        try
        {
            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            HSCodeBll obj = new HSCodeBll();
            obj.HSCode = txtHSCode.Text.Trim().ToString();
            try
            {
                obj.CustomDuty = Convert.ToDecimal(txtCustomDuty.Text.Trim().ToString());
            }
            catch { obj.CustomDuty = 0; }
            obj.Vat = Convert.ToDecimal(ddlGST.SelectedItem.Text.Trim().ToString());          
            obj.Ipaddress = ipaddress;
            int i = obj.AddHSCodeMaster();

            if (i > 0)
            {
                Session["value"] = "update";
                btnSubmit.Text = "Update";

                Clear();
                string jv = "<script>alert('Duty & Tax Master Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateHSCodeMaster(int id)
    {
        try
        {
            HSCodeBll obj = new HSCodeBll();
            obj.Id = id; 
            obj.HSCode = txtHSCode.Text.Trim().ToString();
            try
            {
                obj.CustomDuty = Convert.ToDecimal(txtCustomDuty.Text.Trim().ToString());
            }
            catch { obj.CustomDuty = 0; }
            obj.Vat = Convert.ToDecimal(ddlGST.SelectedItem.Text.Trim().ToString());

            int i = obj.UpdateHSCodeMaster();

            if (i > 0)
            {
                Clear();
                ShowMsg("Costing & Tax Master Has Been Updated Successfully", "view_hsn_master.aspx");

                //string jv = "<script>alert('Duty & Tax Master Has Been Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }   
    private void Clear()
    {
        txtHSCode.Text = "";
        txtCustomDuty.Text = "";
        ddlGST.SelectedIndex = 0;
    } 
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateHSCodeMaster(id);
            }
            else
            {
                AddHSCodeMaster();
            }
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
            CVHScode.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select HSCode from hs_code_master_tbl where HSCode='" + txtHSCode.Text.Trim().ToString() + "'";
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