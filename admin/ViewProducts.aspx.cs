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

public partial class Admin_ViewProducts : System.Web.UI.Page
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

                RadGrid1.Visible = false;
                ddlCat.Visible = false;
                ddlSubcategory.Visible = false;
               
                DDLPrice.Visible = false;
                DDLColors.Visible = false;
                ddlBrands.Visible = false;
                rbtnFitment.Visible = false;
                ddlManufacturer.Visible = false;
                ddlModel.Visible = false;
             

                BindDDLCategory();
                BindDDLSubCategory(cid);
                BindManufacturer();

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
                //RadGrid1.DataBind();
                ManageGrid();
            }
        }
    }    
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SearchField"] = null;
        Session["SearchBy"] = null;
        Session["SortBy"] = null;
        Session["SearchByAlfhabetic"] = null;

       // rbtnSearch.ClearSelection();
       // DDLProductName.Visible = false;
       // DDLSku.Visible = false;       
        lblError.Visible = false;      
        DDLPrice.SelectedIndex = 0;

        RadGrid1.Visible = false;
        ddlCat.Visible = false;
        ddlSubcategory.Visible = false;
       
        DDLPrice.Visible = false;
        DDLColors.Visible = false;
        ddlBrands.Visible = false;
        rbtnFitment.Visible = false;
        ddlManufacturer.Visible = false;
        ddlModel.Visible = false;

        ddlBrands.SelectedIndex = 0;
        DDLColors.SelectedIndex = 0;
        DDLPrice.SelectedIndex = 0;
        ddlCat.SelectedIndex = 0;
        ddlManufacturer.SelectedIndex = 0;
        rbtnFitment.ClearSelection();
        ddlModel.SelectedIndex = 0;

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
        if (ss == "2")
        {
            DDLPrice.Visible = true;
        }       

        if (ss == "3")
        {
            DDLColors.Visible = true;        
        }       

        if (ss == "4")
        {
            ddlBrands.Visible = true;
        }

        if (ss == "5")
        {
            BindGrid("exclusive");
        }

        if (ss == "6")
        {
            rbtnFitment.Visible = true;
        }

       
    }
    // search Start 
    #region Search Start

    protected void LnkA_Click(object sender, EventArgs e)
    {
        string val = "A";
        SearchByAlphabet(val);
    }
    protected void LnkB_Click(object sender, EventArgs e)
    {
        string val = "B";
        SearchByAlphabet(val);
    }
    protected void LnkC_Click(object sender, EventArgs e)
    {
        string val = "C";
        SearchByAlphabet(val);
    }
    protected void LnkD_Click(object sender, EventArgs e)
    {
        string val = "D";
        SearchByAlphabet(val);
    }
    protected void LnkE_Click(object sender, EventArgs e)
    {
        string val = "E";
        SearchByAlphabet(val);
    }
    protected void LnkF_Click(object sender, EventArgs e)
    {
        string val = "F";
        SearchByAlphabet(val);
    }
    protected void LnkG_Click(object sender, EventArgs e)
    {
        string val = "G";
        SearchByAlphabet(val);
    }
    protected void LnkH_Click(object sender, EventArgs e)
    {
        string val = "H";
        SearchByAlphabet(val);
    }
    protected void LnkI_Click(object sender, EventArgs e)
    {
        string val = "I";
        SearchByAlphabet(val);
    }
    protected void LnkJ_Click(object sender, EventArgs e)
    {
        string val = "J";
        SearchByAlphabet(val);
    }
    protected void LnkK_Click(object sender, EventArgs e)
    {
        string val = "K";
        SearchByAlphabet(val);
    }
    protected void LnkL_Click(object sender, EventArgs e)
    {
        string val = "L";
        SearchByAlphabet(val);
    }
    protected void LnkM_Click(object sender, EventArgs e)
    {
        string val = "M";
        SearchByAlphabet(val);
    }
    protected void LnkN_Click(object sender, EventArgs e)
    {
        string val = "N";
        SearchByAlphabet(val);
    }
    protected void LnkO_Click(object sender, EventArgs e)
    {
        string val = "O";
        SearchByAlphabet(val);
    }
    protected void LnkP_Click(object sender, EventArgs e)
    {
        string val = "P";
        SearchByAlphabet(val);
    }
    protected void LnkQ_Click(object sender, EventArgs e)
    {
        string val = "Q";
        SearchByAlphabet(val);
    }
    protected void LnkR_Click(object sender, EventArgs e)
    {
        string val = "R";
        SearchByAlphabet(val);
    }
    protected void LnkS_Click(object sender, EventArgs e)
    {
        string val = "S";
        SearchByAlphabet(val);
    }
    protected void LnkT_Click(object sender, EventArgs e)
    {
        string val = "T";
        SearchByAlphabet(val);
    }
    protected void LnkU_Click(object sender, EventArgs e)
    {
        string val = "U";
        SearchByAlphabet(val);
    }
    protected void LnkV_Click(object sender, EventArgs e)
    {
        string val = "V";
        SearchByAlphabet(val);
    }
    protected void LnkW_Click(object sender, EventArgs e)
    {
        string val = "W";
        SearchByAlphabet(val);
    }
    protected void LnkX_Click(object sender, EventArgs e)
    {
        string val = "X";
        SearchByAlphabet(val);
    }
    protected void LnkY_Click(object sender, EventArgs e)
    {
        string val = "Y";
        SearchByAlphabet(val);
    }
    protected void LnkZ_Click(object sender, EventArgs e)
    {
        string val = "Z";
        SearchByAlphabet(val);
    }
    protected void Linkbutton1_Click(object sender, EventArgs e)
    {
        string val = "ALL";
        SearchByAlphabet(val);
    }
#endregion

    private void SearchByAlphabet(string title)
    {
        RadGrid1.Visible = false;
        ddlCat.Visible = false;
        ddlSubcategory.Visible = false;
       
        DDLPrice.Visible = false;
        DDLColors.Visible = false;
       

      //  txtName.Text = "";

      //  rbtnSearch.ClearSelection();
        Session["SearchBy"] = null;
        Session["SortBy"] = null;
        Session["SearchByAlfhabetic"] = title;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "z_SearchByAlphabetProducts";
        obj.AddParam("@name", title);

        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            lblmsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblmsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

        Session["SearchField"] = null;
        Session["SearchBy"] = null;
        Session["SortBy"] = null;
        Session["SearchByAlfhabetic"] = null;

        string searchField = "";
        string val = "";
        int i = int.Parse(rbtnSearch.SelectedValue.ToString());
        if (i == 0)
        {
            searchField = "product_name";
            val = txtName.Text.Trim();
        }
        if (i == 1)
        {
            searchField = "sku";
            val = txtName.Text.Trim();
        }


        Session["SearchField"] = searchField;
        Session["SearchBy"] = val;
        SearchGrid(searchField, val);
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
    private void GetProductsByPrice(string price1, string price2)
    {

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetProductsByPrice";
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
            if (Session["SearchBy"] != null)
            {
                if (Session["SearchBy"] == "product_name")
                {
                    BindGrid(txtName.Text.Trim(), Session["SearchBy"].ToString());
                    // SearchGrid(Session["SearchField"].ToString(), Session["SearchBy"].ToString());
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                }
                if (Session["SearchBy"] == "sku")
                {
                    BindGrid(txtName.Text.Trim(), Session["SearchBy"].ToString());
                    // SearchGrid(Session["SearchField"].ToString(), Session["SearchBy"].ToString());
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                }
               
            }

            else if (Session["SearchByAlfhabetic"] != null)
            {
                SearchByAlphabet(Session["SearchByAlfhabetic"].ToString());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }


            else if (Session["SortBy"] != null)
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
                

                if (ss == "3")
                {
                    BindGrid("IsLatestProduct");
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                }

                if (ss == "4")
                {
                    BindGrid("IsExclusive");
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

    private void BindGridByCat(int cid)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_Products  where cid=" + cid + " order by product_name ";

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
            BindGridByCat(cid);
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
    protected void rbtnSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
       // Session["SearchField"] = null;
       // Session["SearchBy"] = null;
       // Session["SortBy"] = null;
       // Session["SearchByAlfhabetic"] = null;

       // //DDLSku.ClearSelection();
       // //DDLProductName.ClearSelection();
       //// DDLSku.ClearSelection();

       // if (rbtnSearch.SelectedValue == "0")
       // {
       //     Session["SearchBy"] = "productName";
       //    // DDLProductName.Visible = true;
       //    // DDLSku.Visible = false;
           
       // }

       // if (rbtnSearch.SelectedValue == "1")
       // {
       //     Session["SearchBy"] = "sku";
       //    // DDLProductName.Visible = false;
       //   //  DDLSku.Visible = true;
           
       // }        

    }
    //protected void DDLProductName_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    //{
    //    try
    //    {
    //        BindGrid(DDLProductName.Text.Trim(), "productName");
    //    }
    //    catch { }
    //}
    //protected void DDLSku_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    //{
    //    try{
    //    BindGrid(DDLSku.Text.Trim(), "sku");
    //    }
    //    catch { }
    //}   
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
            img1.ImageUrl = "../ProductsImages/" + strImages[0].ToString();
            // }
        }
    }
    protected void DDLColors_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlBrands_SelectedIndexChanged(object sender, EventArgs e)
    {
       // int brandId = int.Parse(ddlBrands.SelectedValue.ToString());
        string brandId = ddlBrands.SelectedItem.Text.ToString();
        SortGrid("brand_name", brandId.ToString());
    }
    private void BindManufacturer()
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT [id], [manufacturer_name] FROM [manufacturer_master_tbl] ORDER BY [manufacturer_name]";

        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            

            ddlManufacturer.DataTextField = "manufacturer_name";
            ddlManufacturer.DataValueField = "id";
            ddlManufacturer.DataSource = dr;
            ddlManufacturer.DataBind();
            //ddlCat.Items.Insert(0, "Select");

        }
    }
    private void BindModel(int manufacturerId)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT [id], [model] FROM [manufacturer_model_tbl] WHERE ([manufacturer_id] = '" + manufacturerId + "') ORDER BY [model]";

        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            lblError.Visible = false;
            ddlModel.Visible = true;

            ddlModel.DataTextField = "model";
            ddlModel.DataValueField = "id";
            ddlModel.DataSource = dr;
            ddlModel.DataBind();
        }
        else
        {
            ddlModel.SelectedIndex = 0;
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    protected void rbtnFitment_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strFitment = rbtnFitment.SelectedItem.Text.ToString();
        if (strFitment == "Universal")
        {
            ddlModel.Visible = false;
            ddlManufacturer.Visible = false;
            SortGrid("fitment", strFitment);
        }
        else
        {
            ddlManufacturer.SelectedIndex = 0;
            ddlManufacturer.Visible = true;
        }
    }
    protected void ddlManufacturer_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlModel.Visible = true;
        int manufacturerId = int.Parse(ddlManufacturer.SelectedValue.ToString());
        BindModel(manufacturerId);

    }
    protected void ddlModel_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}




