using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;


public partial class Admin_add_featured_latest_products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblHeading.Text = "Add Featured & Latest Products";         
           
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetManufacturer(id);
            }
        }
    }


    private void GetManufacturer(int id)
    {
        lblHeading.Text = "Edit Featured & Latest Products";
        MastersBLL obj = new MastersBLL();
        obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetManufacturer();
        if (dt.Rows.Count > 0)
        {
           
            string strLogo = dt.Rows[0]["logo"].ToString();

            if (strLogo != "")
            {
               
                Session["imgLogo"] = strLogo;
            }

           
        }

    }
    private void AddManufacturer()
    {
        try
        {
            MastersBLL obj = new MastersBLL();
            //obj.ManufacturerName = txtManufacturer.Text.Trim().ToString();
            try
            {
                obj.Logo = Session["imgLogo"].ToString();
            }
            catch
            {
                obj.Logo = "";
            }
            int i = obj.AddManufacturer();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('Manufacturer Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateManufacturer(int id)
    {
        try
        {
            MastersBLL obj = new MastersBLL();
            obj.Id = id;
            //obj.ManufacturerName = txtManufacturer.Text.Trim().ToString();
            try
            {
                obj.Logo = Session["imgLogo"].ToString();
            }
            catch
            {
                obj.Logo = "";
            }

            int i = obj.UpdateManufacturer();

            if (i > 0)
            {

                Clear();
                showmsg("Manufacturer Has Been Updated Successfully", "view_manufacturer_master.aspx");


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
      
       Session["imgLogo"] = null;
    }   
   
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateManufacturer(id);
            }
            else
            {
                AddManufacturer();
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
   
}