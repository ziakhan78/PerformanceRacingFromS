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
using Telerik.Web.UI;
//using CrystalDecisions.CrystalReports.Engine;

public partial class Admin_ViewProductsBarcodeReport : System.Web.UI.Page
{
    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadGrid1.CurrentPageIndex.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
     //ReportViewer1.Visible = false;
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                ClearNoOfLabels();

                int cid = 0;

                lblmsg.Text = "";
                lblmsg.Visible = false;
                lblError.Visible = false;

                RadGrid1.Visible = false;
                ddlCat.Visible = false;
                ddlSubcategory.Visible = false;


                BindDDLCategory();
                BindDDLSubCategory(cid);


                bool b;
                if (b = true)
                {
                    Session["SearchField"] = null;
                    Session["SearchBy"] = null;
                    Session["SortBy"] = null;
                    Session["SearchByAlfhabetic"] = null;
                    b = false;
                }

                CheckUserPermission();
                ManageGrid();
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
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
            ddlCat.Items.Clear();
            ddlCat.DataTextField = "cat_name";
            ddlCat.DataValueField = "cid";
            ddlCat.DataSource = dr;
            ddlCat.DataBind();
            ddlCat.Items.Insert(0, "Select");
        }
    }
    private void BindDDLSubCategory(int cid)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetSubCategorybyCatId";
        obj.AddParam("@cid", cid);
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            ddlSubcategory.Items.Clear();
            ddlSubcategory.Visible = true;

            ddlSubcategory.DataTextField = "subcat_name";
            ddlSubcategory.DataValueField = "sid";
            ddlSubcategory.DataSource = dr;
            ddlSubcategory.DataBind();
            ddlSubcategory.Items.Insert(0, "Select");
        }
        else
        {
            ddlSubcategory.Visible = false;
        }
    }
   
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SearchField"] = null;
        Session["SearchBy"] = null;
        Session["SortBy"] = null;
        Session["SearchByAlfhabetic"] = null;


        lblError.Visible = false;


        RadGrid1.Visible = false;
        ddlCat.Visible = false;
        ddlSubcategory.Visible = false;




        ddlCat.SelectedIndex = 0;


        string ss = RadioButtonList1.SelectedValue.ToString();
        Session["SortBy"] = ss;

        if (ss == "0")
        {
            RadGrid1.Visible = true;
            RadGrid1.AllowSorting = true;
            RadGrid1.AllowPaging = true;
            RadGrid1.DataSourceID = "dsProduct";
            RadGrid1.DataBind();
        }

        if (ss == "1")
        {
            ddlCat.Visible = true;
        }



    }
    private void SearchGrid(string searchField, string pname)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_Products  where " + searchField + " like  '%'+'" + pname + "'+ '%' ";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
   
    private void BindGrid(string field_value, string field_name)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select ROW_NUMBER () OVER (ORDER BY " + field_name + " asc ) AS RowNumber,* from View_Products  where " + field_name + " like  '%'+'" + field_value + "'+ '%' ";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    private void BindGrid()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_Products order by pid desc";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }

    private void SortGrid(string sortField, string sortValue)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_Products  where " + sortField + " = '" + sortValue + "'";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    private void ManageGrid()
    {
        try
        {
            if (Session["SortBy"] != null)
            {
                string ss = RadioButtonList1.SelectedValue.ToString();

                if (ss == "0")
                {
                    BindGrid();
                }
                if (ss == "1")
                {
                    int cid = int.Parse(ddlSubcategory.SelectedValue.ToString());
                    BindGrid(cid);
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                }
                //if (ss == "2")
                //{
                //    string pprice = DDLPrice.SelectedValue.Trim();
                //    string[] sss = pprice.Split('-');
                //    string price1 = sss[0].ToString();
                //    string price2 = sss[1].ToString();
                //    GetProductsByPrice(price1, price2);
                //    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                //    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                //}


                //if (ss == "3")
                //{
                //    BindGrid("IsLatestProduct");
                //    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                //    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                //}

                //if (ss == "4")
                //{
                //    BindGrid("IsExclusive");
                //    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                //    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                //}
            }




            else
            {
                BindGrid();
            }
        }
        catch
        {
            BindGrid();
        }
    }
    public void CheckUserPermission()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_GetAdminUsersList";

            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();

            if (dt.Rows.Count > 0)
            {
                string st = Session["Edit"].ToString();
                if (Convert.ToBoolean(Session["Edit"]) == false)
                    RadGrid1.Columns[RadGrid1.Columns.Count - 2].Visible = false;

                if (Convert.ToBoolean(Session["Delete"]) == false)
                    RadGrid1.Columns[RadGrid1.Columns.Count - 1].Visible = false;
            }
        }
        catch (Exception ex)
        {
            string ss = ex.Message;
        }
    }
    private void BindGrid(int sid)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_Products  where sid=" + sid + " order by product_name ";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    private void BindGrid(string strField)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_Products  where " + strField + "='True' order by product_name";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {  
            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    protected void RadGrid1_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        ManageGrid();
    }
    protected void RadGrid1_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
    {
        ManageGrid();
    }
    protected void RadGrid1_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
    {
        ManageGrid();
    }
    protected void ddlCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
            BindDDLSubCategory(cid);
        }
        catch { }
    }
    protected void ddlSubcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int sid = int.Parse(ddlSubcategory.SelectedValue.ToString());
            BindGrid(sid);           
        }
        catch { }
    }
       
  
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // RadNumericTextBox bb=(RadNumericTextBox) RadGrid1.Items.f

        foreach (GridDataItem row in RadGrid1.Items)
        {
            RadNumericTextBox txtNoOfLabel = row.FindControl("txtNoOfLabel") as RadNumericTextBox;
            //TextBox txtNoOfLabel = row.FindControl("txtNoOfLabel") as TextBox;
            Label lblProductId = row.FindControl("lblProductId") as Label;

            if (lblProductId != null)
            {
                try
                {
                    UpdateNoOfLabels(int.Parse(txtNoOfLabel.Text.ToString()), int.Parse(lblProductId.Text.ToString()));
                }
                catch
                { }
            }
        }

        BindReport();
    }


    private void BindReport()
    {
        try
        {
            //ReportDocument crystalReport = new ReportDocument();
            //crystalReport.Load(Server.MapPath("CrystalReport6.rpt"));
            //DataTable dt = new DataTable();
           
            //DBconnection obj = new DBconnection();
          
            //obj.SetCommandQry = "SELECT * FROM View_Products AS f, Numbers AS n WHERE n.Number <= f.[no_of_label] order by pid desc";
            //dt = obj.ExecuteTable();
           
            //crystalReport.SetDataSource(dt);
           

        }
        catch { }
    }

    private void UpdateNoOfLabels(int value, int pid)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "update Products_tbl set no_of_label=" + value + " where pid=" + pid;
            obj.ExecuteNonQuery();
        }
        catch
        { }
    }
    private void ClearNoOfLabels()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "update Products_tbl set no_of_label=0";
            obj.ExecuteNonQuery();
        }
        catch
        { }
    }
  
}
