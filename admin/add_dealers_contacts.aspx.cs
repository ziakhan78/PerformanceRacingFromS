using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_dealers_contacts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {          

            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetDealer(id);
            }
        }
    }
    private void GetDealer(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetDealersContacts";

        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            ddlSupliers.SelectedValue = dt.Rows[0]["DealerId"].ToString();
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
    private void AddDealersContacts()
    {
        try
        {
            string strEmailVerificationCode = GetRandomCodeUsingGuid();
            string strPassword = GetRandomPasswordUsingGuid();

            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/
                    
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddDealersContacts";
            obj.AddParam("@DealerId",int.Parse(ddlSupliers.SelectedValue.ToString()));
            obj.AddParam("@FirstName", txtFName.Text.Trim().ToString());
            obj.AddParam("@LastName", txtLName.Text.Trim().ToString());
            obj.AddParam("@Designation", txtDesignation.Text.Trim().ToString());
            obj.AddParam("@EmailId", txtEmailId.Text.Trim().ToString());

            obj.AddParam("@Password", strPassword);
            obj.AddParam("@email_verification_code", strEmailVerificationCode);

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

                string jv = "<script>alert('Dealers Contact Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void UpdateDealersContacts(int id)
    {
        try
        {

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateDealersContacts";
            obj.AddParam("@id", id);
            obj.AddParam("@DealerId", int.Parse(ddlSupliers.SelectedValue.ToString()));
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

                Showmsg("Dealers Contact Has Been Updated Successfully", "view_dealers_contacts.aspx");

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
                UpdateDealersContacts(id);
            }
            else
            {
                AddDealersContacts();
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
    public void Showmsg(string msg, string redirectUrl)
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

    public string GetRandomCodeUsingGuid()
    {
        string guidResult = System.Guid.NewGuid().ToString();
        guidResult = guidResult.Replace("-", string.Empty);
        return guidResult;
    }
    public string GetRandomPasswordUsingGuid()
    {
        string guidResult = System.Guid.NewGuid().ToString();
        guidResult = guidResult.Replace("-", string.Empty);
        return guidResult.Substring(0, 8);
    }

}