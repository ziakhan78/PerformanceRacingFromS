using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;


public partial class Admin_add_manufacturer_master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblHeading.Text = "Add Motorcycle Manufacturer";
            imgManufacturer.Visible = false;
           
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetManufacturer(id);
            }
        }
    }


    private void GetManufacturer(int id)
    {
        lblHeading.Text = "Edit Motorcycle Manufacturer";
        MastersBLL obj = new MastersBLL();
        obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetManufacturer();
        if (dt.Rows.Count > 0)
        {
            txtManufacturer.Text = dt.Rows[0]["manufacturer_name"].ToString();
            string strLogo = dt.Rows[0]["logo"].ToString();

            if (strLogo != "")
            {
                imgManufacturer.Visible = true;
                Session["imgLogo"] = strLogo;
            }

            imgManufacturer.ImageUrl = "../ManufacturerLogo/" + strLogo;
        }

    }
    private void AddManufacturer()
    {
        try
        {
            MastersBLL obj = new MastersBLL();
            obj.ManufacturerName = txtManufacturer.Text.Trim().ToString();
            try
            {
                obj.Logo = Session["imgLogo"].ToString();
            }
            catch
            {
                obj.Logo = "";
            }
            int i = obj.AddManufacturer();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('Manufacturer Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateManufacturer(int id)
    {
        try
        {
            MastersBLL obj = new MastersBLL();
            obj.Id = id;
            obj.ManufacturerName = txtManufacturer.Text.Trim().ToString();
            try
            {
                obj.Logo = Session["imgLogo"].ToString();
            }
            catch
            {
                obj.Logo = "";
            }

            int i = obj.UpdateManufacturer();

            if (i > 0)
            {

                Clear();
                showmsg("Manufacturer Has Been Updated Successfully", "view_manufacturer_master.aspx");


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
       txtManufacturer.Text = "";
       Session["imgLogo"] = null;
    }   
   
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateManufacturer(id);
            }
            else
            {
                AddManufacturer();
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
    protected void CVManufacturer_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
           CVManufacturer.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select manufacturer_name from manufacturer_master_tbl where manufacturer_name='" + txtManufacturer.Text.Trim().ToString() + "'";
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
    protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            string strPath = "ManufacturerLogo";

            string file_name = "";
            string ext = "";
            file_name = e.File.FileName;
            file_name = file_name.Substring(file_name.LastIndexOf("\\") + 1);
            string strDate = System.DateTime.Now.ToString();
            strDate = strDate.Replace("/", "");
            strDate = strDate.Replace("-", "");
            strDate = strDate.Replace(":", "");
            strDate = strDate.Replace(" ", "");
            ext = file_name.Substring(file_name.LastIndexOf("."));
            file_name = file_name.Substring(0, file_name.LastIndexOf("."));
            file_name = strDate + ext;

            string path = Server.MapPath("~/" + strPath + "/" + file_name);
            Session["imgLogo"] = file_name;
            e.File.SaveAs(path);
        }
        catch
        {
        }
    }
   
}