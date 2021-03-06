﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_TDS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PanelAdd.Visible = false;
            PanelView.Visible = true;
            BindYears();
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetTDS(id);
            }
        }
    }


    private void BindYears()
    {
        try
        {          

            string currentyears = Convert.ToInt32(DateTime.Now.Year).ToString() + " - " + Convert.ToInt32(DateTime.Now.Year + 1).ToString();
            string nextyears = Convert.ToInt32(DateTime.Now.Year + 1).ToString() + " - " + Convert.ToInt32(DateTime.Now.Year + 2).ToString();
            //DDLYears.Items.Insert(0, "Select");
            DDLYears.Items.Insert(1, nextyears);
            DDLYears.Items.Insert(2, currentyears);

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
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
        //BindGrid();
        RadGrid1.DataBind();
    }

    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteTDS";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                RadGrid1.DataBind();
            }
        }
    }

    private void GetTDS(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetTDS";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            PanelAdd.Visible = true;
            PanelView.Visible = true;           

            DDLYears.SelectedItem.Text = dt.Rows[0]["year"].ToString();
            txtRate.Text = dt.Rows[0]["rate"].ToString();
        }
    }
    private void AddTDS()
    {
        try
        {

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddTDS";

            obj.AddParam("@year", DDLYears.SelectedItem.Text.ToString());
            obj.AddParam("@rate", Decimal.Parse(txtRate.Text.ToString()));

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                clear();
                PanelAdd.Visible = true;
                PanelView.Visible = true;
                RadGrid1.DataBind();
                string jv = "<script>alert('Record Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateTDS(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateTDS";

            obj.AddParam("@id", id);
            obj.AddParam("@year", DDLYears.SelectedItem.Text.ToString());
            obj.AddParam("@rate", Decimal.Parse(txtRate.Text.ToString()));

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                //  BindGrid();
                RadGrid1.DataBind();
                string jv = "<script>alert('Record Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void clear()
    {
        DDLYears.SelectedIndex = 0;
        txtRate.Text = "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateTDS(id);
            }
            else
            {
                AddTDS();
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        PanelAdd.Visible = false;
        PanelView.Visible = true;
        clear();
        RadGrid1.DataBind();
    }
    protected void CV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CV.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select year from tds_tbl where year='" + DDLYears.SelectedItem.Text.Trim().ToString() + "'";
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