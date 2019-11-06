using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;
using System.IO;

public partial class admin_add_category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            imgCat.Visible = false;
            Session["CatImage"] = null;

            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetCategory(id);
            }
        }
    }
    private void GetCategory(int id)
    {
        CategoryBLL objC = new CategoryBLL();
        objC.Cid = id;
        DataTable dt = new DataTable();
        dt = objC.GetCategory();
        if (dt.Rows.Count > 0)
        {
            string strType = dt.Rows[0]["type"].ToString();
            if (strType == "Bike")
            {
                rtnType.SelectedIndex = 0;
            }
            else if (strType == "Non Bike")
            {
                rtnType.SelectedIndex = 1;
            }
            else
            {
                rtnType.SelectedIndex = 2;
            }

            txtCatName.Text = dt.Rows[0]["cat_name"].ToString();

            string thumbnail = dt.Rows[0]["cat_image"].ToString();
            if (thumbnail != "")
            {
                imgCat.Visible = true;
                Session["CatImage"] = thumbnail;
            }

            imgCat.ImageUrl = "../CategoryImages/" + dt.Rows[0]["cat_image"].ToString();

        }

    }

    private int GetMaxOrderNo()
    {
        int order_no = 0;

        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "Select Max(display_order) as order_no from Category_tbl";

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
    private void AddCategory()
    {
        try
        {
            int orderNo = GetMaxOrderNo();
            CategoryBLL objC = new CategoryBLL();
            objC.Type = rtnType.SelectedItem.ToString();
            objC.CategoryName = ToTitleCase(txtCatName.Text.Trim().ToString());
            objC.CatImage = Session["CatImage"].ToString();
            objC.DisplayOrder = orderNo;

            int i = objC.AddCategory();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('New Category Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateCategory(int id)
    {
        try
        {
            CategoryBLL objC = new CategoryBLL();
            objC.Cid = id;
            objC.Type = rtnType.SelectedItem.ToString();
            objC.CategoryName = ToTitleCase(txtCatName.Text.Trim().ToString());
            objC.CatImage = "";
            try
            {
                objC.CatImage = Session["CatImage"].ToString();

            }
            catch
            {
                objC.CatImage = "";
            }

            int i = objC.UpdateCategory();

            if (i > 0)
            {
                //imgCat.ImageUrl = "../CategoryImages/" + Session["CatImage"].ToString();

                showmsg("Category Has Been Updated Successfully", "view_category.aspx");

                //string jv = "<script>alert('Category Has Been Updated Successfully');</script>";
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
                UpdateCategory(id);
            }
            else
            {
                AddCategory();
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    private void Clear()
    {
        txtCatName.Text = "";
        Session["CatImage"] = null;

    }
    protected void CVcategory_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVcategory.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select cat_name from Category_tbl where cat_name='" + txtCatName.Text.Trim().ToString() + "'";
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

    public string ToTitleCase(string str)
    {
        return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str.ToLower());
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
            file_name = "cat_" + strDate + ext;

            string path = Server.MapPath("~/" + strPath + "/" + file_name);
            Session["CatImage"] = file_name;
            e.File.SaveAs(path);
        }
        catch
        {
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