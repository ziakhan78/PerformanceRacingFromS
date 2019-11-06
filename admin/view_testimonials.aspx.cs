using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;

public partial class admin_view_testimonials : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user"] != null)
            {
                if (!IsPostBack)
                {                          
                    rbtnSearch.ClearSelection();
                    bool b;
                    if (b = true)
                    {
                        Session["SearchField"] = null;
                        Session["SearchBy"] = null;                       
                        Session["SearchByAlfhabetic"] = null;
                        b = false;
                    }

                    permission();
                    ManageGrid();
                }
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Default.aspx");
            }           
        }
    }
  
    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteTestimonial";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                ManageGrid();               
            }
        }
    }   
    protected void chkActive_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = 0;
        // string email, Pass = ""; 
        try
        {
            foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
            {

                DropDownList chkbox = (DropDownList)item.FindControl("chkActive");
                Label lblId = (Label)item.FindControl("lblId");

                //Label lblEmail = (Label)item.FindControl("lblEmail");

                string strC = chkbox.SelectedItem.Text.Trim();
                if (strC != "Select")
                {
                    if (strC == "Active")
                        strC = "True";
                    if (strC == "Inactive")
                        strC = "False";

                    id = Int32.Parse(lblId.Text.ToString());
                    //email = lblEmail.Text.ToString();
                    if (id != 0)
                    {
                        try
                        {
                            DBconnection con = new DBconnection();
                            con.SetCommandQry = "update testimonials_tbl set status='" + strC + "' where  id=" + id;
                            int exe = con.ExecuteNonQuery();

                        }
                        catch { }
                    }
                }
                chkbox.SelectedIndex = 0;
            }
            RadGrid1.DataBind();
        }
        catch { }

    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        DropDownList chkbox = (DropDownList)e.Item.FindControl("chkActive");
        Label lblStatus = (Label)e.Item.FindControl("lblStatus");

        if (lblStatus != null)
        {
            string b = lblStatus.Text;

            if (b == "True")
                chkbox.SelectedIndex = 0;
            if (b == "False")
                chkbox.SelectedIndex = 1;
        }
    }
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
        //  txtName.Text = "";

        rbtnSearch.ClearSelection();
        Session["SearchBy"] = null;
        Session["SortBy"] = null;
        Session["SearchByAlfhabetic"] = title;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "z_SearchByAlphabetTestimonials";
        obj.AddParam("@name", title);

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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["SearchField"] = null;
        Session["SearchBy"] = null;
        Session["SearchByAlfhabetic"] = null;

        string searchField = "";
        string val = "";
        int i = int.Parse(rbtnSearch.SelectedValue.ToString());
        if (i == 0)
        {
            searchField = "name";
            val = txtName.Text.Trim();
        }
        if (i == 1)
        {
            searchField = "testimonial";
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
        obj.SetCommandQry = "select * from testimonials_tbl  where " + searchField + " like  '%'+'" + pname + "'+ '%' ";

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
        obj.SetCommandQry = "select * from testimonials_tbl order by name asc";

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
                SearchGrid(Session["SearchField"].ToString(), txtName.Text.Trim());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
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
    public void permission()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "SELECT * FROM [Users]";

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
    protected void RadGrid1_PageIndexChanged(object sender, GridPageChangedEventArgs e)
    {
        ManageGrid();
    }
    protected void RadGrid1_PageSizeChanged(object sender, GridPageSizeChangedEventArgs e)
    {
        ManageGrid();
    }
    protected void RadGrid1_SortCommand(object sender, GridSortCommandEventArgs e)
    {
        ManageGrid();
    }
}