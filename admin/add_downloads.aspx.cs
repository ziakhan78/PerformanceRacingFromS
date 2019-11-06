using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;

public partial class admin_add_downloads : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                imgLogo.Visible = false;

                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetData(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }

    private void GetData(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetDownloads";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            txtCompany.Text = dt.Rows[0]["name"].ToString();

            string img = dt.Rows[0]["files"].ToString();
            if (img != "")
            {
                imgLogo.Visible = true;
                imgLogo.ImageUrl = "../Downloads/" + img.ToString();
            }
            else
            {
                imgLogo.Visible = false;
            }
        }
    }

    private void AddDownloads()
    {

        DBconnection dbcon = new DBconnection();
        dbcon.SetCommandSP = "z_AddDownloads";

        dbcon.AddParam("@name", txtCompany.Text.Trim());


        try
        {
            dbcon.AddParam("@files", Session["imgLogo"].ToString());
        }
        catch
        {
            dbcon.AddParam("@files", DBNull.Value);
        }

        int i = dbcon.ExecuteNonQuery();
        if (i > 0)
        {
            string jv = "<script>alert('Your file has been uploaded successfully!');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            txtCompany.Text = "";

        }
    }

    private void UpdateDownloads()
    {

        int cid = int.Parse(Request.QueryString["id"].ToString());
        DBconnection dbcon = new DBconnection();
        dbcon.SetCommandSP = "z_UpdateDownloads";
        dbcon.AddParam("@id", cid);
        dbcon.AddParam("@name", txtCompany.Text.Trim());

        try
        {
            dbcon.AddParam("@files", Session["imgLogo"].ToString());
        }
        catch
        {
            dbcon.AddParam("@files", DBNull.Value);
        }

        int i = dbcon.ExecuteNonQuery();
        if (i > 0)
        {
            imgLogo.ImageUrl = "../Downloads/" + Session["imgLogo"].ToString();
            string jv = "<script>alert('Your file has been updated successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

            // showmsg("Menu Image Has Been Updated Successfully", "view_gallery_category.aspx");
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

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtCompany.Text = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                UpdateDownloads();
            }
            else
            {
                AddDownloads();
            }
        }
    }

    protected void CVComp_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVComp.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select name from downloads_tbl where name='" + txtCompany.Text.Trim().ToString() + "' ";
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

    protected void RadAsyncUpload1_FileUploaded(object sender, FileUploadedEventArgs e)
    {
        try
        {
            string filename = e.File.FileName;
            Session["imgLogo"] = filename;
        }
        catch
        {
        }
    }
}