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

public partial class admin_view_store_sales_report : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }


    protected void ImageButton_Click(object sender, ImageClickEventArgs e)
    {
        string alternateText = (sender as ImageButton).AlternateText;
        RadGrid1.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), alternateText);
        RadGrid1.ExportSettings.FileName = "StoreSalesReport";
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
    protected void RadioButtonList1_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        string ss = RadioButtonList1.SelectedItem.ToString();

        if (ss == "All")
        {
            ImageButton3.Visible = true;
            lblError.Visible = false;

            RadGrid1.Visible = true;
            RadGrid1.AllowSorting = true;
            RadGrid1.AllowPaging = true;
            RadGrid1.DataSourceID = "DSSalesReport";
            RadGrid1.DataBind();
        }

        if (ss == "Pending")
        {
            RadGrid1.Visible = true;
            SearchGrid(ss);
        }
        if (ss == "Processing")
        {
            RadGrid1.Visible = true;
            SearchGrid(ss);
        }

        if (ss == "Completed")
        {
            RadGrid1.Visible = true;
            SearchGrid(ss);
        }

    }

    private void SearchGrid(string searchField)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * from View_Orders where OrderFrom = 'Store' and Status='" + searchField + "'";
       
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            ImageButton3.Visible = true;
            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            ImageButton3.Visible = false;
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
}
