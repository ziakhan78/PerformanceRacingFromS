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

public partial class Admin_ViewBargainProducts : System.Web.UI.Page
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
                lblmsg.Text = "";
                lblmsg.Visible = false;
                lblError.Visible = false;
                RadGrid1.Visible = false;              

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

    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        int pid = 0;
        if (e.CommandName == "Delete")
        {
            pid = Int32.Parse(e.CommandArgument.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteBargainProduct";
            obj.AddParam("@id", pid);

            int i = obj.ExecuteNonQuery();

            if (i > 0)
            {
                //RadGrid1.DataBind();
                ManageGrid();
            }
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
        txtName.Text = "";
        Session["SearchBy"] = null;
        Session["SortBy"] = null;
        Session["SearchByAlfhabetic"] = title;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "z_SearchByAlphabetBargainProducts";
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
        obj.SetCommandQry = "select * from BargainProducts_tbl  where " + searchField + " like  '%'+'" + pname + "'+ '%' ";
        
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
        ProductsBLL obj = new ProductsBLL();
        dt = obj.GetBargainProductList();
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
                    SearchGrid(Session["SearchField"].ToString(), Session["SearchBy"].ToString());
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
 
    private void BindGrid(int sid)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from BargainProducts_tbl  where sid=" + sid + " and deleted='False' order by product_name ";

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
        obj.SetCommandQry = "select * from BargainProducts_tbl  where " + strField + "='True' and deleted='False' order by product_name";

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
            img1.ImageUrl = "../BargainProductsImages/" + strImages[0].ToString();
            // }
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
}




