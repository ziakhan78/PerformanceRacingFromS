using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Data.SqlClient;

public partial class Admin_ViewSubCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnDelete.Attributes.Add("onclick", "return confirm_delete();");
        lblSearch.Visible = false;

        if (!IsPostBack)
        {
            if (Session["Admin"] != null)
            {

                int cid = 0;
                ViewState["sortOrder"] = "";
                BindDDLCategory();
                BindGrid(cid, "sid", "desc");
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }

    private void BindDDLCategory()
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sp_GetCategory";
        obj.AddParam("@cid", "");
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            DDLCategory.DataTextField = "cat_Name";
            DDLCategory.DataValueField = "cid";
            DDLCategory.DataSource = dr;
            DDLCategory.DataBind();
            DDLCategory.Items.Insert(0, "-- Select Category --");
        }
    }
    private void BindGrid(int cid, string sortExp, string sortDir)
    {
        DataSet ds = new DataSet();
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sp_GetSubcategory";
        obj.AddParam("@cid", cid);

        ds = obj.ExecuteDataSet();

        DataView myDataView = new DataView();
        myDataView = ds.Tables[0].DefaultView;
        if (sortExp != string.Empty)
        {
            myDataView.Sort = string.Format("{0} {1}", sortExp, sortDir);
        }  
        

        if (ds.Tables[0].Rows.Count > 0)
        {
            GridViewSubcategory.Visible = true;
            GridViewSubcategory.DataSource = myDataView;
            GridViewSubcategory.DataBind();
        }
        else
        {
            lblSearch.Visible = true;
            GridViewSubcategory.Visible = false;
        }

       
        //GridViewSubcategory.DataSource = ds;
        //GridViewSubcategory.DataBind();

    }
    //private void BindGrid(int cid)
    //{
    //    DataSet ds = new DataSet();
    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandSP = "sp_GetSubcategory";
    //    obj.AddParam("@cid", cid);

    //    ds = obj.ExecuteDataSet();

       
    //    GridViewSubcategory.DataSource = ds;
    //    GridViewSubcategory.DataBind();

    //}
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int sid = 0;
        foreach (GridViewRow item in GridViewSubcategory.Rows)
        {
            CheckBox chkbox = (CheckBox)item.FindControl("chkActive");
            Label lblsid = (Label)item.FindControl("lblsid");

            if (chkbox.Checked)
            {
                sid = Int32.Parse(lblsid.Text.ToString());
                DBconnection obj = new DBconnection();
                obj.SetCommandSP = "sp_DeleteSubcategory";
                obj.AddParam("@sid", sid);

                int i = obj.ExecuteNonQuery();

                if (i > 0)
                {
                    int cid = 0;
                    try
                    {
                        cid = Int32.Parse(DDLCategory.SelectedValue.ToString());
                    }
                    catch
                    { cid = 0; }
                    BindGrid(cid,"", "");
                }
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddSubCategory.aspx");
    }
    protected void GridViewSubcategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewSubcategory.PageIndex = e.NewPageIndex;
        int cid = 0;
        BindGrid(cid, "", "");
    }
    protected void DDLCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        int cid = 0;
        try
        {
            cid = Int32.Parse(DDLCategory.SelectedValue.ToString());
        }
        catch
        { cid = 0; }
      
        BindGrid(cid,"","");
    }
    protected void btnCStatus_Click(object sender, EventArgs e)
    {
        string iStatus = "";
        int ppid = 0;
       int cid = 0;
        try
        {
            cid = Int32.Parse(DDLCategory.SelectedValue.ToString());
        }
        catch
        { cid = 0; }

        foreach (GridViewRow item in GridViewSubcategory.Rows)
        {
            CheckBox chkbox = (CheckBox)item.FindControl("chkActive");
            Label lblsid = (Label)item.FindControl("lblsid");
            Label lblStatus = (Label)item.FindControl("lblStatus");

            if (chkbox.Checked)
            {
                ppid = Int32.Parse(lblsid.Text.ToString());
                iStatus = lblStatus.Text.ToString();
                DBconnection obj = new DBconnection();
                obj.SetCommandSP = "sp_ChangeSubCatStatus";
                obj.AddParam("@sid", ppid);
                obj.AddParam("@status", iStatus);

                int i = obj.ExecuteNonQuery();

                if (i > 0)
                {
                    BindGrid(cid,"","");
                }
            }
        }
    }
    protected void GridViewSubcategory_Sorting(object sender, GridViewSortEventArgs e)
    {
        int cid = 0;
        //int cid = Int32.Parse(DDLCategory.SelectedValue.ToString());
        BindGrid(cid,e.SortExpression, sortOrder);
    }
    public string sortOrder
    {
        get
        {
            if (ViewState["sortOrder"].ToString() == "desc")
            {
                ViewState["sortOrder"] = "asc";
            }
            else
            {
                ViewState["sortOrder"] = "desc";
            }
            return ViewState["sortOrder"].ToString();
        }
        set
        {
            ViewState["sortOrder"] = value;
        }
    }
    protected void GridViewSubcategory_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
