using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class admin_add_currency_rate2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {           
            lblHeading.Text = "Add Currency Rate";
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetDollorRate(id);
            }
        }
    }
    private void GetDollorRate(int id)
    {
        //MastersBLL obj = new MastersBLL();
        //obj.Id = id;
        //DataTable dt = new DataTable();
        //dt = obj.GetDollorRate();
        //if (dt.Rows.Count > 0)
        //{
        //    lblHeading.Text = "Edit Currency Rate";
        //    txtDollorRate.Text = dt.Rows[0]["dollor_rate"].ToString();
        //}

    }
    private void AddDollorRate()
    {
        //try
        //{
        //    MastersBLL obj = new MastersBLL();
        //    obj.DollorRate = decimal.Parse(txtDollorRate.Text.Trim().ToString());
        //    int i = obj.AddDollorRate();

        //    if (i > 0)
        //    {
        //        Clear();
        //        string jv = "<script>alert('Dollar Rupee Conversion Has Been Added Successfully');</script>";
        //        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        //    }
        //}
        //catch { }
    }
    private void UpdateDollorRate(int id)
    {
        //try
        //{
        //    MastersBLL obj = new MastersBLL();
        //    obj.Id = id;
        //    obj.DollorRate = decimal.Parse(txtDollorRate.Text.Trim().ToString());
        //    int i = obj.UpdateDollorRate();

        //    if (i > 0)
        //    {
        //        Clear();
        //        RadGrid1.DataBind();            
        //        string jv = "<script>alert('Dollar Rupee Conversion Has Been Updated Successfully');</script>";
        //        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        //        //showmsg("Dollar Rupee Conversion Has Been Updated Successfully", "view_dollar_rupee_conversion.aspx");
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
        txtDollorRate.Text = "";
    }   
   
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateDollorRate(id);
            }
            else
            {
                AddDollorRate();
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
    protected void CVDistNo_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVDistNo.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select color_name from color_master_tbl where color_name='" + txtDollorRate.Text.Trim().ToString() + "'";
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

    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteDollorRate";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                RadGrid1.DataBind();              
            }
        }
    }
}