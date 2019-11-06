using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_admin_log_details : System.Web.UI.Page
{
    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadGrid1.CurrentPageIndex.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindLogDetails();
        }
    }

    private void BindLogDetails()
    {
        string sqlQry = "";
        string ss=Session["user"].ToString();
        if ( ss== "admin")
        {
            sqlQry = "SELECT * FROM [admin_log_tbl] order by id desc";
        }
        else
        {
            sqlQry = "SELECT * FROM [admin_log_tbl] where username!='admin' order by id desc";
        }

        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = sqlQry;
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {            
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {           
            RadGrid1.Visible = false;
        }
    }
    protected void RadGrid1_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        BindLogDetails();
    }
    protected void RadGrid1_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
    {
        BindLogDetails();
    }
    protected void RadGrid1_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
    {
        BindLogDetails();
    }
}