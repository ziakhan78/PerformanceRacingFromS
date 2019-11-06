using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_newsletter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetNewsletter(id);
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateNewsletter(id);
            }
            else
            {
                AddNewsletter();
            }
        }
    }
    private void GetNewsletter(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetNewsletter";

        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            txtFName.Text = dt.Rows[0]["fname"].ToString();
            txtLName.Text = dt.Rows[0]["lname"].ToString();
            txtEmail.Text = dt.Rows[0]["emailid"].ToString();

            txtMobCC.Text = dt.Rows[0]["mobileCC"].ToString();
            txtMobile.Text = dt.Rows[0]["mobile"].ToString();
        }
    }
    private void AddNewsletter()
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
            obj.SetCommandSP = "z_AddNewsletter";
            obj.AddParam("@fname", txtFName.Text.Trim().ToString());
            obj.AddParam("@lname", txtLName.Text.Trim().ToString());
            obj.AddParam("@emailid", txtEmail.Text.Trim().ToString());
            obj.AddParam("@mobileCC", txtMobCC.Text.Trim().ToString());
            obj.AddParam("@mobile", txtMobile.Text.Trim().ToString());
            obj.AddParam("@ipaddress", ipaddress);

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();

                string jv = "<script>alert('Newsletter Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdateNewsletter(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateNewsletter";

            obj.AddParam("@id", id);
            obj.AddParam("@fname", txtFName.Text.Trim().ToString());
            obj.AddParam("@lname", txtLName.Text.Trim().ToString());
            obj.AddParam("@emailid", txtEmail.Text.Trim().ToString());
            obj.AddParam("@mobileCC", txtMobCC.Text.Trim().ToString());
            obj.AddParam("@mobile", txtMobile.Text.Trim().ToString());

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                showmsg("Newsletter Has Been Updated Successfully", "view_newsletter.aspx");
            }
        }
        catch { }
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
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("view_Newsletters.aspx");
    }

    private void Clear()
    {
        txtFName.Text = "";
        txtLName.Text = "";
        txtEmail.Text = "";

        txtMobCC.Text = "";
        txtMobile.Text = "";
    }
}