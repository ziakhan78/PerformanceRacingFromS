using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_products_sale_from_stores : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            //if (Request.QueryString["id"] != null)
            //{
            //    int id = int.Parse(Request.QueryString["id"].ToString());
            //    GetDealer(id);
            //}
        }
    }
    


    protected void btnAdd_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

}