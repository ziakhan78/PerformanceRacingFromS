using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_add_component_master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblHeading.Text = "Add Component";
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetComponents(id);
            }
        }
    }
    private void GetComponents(int id)
    {
        MastersBLL obj = new MastersBLL();
        obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetComponents();
        if (dt.Rows.Count > 0)
        {
            lblHeading.Text = "Edit Component";
            txtComponent.Text = dt.Rows[0]["components"].ToString();
        }

    }
    private void AddComponents()
    {
        try
        {
            MastersBLL obj = new MastersBLL();
            obj.Component = obj.ToTitleCase(txtComponent.Text.Trim().ToString());
            int i = obj.AddComponents();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('Component Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateComponents(int id)
    {
        try
        {
            MastersBLL obj = new MastersBLL();
            obj.Id = id;
            obj.Component = obj.ToTitleCase(txtComponent.Text.Trim().ToString());

            int i = obj.UpdateComponents();

            if (i > 0)
            {

                Clear();
                showmsg("Component Has Been Updated Successfully", "view_components.aspx");


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
        txtComponent.Text = "";
      
    }    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateComponents(id);
            }
            else
            {
                AddComponents();
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
    protected void CVComponent_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVComponent.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select components from components_master_tbl where components='" + txtComponent.Text.Trim().ToString() + "'";
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