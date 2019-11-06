using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_shipping_agent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetSupplier(id);
            }
        }
    }
    private void GetSupplier(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetSupplier";

        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            txtCompanyName.Text = dt.Rows[0]["CompanyName"].ToString();
            txtAddress1.Text = dt.Rows[0]["Address1"].ToString();
            txtAddress2.Text = dt.Rows[0]["Address2"].ToString();

            txtPhCC1.Text = dt.Rows[0]["PhoneCC1"].ToString();
            txtPhAC1.Text = dt.Rows[0]["PhoneAC1"].ToString();
            txtPhone1.Text = dt.Rows[0]["Phone1"].ToString();

            txtPhCC2.Text = dt.Rows[0]["PhoneCC2"].ToString();
            txtPhAC2.Text = dt.Rows[0]["PhoneAC2"].ToString();
            txtPhone2.Text = dt.Rows[0]["Phone2"].ToString();

            txtFaxCC1.Text = dt.Rows[0]["FaxCC"].ToString();
            txtFaxAC1.Text = dt.Rows[0]["FaxAC"].ToString();
            txtFax1.Text = dt.Rows[0]["Fax"].ToString();

            txtZip.Text = dt.Rows[0]["Zip"].ToString();
            txtCity.Text = dt.Rows[0]["City"].ToString();
            txtState.Text = dt.Rows[0]["State"].ToString();
            
            txtWebsite.Text = dt.Rows[0]["Website"].ToString();
        }

    }
    private void AddSupplier()
    {
        try
        {

            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddSupplier";
            obj.AddParam("@CompanyName", txtCompanyName.Text.Trim().ToString());
            obj.AddParam("@Address1", txtAddress1.Text.Trim().ToString());
            obj.AddParam("@Address2", txtAddress2.Text.Trim().ToString());
            obj.AddParam("@Zip", txtZip.Text.Trim().ToString());
            obj.AddParam("@City", txtCity.Text.Trim().ToString());
            obj.AddParam("@State", txtState.Text.Trim().ToString());
           
            obj.AddParam("@Website", txtWebsite.Text.Trim().ToString());
            obj.AddParam("@FaxCC", txtFaxCC1.Text.Trim().ToString());
            obj.AddParam("@FaxAC", txtFaxAC1.Text.Trim().ToString());
            obj.AddParam("@Fax", txtFax1.Text.Trim().ToString());
            obj.AddParam("@PhoneCC1", txtPhCC1.Text.Trim().ToString());
            obj.AddParam("@PhoneAC1", txtPhAC1.Text.Trim().ToString());
            obj.AddParam("@Phone1", txtPhone1.Text.Trim().ToString());
            obj.AddParam("@PhoneCC2", txtPhCC2.Text.Trim().ToString());
            obj.AddParam("@PhoneAC2", txtPhAC2.Text.Trim().ToString());
            obj.AddParam("@Phone2", txtPhone2.Text.Trim().ToString());

            obj.AddParam("@IpAddress", ipaddress);

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();

                string jv = "<script>alert('Supplier Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateSupplier(int id)
    {
        try
        {

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateSupplier";
            obj.AddParam("@id", id);
            obj.AddParam("@CompanyName", txtCompanyName.Text.Trim().ToString());
            obj.AddParam("@Address1", txtAddress1.Text.Trim().ToString());
            obj.AddParam("@Address2", txtAddress2.Text.Trim().ToString());
            obj.AddParam("@Zip", txtZip.Text.Trim().ToString());
            obj.AddParam("@City", txtCity.Text.Trim().ToString());
            obj.AddParam("@State", txtState.Text.Trim().ToString());

            obj.AddParam("@Website", txtWebsite.Text.Trim().ToString());
            obj.AddParam("@FaxCC", txtFaxCC1.Text.Trim().ToString());
            obj.AddParam("@FaxAC", txtFaxAC1.Text.Trim().ToString());
            obj.AddParam("@Fax", txtFax1.Text.Trim().ToString());
            obj.AddParam("@PhoneCC1", txtPhCC1.Text.Trim().ToString());
            obj.AddParam("@PhoneAC1", txtPhAC1.Text.Trim().ToString());
            obj.AddParam("@Phone1", txtPhone1.Text.Trim().ToString());
            obj.AddParam("@PhoneCC2", txtPhCC2.Text.Trim().ToString());
            obj.AddParam("@PhoneAC2", txtPhAC2.Text.Trim().ToString());
            obj.AddParam("@Phone2", txtPhone2.Text.Trim().ToString());           

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();

                //string jv = "<script>alert('Supplier Has Been Added Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

                showmsg("Supplier Has Been Updated Successfully", "view_supplier.aspx");

            }
        }
        catch { }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateSupplier(id);
            }
            else
            {
                AddSupplier();
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    private void Clear()
    {
        txtAddress1.Text = "";
        txtAddress2.Text = "";
        txtCity.Text = "";
        txtCompanyName.Text = "";
       
        txtFax1.Text = "";
        txtFaxAC1.Text = "";
        txtFaxCC1.Text = "";
       
        txtPhAC1.Text = "";
        txtPhAC2.Text = "";
        txtPhCC1.Text = "";
        txtPhCC2.Text = "";
        txtPhone1.Text = "";
        txtPhone2.Text = "";
     
        txtState.Text = "";
   
        txtWebsite.Text = "";
        txtZip.Text = ""; 
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