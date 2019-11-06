using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_add_assembly_master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetAssembly(id);
            }
        }
    }
    private void GetAssembly(int id)
    {
        //MastersBLL objAssembly = new MastersBLL();
        //objAssembly.Id = id;
        //DataTable dt = new DataTable();
        //dt = objAssembly.GetAssembly();
        //if (dt.Rows.Count > 0)
        //{
        //    txtAssembly.Text = dt.Rows[0]["assembly"].ToString();
        //}

    }
    private void AddAssembly()
    {
        //try
        //{
        //    MastersBLL objAssembly = new MastersBLL();
        //    objAssembly.Assembly = objAssembly.ToTitleCase(txtAssembly.Text.Trim().ToString());
        //    int i = objAssembly.AddAssembly();

        //    if (i > 0)
        //    {
        //        Clear();
        //        string jv = "<script>alert('Assembly Has Been Added Successfully');</script>";
        //        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        //    }
        //}
        //catch { }
    }
    private void UpdateAssembly(int id)
    {
        //try
        //{
        //    MastersBLL objAssembly = new MastersBLL();
        //    objAssembly.Id = id;
        //    objAssembly.Assembly = objAssembly.ToTitleCase(txtAssembly.Text.Trim().ToString());

        //    int i = objAssembly.UpdateAssembly();

        //    if (i > 0)
        //    {

        //        Clear();
        //        showmsg("Assembly Has Been Updated Successfully", "view_assembly_master.aspx");


        //        //string jv = "<script>alert('Occasion Has Been Updated Successfully');</script>";
        //        //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        //    }
        //}
        //catch { }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    private void Clear()
    {
        txtAssembly.Text = "";
    }   
   
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateAssembly(id);
            }
            else
            {
                AddAssembly();
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
    protected void CVAssembly_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVAssembly.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select Assembly from Assembly_master_tbl where Assembly='" + txtAssembly.Text.Trim().ToString() + "'";
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