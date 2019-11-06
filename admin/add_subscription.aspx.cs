using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_subscription : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PanelAdd.Visible = false;
            PanelView.Visible = true;           
        }
    }

   

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        PanelAdd.Visible = true;
        PanelView.Visible = false;
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        PanelAdd.Visible = false;
        PanelView.Visible = true;
       // BindGrid();
    }

    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        //if (e.CommandName == "Delete")
        //{
        //    string i = e.CommandArgument.ToString();
        //    int id = int.Parse(i.ToString());
        //    DBconnection obj = new DBconnection();
        //    obj.SetCommandSP = "z_DeleteVat";
        //    obj.AddParam("@id", id);
        //    if (obj.ExecuteNonQuery() > 0)
        //    {
        //        RadGrid1.DataBind();
        //    }
        //}

        //if (e.CommandName == "Edit")
        //{

        //    string i = e.CommandArgument.ToString();
        //    int id = int.Parse(i.ToString());

        //    GetVat(id);
        //    DBconnection obj = new DBconnection();
        //    obj.SetCommandSP = "z_UpdateVat";
        //    obj.AddParam("@id", id);
        //    if (obj.ExecuteNonQuery() > 0)
        //    {
        //        RadGrid1.DataBind();
        //    }
        //}
    }

    //private void GetVat(int id)
    //{
    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandQry = "select * from vat_tbl where id='" + id + "'";
    //    DataTable dt = new DataTable();
    //    dt = obj.ExecuteTable();
    //    if (dt.Rows.Count > 0)
    //    {           
    //        txtRate.Text = dt.Rows[0]["rate"].ToString();
    //    }
    //}
    //private void AddVat()
    //{
    //    try
    //    {

    //        DBconnection obj = new DBconnection();
    //        obj.SetCommandSP = "z_AddVat";

           
    //        obj.AddParam("@rate", Decimal.Parse(txtRate.Text.ToString()));

    //        int exe = obj.ExecuteNonQuery();
    //        if (exe > 0)
    //        {
    //            clear();
    //            BindGrid();
    //            string jv = "<script>alert('Record Has Been Added Successfully');</script>";
    //            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
    //        }
    //    }
    //    catch { }
    //}
    //private void UpdateVat(int id)
    //{
    //    try
    //    {
    //        DBconnection obj = new DBconnection();
    //        obj.SetCommandSP = "z_UpdateVat";

    //        obj.AddParam("@id", id);
           
    //        obj.AddParam("@rate", Decimal.Parse(txtRate.Text.ToString()));

    //        int exe = obj.ExecuteNonQuery();
    //        if (exe > 0)
    //        {
    //            //clear();
    //            //string jv = "<script>alert('Record Added Successfully');</script>";
    //            //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
    //            // showmsg("Record Updated Successfully", "ViewBod.aspx");
    //        }
    //    }
    //    catch { }
    //}
    //private void clear()
    //{
     
    //    txtRate.Text = "";
    //}
    //protected void btnSubmit_Click(object sender, EventArgs e)
    //{
    //    if (Page.IsValid)
    //    {
    //        if (Request.QueryString["id"] != null)
    //        {
    //            int id = int.Parse(Request.QueryString["id"].ToString());
    //            UpdateVat(id);
    //        }
    //        else
    //        {
    //            AddVat();
    //        }
    //    }
    //}

    //private void BindGrid()
    //{
    //    PanelView.Visible = true;
    //    DataTable dt = new DataTable();
    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandQry = "select * from vat_tbl";
    //    dt = obj.ExecuteTable();
    //    if (dt.Rows.Count > 0)
    //    {

    //        //lblMsg.Visible = false;
    //        RadGrid1.Visible = true;
    //        RadGrid1.DataSourceID = string.Empty;
    //        RadGrid1.DataSource = dt;
    //        RadGrid1.Rebind();
    //    }
    //    else
    //    {
    //        //lblMsg.Visible = true;
    //        RadGrid1.Visible = false;
    //    }
    //}
    protected void btnSubmit_Click1(object sender, EventArgs e)
    {

    }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {

    }
}