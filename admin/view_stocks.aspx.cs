using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_view_stocks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                BindDDLCategory();
                //BindGrid();
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
        obj.SetCommandSP = "z_GetCategoryFromProducts_tbl";
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            ddlCat.DataTextField = "cat_name";
            ddlCat.DataValueField = "cid";
            ddlCat.DataSource = dr;
            ddlCat.DataBind();
            //ddlCat.Items.Insert(0, "Select");

        }
    }
    private void BindDDLSubCategory(int cid)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetSubCategorybyCatIdFromProducts_tbl";
        obj.AddParam("@cid", cid);
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            ddlSubcategory.DataTextField = "subcat_name";
            ddlSubcategory.DataValueField = "sid";
            ddlSubcategory.DataSource = dr;
            ddlSubcategory.DataBind();
            ddlSubcategory.Items.Insert(0, "Select");
        }
    }

    //private void BindDDLBrands(int cid, int sid)
    //{
    //    SqlDataReader dr;
    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandSP = "z_GetBrandsbyCatIdFromProducts_tbl";
    //    obj.AddParam("@cid", cid);
    //    obj.AddParam("@sid", sid);
    //    dr = obj.ExecuteReader();

    //    if (dr.HasRows)
    //    {
    //        ddlBrands.DataTextField = "brand_name";
    //        ddlBrands.DataValueField = "brand_id";
    //        ddlBrands.DataSource = dr;
    //        ddlBrands.DataBind();
    //        ddlBrands.Items.Insert(0, "Select");
    //    }
    //}


    private void BindDDLProducts(int cid, int sid)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from Products_tbl where cid=" + cid + " and sid=" + sid + "";       
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            ddlProducts.DataTextField = "product_name";
            ddlProducts.DataValueField = "pid";
            ddlProducts.DataSource = dr;
            ddlProducts.DataBind();
            ddlProducts.Items.Insert(0, "Select");
        }
    }


    private void BindDDLProducts(int cid, int sid, int brand_id)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetProductsFromProducts_tbl";
        obj.AddParam("@cid", cid);
        obj.AddParam("@sid", sid);
        obj.AddParam("@brand_id", brand_id);
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            ddlProducts.DataTextField = "product_name";
            ddlProducts.DataValueField = "pid";
            ddlProducts.DataSource = dr;
            ddlProducts.DataBind();
            ddlProducts.Items.Insert(0, "Select");
        }
    }

    private void BindGrid()
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM View_QuantityStocks";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }

    protected void ddlCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strCatName = ddlCat.SelectedItem.Text.Trim();

        ddlSubcategory.ClearSelection();
        ddlSubcategory.Items.Clear();
        ddlSubcategory.Items.Insert(0, "Select");

        //ddlBrands.SelectedIndex = 0;
        ddlProducts.SelectedIndex = 0;       

        int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
        BindDDLSubCategory(cid);
        BindGrid(cid);


    }


    protected void ddlSubcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
        int sid = Int32.Parse(ddlSubcategory.SelectedValue.ToString());
        // BindDDLBrands(cid, sid);  
        BindDDLProducts(cid, sid);
        BindGrid(cid, sid);

    }
    //protected void ddlBrands_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
    //    int sid = Int32.Parse(ddlSubcategory.SelectedValue.ToString());
    //    int brand_id = Int32.Parse(ddlBrands.SelectedValue.ToString());

    //    BindDDLProducts(cid, sid, brand_id);
    //}

    protected void ddlProducts_SelectedIndexChanged(object sender, EventArgs e)
    {
        int pid = Int32.Parse(ddlProducts.SelectedValue.ToString());
        int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
        int sid = Int32.Parse(ddlSubcategory.SelectedValue.ToString());
        BindGrid(cid, sid, pid);
    }
   

    private void BindGrid(int cid)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM View_QuantityStocks where cid=" + cid + "";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }

    private void BindGrid(int cid, int sid)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM View_QuantityStocks where cid=" + cid + " and sid=" + sid + "";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }

    private void BindGrid(int cid, int sid, int pid)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM View_QuantityStocks where cid=" + cid + " and sid=" + sid + " and pid=" + pid + "";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }

}