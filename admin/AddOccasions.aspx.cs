using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_AddOccasions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetOccasion(id);
            }
        }
    }
    private void GetOccasion(int id)
    {
        MastersBLL objOccasions = new MastersBLL();
        objOccasions.Id = id;
        DataTable dt = new DataTable();
        dt = objOccasions.GetOccasion();
        if (dt.Rows.Count > 0)
        {
            txtOccasion.Text = dt.Rows[0]["occasion_name"].ToString();
        }

    }
    private void AddOccasion()
    {
        try
        {
            MastersBLL objOccasions = new MastersBLL();
            objOccasions.Occaission = objOccasions.ToTitleCase(txtOccasion.Text.Trim().ToString());
            int i = objOccasions.AddOccasion();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('Occasion Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateOccasion(int id)
    {
        //try
        //{
        //    MastersBLL objOccasions = new MastersBLL();
        //    objOccasions.Id = id;
        //    objOccasions.Occaission = objOccasions.ToTitleCase(txtOccasion.Text.Trim().ToString());

        //    int i = objOccasions.UpdateOccasion();

        //    if (i > 0)
        //    {

        //        Clear();
        //        showmsg("Occasion Has Been Updated Successfully", "ViewOccasions.aspx");


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
        txtOccasion.Text = "";
    }   
   
    protected void CVOccasion_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVOccasion.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select occasion_name from occasion_master_tbl where occasion_name='" + txtOccasion.Text.Trim().ToString() + "'";
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateOccasion(id);
            }
            else
            {
                AddOccasion();
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