using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_author : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetAuthor(id);
            }
        }
    }
    private void GetAuthor(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_GetAuthor";
            obj.AddParam("@id", id);
            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
            {
                txtAuthor.Text = dt.Rows[0]["author"].ToString();
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
                    UpdateAuthor(id);
                }
                else
                {
                    AddAuthor();
                }
            }

            catch (Exception ex)
            {

            }
        }
    }
    private void AddAuthor()
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddAuthor";
        obj.AddParam("@author", txtAuthor.Text.Trim());

        if (obj.ExecuteNonQuery() > 0)
        {
            txtAuthor.Text = "";
            string jv = "<script>alert('Author Has Been Added Successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
    }
    private void UpdateAuthor(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateAuthor";
        obj.AddParam("@id", id);
        obj.AddParam("@author", txtAuthor.Text.Trim());

        if (obj.ExecuteNonQuery() > 0)
        {
            string jv = "<script>alert('Author Updated Successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
    }
    protected void CVprefix_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVAuthor.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select author from author_master_tbl where author='" + txtAuthor.Text.Trim().ToString() + "'";
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
    protected void CVAuthor_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVAuthor.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select author from author_master_tbl where author='" + txtAuthor.Text.Trim().ToString() + "'";
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