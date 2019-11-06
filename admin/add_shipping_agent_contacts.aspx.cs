using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_shipping_agent_contacts : System.Web.UI.Page
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
        obj.SetCommandSP = "z_GetSuppliersContacts";

        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            //@BranchName, @Address1, @Address2, @Pin, @City, @State, @Website,

            ddlShippingAgent.DataSourceID = "dsCourierComp";
            ddlShippingAgent.DataBind();

            ddlShippingAgent.SelectedValue = dt.Rows[0]["CompanyId"].ToString();

            txtBranch.Text = dt.Rows[0]["BranchName"].ToString();
            txtAddress1.Text = dt.Rows[0]["Address1"].ToString();
            txtAddress2.Text = dt.Rows[0]["Address2"].ToString();
            txtZip.Text = dt.Rows[0]["Pin"].ToString();
            txtCity.Text = dt.Rows[0]["City"].ToString();
            txtState.Text = dt.Rows[0]["State"].ToString();
            txtWebsite.Text = dt.Rows[0]["Website"].ToString();


            txtFName.Text = dt.Rows[0]["FirstName"].ToString();
            txtLName.Text = dt.Rows[0]["LastName"].ToString();

            txtDesignation.Text = dt.Rows[0]["Designation"].ToString();
            txtEmailId.Text = dt.Rows[0]["EmailId"].ToString();

            txtMobileCC.Text = dt.Rows[0]["MobileCC"].ToString();
            txtMobile.Text = dt.Rows[0]["Mobile"].ToString();

            txtPhoneCC.Text = dt.Rows[0]["PhoneCC"].ToString();
            txtPhoneAC.Text = dt.Rows[0]["PhoneAC"].ToString();
            txtPhone.Text = dt.Rows[0]["Phone"].ToString();
            txtExtNo.Text = dt.Rows[0]["Ext"].ToString();            
        }

    }
    private void AddSuppliersContacts()
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
            obj.SetCommandSP = "z_AddSuppliersContacts";

            // Company Branch Details  

            obj.AddParam("@CompanyId",int.Parse(ddlShippingAgent.SelectedValue.ToString()));
            obj.AddParam("@BranchName", txtBranch.Text.Trim().ToString());
            obj.AddParam("@Address1", txtAddress1.Text.Trim().ToString());
            obj.AddParam("@Address2", txtAddress2.Text.Trim().ToString());
            obj.AddParam("@Pin", txtZip.Text.Trim().ToString());
            obj.AddParam("@City", txtCity.Text.Trim().ToString());           
            obj.AddParam("@State", txtState.Text.Trim().ToString());
            obj.AddParam("@Website", txtWebsite.Text.Trim().ToString());

            // Contact Person Details

            obj.AddParam("@FirstName", txtFName.Text.Trim().ToString());
            obj.AddParam("@LastName", txtLName.Text.Trim().ToString());
            obj.AddParam("@Designation", txtDesignation.Text.Trim().ToString());
            obj.AddParam("@EmailId", txtEmailId.Text.Trim().ToString());
            obj.AddParam("@MobileCC", txtMobileCC.Text.Trim().ToString());
            obj.AddParam("@Mobile", txtMobile.Text.Trim().ToString());
            obj.AddParam("@PhoneCC", txtPhoneCC.Text.Trim().ToString());
            obj.AddParam("@PhoneAC", txtPhoneAC.Text.Trim().ToString());
            obj.AddParam("@Phone", txtPhone.Text.Trim().ToString());
            obj.AddParam("@Ext", txtExtNo.Text.Trim().ToString());          

            obj.AddParam("@IpAddress", ipaddress);

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();

                string jv = "<script>alert('Contact Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { throw; }
    }
    private void UpdateSuppliersContacts(int id)
    {
        try
        {

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateSuppliersContacts";
            obj.AddParam("@id", id);
            obj.AddParam("@CompanyId", int.Parse(ddlShippingAgent.SelectedValue.ToString()));
            obj.AddParam("@BranchName", txtBranch.Text.Trim().ToString());
            obj.AddParam("@Address1", txtAddress1.Text.Trim().ToString());
            obj.AddParam("@Address2", txtAddress2.Text.Trim().ToString());
            obj.AddParam("@Pin", txtZip.Text.Trim().ToString());
            obj.AddParam("@City", txtCity.Text.Trim().ToString());
            obj.AddParam("@State", txtState.Text.Trim().ToString());
            obj.AddParam("@Website", txtWebsite.Text.Trim().ToString());

            // Contact Person Details

            obj.AddParam("@FirstName", txtFName.Text.Trim().ToString());
            obj.AddParam("@LastName", txtLName.Text.Trim().ToString());
            obj.AddParam("@Designation", txtDesignation.Text.Trim().ToString());
            obj.AddParam("@EmailId", txtEmailId.Text.Trim().ToString());
            obj.AddParam("@MobileCC", txtMobileCC.Text.Trim().ToString());
            obj.AddParam("@Mobile", txtMobile.Text.Trim().ToString());
            obj.AddParam("@PhoneCC", txtPhoneCC.Text.Trim().ToString());
            obj.AddParam("@PhoneAC", txtPhoneAC.Text.Trim().ToString());
            obj.AddParam("@Phone", txtPhone.Text.Trim().ToString());
            obj.AddParam("@Ext", txtExtNo.Text.Trim().ToString());

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();

                //string jv = "<script>alert('Supplier Has Been Added Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

                showmsg("Contact Has Been Updated Successfully", "view_shipping_agent_contacts.aspx");

            }
        }
        catch { throw; }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateSuppliersContacts(id);
            }
            else
            {
                AddSuppliersContacts();
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    private void Clear()
    {
        txtDesignation.Text = "";
        txtEmailId.Text = "";
        txtExtNo.Text = "";
        txtFName.Text = "";
        txtLName.Text = "";
        txtMobile.Text = "";
        txtMobileCC.Text = "";
        txtPhone.Text = "";
        txtPhoneAC.Text = "";
        txtPhoneCC.Text = "";
        
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