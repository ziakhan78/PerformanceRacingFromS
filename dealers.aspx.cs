using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class dealers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategories();
        }
    }
    private void BindCategories()
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetAllDealersContacts";

        DataSet ds = new DataSet();
        ds = obj.ExecuteDataSet();

        ds.Relations.Add(new DataRelation("CategoriesRelation", ds.Tables[0].Columns["state_name"],
            ds.Tables[1].Columns["state"]));
        rMainCategories.DataSource = ds.Tables[0];
        rMainCategories.DataBind();
    }
    protected void rMainCategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item ||
        e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataRowView drv = e.Item.DataItem as DataRowView;
            Repeater rSubCategories = e.Item.FindControl("rSubCategories") as Repeater;
            rSubCategories.DataSource = drv.CreateChildView("CategoriesRelation");
            rSubCategories.DataBind();
        }
    }
}