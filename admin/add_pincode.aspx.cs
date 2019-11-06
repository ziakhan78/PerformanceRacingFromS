using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_add_pincode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetColors(id);
            }
        }
    }
    private void GetColors(int id)
    {
        MastersBLL objColor = new MastersBLL();
        objColor.Id = id;
        DataTable dt = new DataTable();
        dt = objColor.GetColors();
        if (dt.Rows.Count > 0)
        {
           // txtColor.Text = dt.Rows[0]["color_name"].ToString();
        }

    }
    private void AddColor()
    {
        try
        {
            MastersBLL objColor = new MastersBLL();
           // objColor.ColorName = objColor.ToTitleCase(txtColor.Text.Trim().ToString());
            int i = objColor.AddColors();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('Color Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateColor(int id)
    {
        try
        {
            MastersBLL objColor = new MastersBLL();
            objColor.Id = id;
           // objColor.ColorName = objColor.ToTitleCase(txtColor.Text.Trim().ToString());

            int i = objColor.UpdateColors();

            if (i > 0)
            {

                Clear();
                showmsg("Color Has Been Updated Successfully", "view_colors.aspx");


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
       // txtColor.Text = "";
    }   
   
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateColor(id);
            }
            else
            {
                AddColor();
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
    protected void CVColor_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
          //  CVColor.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
               // obj.SetCommandQry = "select color_name from color_master_tbl where color_name='" + txtColor.Text.Trim().ToString() + "'";
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