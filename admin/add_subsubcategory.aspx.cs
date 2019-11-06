using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;
using System.IO;

public partial class admin_add_subsubcategory : System.Web.UI.Page
{
   protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetSubSubCategory(id);
            }
        }
    }
   private void GetSubSubCategory(int id)
    {
        CategoryBLL objSC = new CategoryBLL();
        objSC.Ssid = id;
        DataTable dt = new DataTable();
        dt = objSC.GetSubSubCategory();
        if (dt.Rows.Count > 0)
        {
            int cid = Int32.Parse(dt.Rows[0]["cid"].ToString());
            ddlCat.SelectedValue = cid.ToString();

            int sid = Int32.Parse(dt.Rows[0]["sid"].ToString());
            ddlSubCat.SelectedValue = sid.ToString();
           
            txtSubSubCatName.Text = dt.Rows[0]["subsubcat_name"].ToString();           
        }
    }

    private int GetMaxOrderNo()
    {
        int order_no = 0;

        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "Select Max(display_order) as order_no from SubSubCategory_tbl";

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
    private void AddSubSubCategory()
    {
        try
        {
            int orderNo = GetMaxOrderNo();
            CategoryBLL objSC = new CategoryBLL();
            objSC.Cid = int.Parse(ddlCat.SelectedValue.ToString());
            objSC.Sid = int.Parse(ddlSubCat.SelectedValue.ToString());
            objSC.SubSubCateogryName = ToTitleCase(txtSubSubCatName.Text.Trim().ToString());           
            objSC.DisplayOrder = orderNo;

            int i = objSC.AddSubSubCategory();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('New Sub Category Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateSubSubCategory(int id)
    {
        try
        {
            CategoryBLL objSC = new CategoryBLL();
            objSC.Ssid = id;
            objSC.Cid = int.Parse(ddlCat.SelectedValue.ToString());
            objSC.Sid = int.Parse(ddlSubCat.SelectedValue.ToString());
            objSC.SubSubCateogryName = ToTitleCase(txtSubSubCatName.Text.Trim().ToString());


            int i = objSC.UpdateSubSubCategory();

            if (i > 0)
            { 
                showmsg("Sub Category Has Been Updated Successfully", "view_subsubcategory.aspx");

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
                UpdateSubSubCategory(id);
            }
            else
            {
                AddSubSubCategory();
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
        ddlSubCat.ClearSelection();
        txtSubSubCatName.Text = "";
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
                obj.SetCommandQry = "select subsubcat_name from SubSubCategory_tbl where cid='" + int.Parse(ddlCat.SelectedValue.ToString()) + "' and subcat_name='" + txtSubSubCatName.Text.Trim().ToString() + "'";
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
}