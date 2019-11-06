using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Data.SqlTypes;
using System.Configuration;

public partial class admin_add_products_quantity : System.Web.UI.Page
{
    string ipaddress = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        int pid = 0;       

        if (!IsPostBack)
        {
            trSize.Visible = false;
            chkBootSize.Visible = false;
            lblHeading.Text = "Add Stocks";
            BindDDLCategory();


            

            Session["FrontImage"] = null;

            if (Session["Admin"] != null)
            {
                if (Request.QueryString["pid"] != null)
                {
                    RFVbrand.Enabled = false;

                    pid = Int32.Parse(Request.QueryString["pid"].ToString());
                    GetProducts(pid);

                }
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

    private void BindDDLBrands(int cid, int sid)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetBrandsbyCatIdFromProducts_tbl";
        obj.AddParam("@cid", cid);
        obj.AddParam("@sid", sid);
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            ddlBrands.DataTextField = "brand_name";
            ddlBrands.DataValueField = "brand_id";
            ddlBrands.DataSource = dr;
            ddlBrands.DataBind();
            ddlBrands.Items.Insert(0, "Select");
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
   

    private void GetProducts(int id)
    {
        ProductsBLL objP = new ProductsBLL();
        objP.Pid = id;
        DataTable dt = new DataTable();
        dt = objP.GetProductDetailsByProId();
        if (dt.Rows.Count > 0)
        {
            lblSku.Text = dt.Rows[0]["sku"].ToString();
            //lblHsCode.Text = dt.Rows[0]["hs_code"].ToString();
            lblPrice.Text = dt.Rows[0]["price"].ToString();
            lblSellingPrice.Text = dt.Rows[0]["selling_price"].ToString();
            //lblColor.Text = dt.Rows[0]["color"].ToString();
            //lblSize.Text = dt.Rows[0]["size"].ToString();
            lblShortDesc.Text = dt.Rows[0]["short_desc"].ToString();

            GridView1.Columns[0].Visible = false;
            tdSize.Visible = false;

            //if (strCatName == "Bargain Basement")
            //{
            //    trSize.Visible = false;
            //    trBrand.Visible = false;
            //}

            //else if (strCatName == "Riding Gear")
            //{
            //    GridView1.Columns[0].Visible = true;
            //    tdSize.Visible = true;
            //    trSize.Visible = true;
            //}

            //else
            //{
            //    GridView1.Columns[0].Visible = false;
            //    tdSize.Visible = false;
            //    trSize.Visible = true;
            //}

            string strType = dt.Rows[0]["type"].ToString();
            if (strType == "Bike")
            {
                GridView1.Columns[0].Visible = false;
                tdSize.Visible = false;
                trSize.Visible = true;
            }
            if (strType == "Non Bike")
            {
                trSize.Visible = false;
            }
            if (strType == "Riding Gear")
            {
                GridView1.Columns[0].Visible = true;
                tdSize.Visible = true;
                trSize.Visible = true;
            }

            BindGrid(id);
        }
    }
   
    protected void ddlCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strCatName = ddlCat.SelectedItem.Text.Trim();       

        ddlSubcategory.ClearSelection();
        ddlSubcategory.Items.Clear();
        ddlSubcategory.Items.Insert(0, "Select");

        ddlBrands.SelectedIndex = 0;

        ddlProducts.SelectedIndex = 0;

        lblSku.Text = "";
        lblPrice.Text = "";
        lblSellingPrice.Text = "";
        lblShortDesc.Text = "";

        trSize.Visible = false;

        int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
        BindDDLSubCategory(cid);

        //GridView1.Columns[0].Visible = false;
        //tdSize.Visible = false;

        //if (strCatName == "Bargain Basement")
        //{
        //    trSize.Visible = false;
        //    trBrand.Visible = false;
        //}

        //else if (strCatName == "Riding Gear")
        //{
        //    GridView1.Columns[0].Visible = true;
        //    tdSize.Visible = true;
        //    trSize.Visible = true;
        //}

        //else
        //{
        //    GridView1.Columns[0].Visible = false;
        //    tdSize.Visible = false;
        //    trSize.Visible = true;
        //}
        

        //DataTable dt = new DataTable();
        //CategoryBLL obj = new CategoryBLL();
        //obj.Cid = cid;
        //dt = obj.GetCategory();

        //if (dt.Rows.Count > 0)
        //{
        //    GridView1.Columns[0].Visible = false;
        //    tdSize.Visible = false;

        //    trSize.Visible = true;
        //    string strType = dt.Rows[0]["type"].ToString();
        //    if (strType == "Bike")
        //    {                
        //        //trSize.Visible = false;
        //    }
        //    if (strType == "Non Bike")
        //    {

        //        //trSize.Visible = false;
        //    }
        //    if (strType == "Riding Gear")
        //    {
        //        GridView1.Columns[0].Visible = true;
        //        tdSize.Visible = true;
        //        trSize.Visible = true;
        //    }

        //    if (ddlCat.SelectedItem.Text == "Bargain Basement")
        //    {               
        //        trSize.Visible = false;
        //        trBrand.Visible = false;  
        //    }
        //}
    }


    protected void ddlSubcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
        int sid = Int32.Parse(ddlSubcategory.SelectedValue.ToString());

        BindDDLBrands(cid, sid);

        if (ddlSubcategory.SelectedItem.Text == "Boots")
        {
            chkBootSize.Visible = true;
            ddlSize.Visible = false;
        }
        else
        {
            chkBootSize.Visible = false;
            ddlSize.Visible = true;
        }
      
    }
   
    
    private void BindGrid()
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM View_ProductsQtySize";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            trSize.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            trSize.Visible = false;
        }
    }

    private void BindGrid(int pid)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM View_ProductsQtySize where pid='0' or pid=" + pid;
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {  
            GridView1.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            GridView1.Visible = false;            
        }
    }
    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        if (Request.QueryString["pid"] != null)
        {
            int pid = Int32.Parse(Request.QueryString["pid"].ToString());
            this.BindGrid(pid);
        }
        else
        {
            this.BindGrid(0);
        }
    }
    //protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    //{
    //    GridViewRow row = GridView1.Rows[e.RowIndex];
    //    int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
    //    string quantity = (row.FindControl("txtQuantity") as TextBox).Text;

    //    string query = "UPDATE Products_quantity_tbl SET added_qty=@added_qty WHERE id=@id";

    //    string constr = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;

    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand(query))
    //        {
    //            cmd.Parameters.AddWithValue("@id", id);
    //            cmd.Parameters.AddWithValue("@added_qty", quantity);
    //            cmd.Connection = con;
    //            con.Open();
    //            cmd.ExecuteNonQuery();
    //            con.Close();
    //        }
    //    }
    //    GridView1.EditIndex = -1;
    //    if (Request.QueryString["pid"] != null)
    //    {
    //        int pid = Int32.Parse(Request.QueryString["pid"].ToString());
    //        this.BindGrid(pid);
    //    }
    //    else
    //    {
    //        this.BindGrid(0);
    //    }
    //}
    //protected void OnRowCancelingEdit(object sender, EventArgs e)
    //{
    //    GridView1.EditIndex = -1;
    //    if (Request.QueryString["pid"] != null)
    //    {
    //        int pid = Int32.Parse(Request.QueryString["pid"].ToString());
    //        this.BindGrid(pid);
    //    }
    //    else
    //    {
    //        this.BindGrid(0);
    //    }
    //}

    //protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
    //    ProductsBLL obj = new ProductsBLL();
    //    obj.id = id;
    //    int exe = obj.DeleteProductQuantity();
    //    if (Request.QueryString["pid"] != null)
    //    {
    //        int pid = Int32.Parse(Request.QueryString["pid"].ToString());
    //        this.BindGrid(pid);
    //    }
    //    else
    //    {
    //        this.BindGrid(0);
    //    }
    //}

    //protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
    //    {
    //        (e.Row.Cells[2].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
    //    }
    //}
    protected void Insert(object sender, EventArgs e)
    {
        string strSize = "";
        string strColor = "";
        int pid = 0;
        int stockQty = 0;
        try
        {
            string size = ddlSize.SelectedItem.Text;
            string bootSize = chkBootSize.SelectedItem.Text;

            strColor = ddlColor.SelectedItem.Text;

            if (size!="Size")
            {                
                strSize = size;
                rfvSize.Enabled = true;
                rfvSizeBoot.Enabled = false;
            }
            if (bootSize != "Size")
            {
                strSize = bootSize;
                rfvSize.Enabled = false;
                rfvSizeBoot.Enabled = true;
            }

        }
        catch { }

        if (Page.IsValid)
        {
            ipaddress = GetIpaddress();

            int quantity = int.Parse(txtQuantity1.Text); 
            pid= int.Parse(ddlProducts.SelectedValue.ToString());

            stockQty = GetStockQty(pid, strSize);

            ProductsBLL obj = new ProductsBLL();
            obj.Pid = pid;
            obj.Size = strSize;
            obj.Color = strColor;
            obj.AddedQty = quantity;
            obj.SoldQty = 0;
            obj.StockQty = stockQty + quantity;
            obj.Ipaddress = ipaddress;
            

            int exe = obj.AddProductQuantity();

            if(exe>0)
            {
                ddlSize.SelectedIndex = 0;
                ddlColor.SelectedIndex = 0;
                chkBootSize.SelectedIndex = 0;
                txtQuantity1.Text = "";
            }
            
            this.BindGrid(pid);           
        }
    }

    private int GetStockQty(int pid, string size)
    {
        int stockQty = 0;

        string color = ddlColor.SelectedItem.Text;        

        DBconnection obj = new DBconnection();
        if (size == "")
        {
            obj.SetCommandQry = "select top(1)* from Products_quantity_tbl where pid=" + pid + " and color='" + color + "'  order by id desc";
        }
        else
        {
            obj.SetCommandQry = "select top(1)* from Products_quantity_tbl where pid=" + pid + " and color='" + color + "'  and size='" + size + "' order by id desc";
        }
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            stockQty = int.Parse(dt.Rows[0]["stock_qty"].ToString());
        }

        return stockQty;
    }

    private void UpdateProductQtyTbl(int id)
    {       
        ProductsBLL obj = new ProductsBLL();
        obj.Pid = id;
        obj.UpdateProductQuantityTbl();
       
    }

    private int GetProductId()
    {
        int id;
        ProductsBLL obj = new ProductsBLL();
        object o= obj.GetProductId();

        id = int.Parse(o.ToString());
        return id;

    }

    private string GetIpaddress()
    {       
        string ipaddress;
        ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (ipaddress == "" || ipaddress == null)
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];

        return ipaddress;
    }

    protected void ddlBrands_SelectedIndexChanged(object sender, EventArgs e)
    {
        int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
        int sid = Int32.Parse(ddlSubcategory.SelectedValue.ToString());
        int brand_id = Int32.Parse(ddlBrands.SelectedValue.ToString());

        BindDDLProducts(cid, sid, brand_id);
    }

    protected void ddlProducts_SelectedIndexChanged(object sender, EventArgs e)
    {
        int pid = Int32.Parse(ddlProducts.SelectedValue.ToString());        

       GetProducts(pid);
    }
}