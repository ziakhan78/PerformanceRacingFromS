using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class uc_news : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindNews();
        }
    }

    private void BindNews()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM news_tbl where status='True' ORDER BY [id] desc";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            Repeater1.DataSource = dt.DefaultView;
            Repeater1.DataBind();
        }
        else
        {
        }
    }
}