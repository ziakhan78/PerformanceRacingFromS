using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;
using System.IO;

public partial class admin_add_subcategory : System.Web.UI.Page
{
   protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            img.Visible = false;

            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetSubCategory(id);
            }
        }
    }
   private void GetSubCategory(int id)
    {
        CategoryBLL objSC = new CategoryBLL();
        objSC.Sid = id;
        DataTable dt = new DataTable();
        dt = objSC.GetSubCategory();
        if (dt.Rows.Count > 0)
        {  
            int cid = Int32.Parse(dt.Rows[0]["cid"].ToString());
            ddlCat.SelectedValue = cid.ToString();           
            txtSubCatName.Text = dt.Rows[0]["subcat_name"].ToString();
            ddlHsCode.SelectedItem.Text = dt.Rows[0]["hs_code"].ToString();

            string thumbnail = dt.Rows[0]["subcat_image"].ToString();
            if (thumbnail != "")
            {
                img.Visible = true;
                Session["SubCatImage"] = thumbnail;
            }

            img.ImageUrl = "../CategoryImages/" + dt.Rows[0]["subcat_image"].ToString();
           
        }

    }

    private int GetMaxOrderNo()
    {
        int order_no = 0;

        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "Select Max(display_order) as order_no from Subcategory_tbl";

            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            order_no = int.Parse(dt.Rows[0]["order_no"].ToString());
        }

        catch
        {
            if (order_no == 0)
            {
                order_no = order_no + 1;
            }
        }
        return order_no;

    }
    private void AddSubCategory()
    {
        try
        {
            int orderNo = GetMaxOrderNo();
            CategoryBLL objSC = new CategoryBLL();
            objSC.Cid = int.Parse(ddlCat.SelectedValue.ToString());
            objSC.SubCateogryName = ToTitleCase(txtSubCatName.Text.Trim().ToString());           
            objSC.DisplayOrder = orderNo;
            objSC.SubCatImage = Session["SubCatImage"].ToString();

            int i = objSC.AddSubCategory();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('New Sub Category Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateSubCategory(int id)
    {
        try
        {
            CategoryBLL objSC = new CategoryBLL();
            objSC.Sid = id;
            objSC.Cid = int.Parse(ddlCat.SelectedValue.ToString());
            objSC.HSCode = ddlHsCode.SelectedItem.Text.ToString();
            objSC.SubCateogryName = ToTitleCase(txtSubCatName.Text.Trim().ToString());
            objSC.SubCatImage = Session["SubCatImage"].ToString();

            int i = objSC.UpdateSubCategory();

            if (i > 0)
            {
                showmsg("Sub Category Has Been Updated Successfully", "view_subcategory.aspx");

                //string jv = "<script>alert('Sub Category Has Been Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateSubCategory(id);
            }
            else
            {
                AddSubCategory();
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    private void Clear()
    {
        ddlCat.ClearSelection();
        txtSubCatName.Text = "";
        Session["SubCatImage"] = null;
    }
   
    public string ToTitleCase(string str)
    {
        return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str.ToLower());
    }

  
    protected void CVsubcategory_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVsubcategory.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select subcat_name from Subcategory_tbl where cid='" + int.Parse(ddlCat.SelectedValue.ToString()) + "' and subcat_name='" + txtSubCatName.Text.Trim().ToString() + "'";
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

    protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            string strPath = "CategoryImages";

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
            file_name = "subcat_" + strDate + ext;

            string path = Server.MapPath("~/" + strPath + "/" + file_name);
            Session["SubCatImage"] = file_name;
            e.File.SaveAs(path);
        }
        catch
        {
        }
    }
}