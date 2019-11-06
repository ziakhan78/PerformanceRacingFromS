using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using System.Data.SqlClient;

public partial class Admin_add_brand_master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblHeading.Text = "Add Brand";
            imgBrand.Visible = false;
            BindDDLCategory();

            try
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetBrand(id);
                }
            }
            catch { }
        }
    }

    private void BindDDLCategory()
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetCategory";
        obj.AddParam("@cid", "");
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            ddlCat.DataTextField = "cat_name";
            ddlCat.DataValueField = "cid";
            ddlCat.DataSource = dr;
            ddlCat.DataBind();
            //ddlCat.Items.Insert(0, "Select");

        }
    }
    //private void BindDDLSubCategory(int cid)
    //{
    //    SqlDataReader dr;
    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandSP = "z_GetSubCategorybyCatId";
    //    obj.AddParam("@cid", cid);
    //    dr = obj.ExecuteReader();

    //    if (dr.HasRows)
    //    {
    //        ddlSubcategory.DataTextField = "subcat_name";
    //        ddlSubcategory.DataValueField = "sid";
    //        ddlSubcategory.DataSource = dr;
    //        ddlSubcategory.DataBind();
    //        ddlSubcategory.Items.Insert(0, "Select");
    //    }
    //}

    //protected void ddlCat_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    ddlSubcategory.ClearSelection();
    //    ddlSubcategory.Items.Clear();
    //    ddlSubcategory.Items.Insert(0, "Select");

    //    int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
    //    BindDDLSubCategory(cid);
    //}
   
    private void GetBrand(int id)
    {
        lblHeading.Text = "Edit Brand";
        MastersBLL objBrand = new MastersBLL();
        objBrand.Id = id;
        DataTable dt = new DataTable();
        dt = objBrand.GetBrand();
        if (dt.Rows.Count > 0)
        {
            try
            {
                string catId = dt.Rows[0]["cat_id"].ToString();
                string subCatId = dt.Rows[0]["subcat_id"].ToString();

               // BindDDLCategory();
               // BindDDLSubCategory(int.Parse(catId));
                ddlCat.SelectedValue = catId;
                // ddlSubcategory.SelectedValue = subCatId;

                string strSubCatNames = dt.Rows[0]["sub_cat_names"].ToString();
                if (strSubCatNames != "")
                {
                    string[] arrSubCatNames = strSubCatNames.ToString().Split(',');
                    for (int i = 0; i <= arrSubCatNames.Length - 1; i++)
                    {
                        foreach (ListItem li in chkSubCategory.Items)
                        {
                            if (li.Text == arrSubCatNames[i].Trim().ToString())
                            {
                                li.Selected = true;
                            }
                        }
                    }
                }
            }
            catch { }

            txtBrandName.Text = dt.Rows[0]["brand_name"].ToString();
           txtWebsite.Text = dt.Rows[0]["website"].ToString();
           txtNotes.Content= dt.Rows[0]["notes"].ToString();
           string logo = dt.Rows[0]["logo"].ToString();
           
           if (logo != "")
           {
               imgBrand.Visible = true;
               Session["imgLogo"] = logo;
           }

           imgBrand.ImageUrl = "../BrandImages/" + logo;
        }

    }
    private void AddBrand()
    {
        try
        {
            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            MastersBLL objBrand = new MastersBLL();
            objBrand.CategoryId = int.Parse(ddlCat.SelectedValue.ToString());
            objBrand.SubCategoryId = 0;// int.Parse(ddlSubcategory.SelectedValue.ToString());
            objBrand.BrandName = objBrand.ToTitleCase(txtBrandName.Text.Trim().ToString());
            objBrand.Website = txtWebsite.Text.Trim().ToString();
            objBrand.Notes = txtNotes.Content;

            string strSubCatNames = "";
            foreach (ListItem li in chkSubCategory.Items)
            {
                if (li.Selected == true)
                {
                    strSubCatNames = strSubCatNames + li.Text + ", ";
                }
            }
            strSubCatNames = strSubCatNames.Remove(strSubCatNames.Length - 2);
            objBrand.SubCategoryNames = strSubCatNames;



            objBrand.Ipaddress = ipaddress;

            try
            {
                objBrand.Logo = Session["imgLogo"].ToString();
            }
            catch { objBrand.Logo = ""; }

            int i = objBrand.AddBrand();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('Brand Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateBrand(int id)
    {
        try
        {
            MastersBLL objBrand = new MastersBLL();
            objBrand.Id = id;
            objBrand.CategoryId = int.Parse(ddlCat.SelectedValue.ToString());
            objBrand.SubCategoryId = 0;// int.Parse(ddlSubcategory.SelectedValue.ToString());
            objBrand.BrandName = objBrand.ToTitleCase(txtBrandName.Text.Trim().ToString());
            objBrand.Website = txtWebsite.Text.Trim().ToString();
            objBrand.Notes = txtNotes.Content;

            string strSubCatNames = "";
            foreach (ListItem li in chkSubCategory.Items)
            {
                if (li.Selected == true)
                {
                    strSubCatNames = strSubCatNames + li.Text + ", ";
                }
            }
            strSubCatNames = strSubCatNames.Remove(strSubCatNames.Length - 2);
            objBrand.SubCategoryNames = strSubCatNames;

            try
            {
                objBrand.Logo = Session["imgLogo"].ToString();
            }
            catch { objBrand.Logo = ""; }

            int i = objBrand.UpdateBrand();

            if (i > 0)
            {

                Clear();
                showmsg("Brand Has Been Updated Successfully", "view_brand_master.aspx");


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
       txtBrandName.Text = "";
       txtWebsite.Text = "";
       txtNotes.Content = "";
       Session["imgLogo"] = null;
    }   
   
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateBrand(id);
            }
            else
            {
                AddBrand();
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
    protected void CVBrand_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            //CVBrand.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select brand_name from brand_master_tbl where brand_name='" + txtBrandName.Text.Trim().ToString() + "'";
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
            string strPath = "BrandImages";

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