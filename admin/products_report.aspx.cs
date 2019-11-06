using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using System.IO;
using System.Data.SqlClient;
using System.Data.SqlTypes;
//using iTextSharp.text;
//using iTextSharp.text.pdf;
//using iTextSharp.text.html;
//using iTextSharp.text.html.simpleparser;

using Telerik.Web.UI;
using System;
using System.Web.UI.WebControls;
using xi = Telerik.Web.UI.ExportInfrastructure;
using System.Web.UI;
using System.Web;
using Telerik.Web.UI.GridExcelBuilder;

public partial class admin_products_report : System.Web.UI.Page
{
    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadGrid1.CurrentPageIndex.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                int cid = 0;

                lblmsg.Text = "";
                lblmsg.Visible = false;
                lblError.Visible = false;
                ddlCat.Visible = false;
                ddlSubcategory.Visible = false;
              
                DDLPrice.Visible = false;               
                           

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

                permission();
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

    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        int pid = 0;
        if (e.CommandName == "Delete")
        {
            pid = Int32.Parse(e.CommandArgument.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteProduct";
            obj.AddParam("@pid", pid);

            int i = obj.ExecuteNonQuery();

            if (i > 0)
            {
                RadGrid1.DataBind();
            }
        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SearchField"] = null;
        Session["SearchBy"] = null;
        Session["SortBy"] = null;
        Session["SearchByAlfhabetic"] = null;      
      
       
       

        lblError.Visible = false;
        // ddlCat.SelectedIndex = 0;
        //DDLOccasions.SelectedIndex = 0;
        DDLPrice.SelectedIndex = 0;

        string ss = RadioButtonList1.SelectedValue.ToString();
        Session["SortBy"] = ss;

        if (ss == "0")
        {
           
            DDLPrice.Visible = false;
            ddlCat.Visible = false;
            ddlSubcategory.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.AllowSorting = true;
            RadGrid1.AllowPaging = true;
            RadGrid1.DataSourceID = "dsProduct";
            RadGrid1.DataBind();
        }

        if (ss == "1")
        {
            RadGrid1.Visible = false;
            ddlCat.Visible = true;
          
            DDLPrice.Visible = false;
        }
        if (ss == "2")
        {
            RadGrid1.Visible = false;

            ddlCat.Visible = false;
            ddlSubcategory.Visible = false;
          
            DDLPrice.Visible = true;

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
    protected void DDLPrice_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string pprice = DDLPrice.SelectedValue.Trim();
            string[] ss = pprice.Split('-');
            string price1 = ss[0].ToString();
            string price2 = ss[1].ToString();
            GetProductsByPrice(price1, price2);
        }
        catch
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
        obj.SetCommandQry = "select * from View_Products ";

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
    private void GetProductsByPrice(string price1, string price2)
    {

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetProductsByPrice";
        obj.AddParam("@price1", price1);
        obj.AddParam("@price2", price2);

        DataTable dt = obj.ExecuteTable();
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
                if (ss == "2")
                {
                    string pprice = DDLPrice.SelectedValue.Trim();
                    string[] sss = pprice.Split('-');
                    string price1 = sss[0].ToString();
                    string price2 = sss[1].ToString();
                    GetProductsByPrice(price1, price2);
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                }
                
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
    public void permission()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "SELECT * From admin_users_tbl";

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
        obj.SetCommandQry = "select * from View_Products  where sid=" + sid + " ";

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
   
    protected void ImageButton_Click(object sender, ImageClickEventArgs e)
    {
        string alternateText = (sender as ImageButton).AlternateText;
        RadGrid1.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), alternateText);
        RadGrid1.ExportSettings.FileName = "ProductsReport";
       // RadGrid1.ExportSettings.IgnorePaging = CheckBox1.Checked;
        RadGrid1.ExportSettings.ExportOnlyData = true;
        RadGrid1.ExportSettings.OpenInNewWindow = true;
        RadGrid1.MasterTableView.ExportToExcel();
       
    }
    #region [ HTML FORMAT ]
    protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
    {
       
       
            if (e.Item is GridDataItem || e.Item is GridHeaderItem)
            {
                e.Item.Cells[2].CssClass = "employeeColumn";
            }
      
    }

    protected void RadGrid1_HtmlExporting(object sender, GridHTMLExportingEventArgs e)
    {
       
            e.Styles.Append("@page table .employeeColumn { background-color: #d3d3d3; }");
        
    }
    #endregion

    #region [ EXCELML FORMAT ]
    protected void RadGrid1_ExcelMLWorkBookCreated(object sender, GridExcelMLWorkBookCreatedEventArgs e)
    {
        
            foreach (RowElement row in e.WorkBook.Worksheets[0].Table.Rows)
            {
                row.Cells[0].StyleValue = "Style1";
            }

            StyleElement style = new StyleElement("Style1");
            style.InteriorStyle.Pattern = InteriorPatternType.Solid;
            style.InteriorStyle.Color = System.Drawing.Color.LightGray;
            e.WorkBook.Styles.Add(style);           
       
    }

    #endregion

    #region [ BIFF FORMAT ]
    protected void RadGrid1_BiffExporting(object sender, GridBiffExportingEventArgs e)
    {        
            e.ExportStructure.Tables[0].Columns[1].Style.BackColor = System.Drawing.Color.LightGray;
            
    }

    #endregion

    protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        Label lblImgPath = (Label)e.Item.FindControl("lblImgPath");
        if (lblImgPath != null)
        {
            string strImgPath = lblImgPath.Text;
            Image img1 = (Image)e.Item.FindControl("img1");

            string[] strImages = strImgPath.Split(',');
            Array.Sort(strImages);
            //for (int i = 0; i <= strImages.Length - 1; i++)
            //{
            img1.Visible = true;
           // img1.ImageUrl = "../ProductsImages/" + strImages[0].ToString();
            img1.ImageUrl = "http://performanceracing.in/productsimages/" + strImages[0].ToString();
           // img1.ImageUrl = "http://localhost:1357/productsimages/" + strImages[0].ToString();
            // }
        }
    }
}
