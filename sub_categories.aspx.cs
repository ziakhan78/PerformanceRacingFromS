using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class sub_categories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["cid"] != null)
            {
                int cid = int.Parse(Request.QueryString["cid"].ToString());                
                BindCategoryName(cid);               
            }
        }
    }

    private void BindCategoryName(int cid)
    {
        DataTable dt = new DataTable();
        CategoryBLL obj = new CategoryBLL();
        obj.Cid = cid;
        dt = obj.GetCategory();
        if (dt.Rows.Count > 0)
        {            
            lblCategory.Text = dt.Rows[0]["cat_name"].ToString();
            lblCategory2.Text = dt.Rows[0]["cat_name"].ToString();    
        }
    }
}