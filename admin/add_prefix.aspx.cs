using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_prefix : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {        

            if (Request.QueryString["id"] != null)
            {               
                int id = int.Parse(Request.QueryString["id"].ToString());
               GetPrefix(id);
            }
        }
    }

    private void GetPrefix(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_GetPrefix";
            obj.AddParam("@id", id);
            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
            {
                txtPrefix.Text = dt.Rows[0]["prefix"].ToString();
            }
        }
        catch { }
    }
     
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    UpdatePrefix(id);
                }
                else
                {
                    AddPrefix();
                }
            }

            catch (Exception ex)
            {

            }
        }
    }
    private void AddPrefix()
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddPrefix";
        obj.AddParam("@prefix", txtPrefix.Text.Trim()); 

        if (obj.ExecuteNonQuery() > 0)
        {
            txtPrefix.Text = "";
            string jv = "<script>alert('New Prefix Added Successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
    }

    private void UpdatePrefix(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdatePrefix";
        obj.AddParam("@id", id);
        obj.AddParam("@prefix", txtPrefix.Text.Trim());

        if (obj.ExecuteNonQuery() > 0)
        {            
            string jv = "<script>alert('New Prefix Updated Successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
    }
    protected void CVprefix_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVprefix.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select prefix from prefix_master_tbl where prefix='" + txtPrefix.Text.Trim().ToString() + "'";
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