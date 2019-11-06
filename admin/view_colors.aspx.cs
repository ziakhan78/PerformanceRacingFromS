using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_view_colors : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                bool b = true;
                if (b == true)
                {
                    Session["searchField"] = null;
                    Session["name"] = null;
                    Session["value"] = null;
                    b = false;
                }

                ViewState["CurrentAlphabet"] = "ALL";
                this.GenerateAlphabets();

                lblMsg.Visible = false;
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

    private void GenerateAlphabets()
    {
        List<ListItem> alphabets = new List<ListItem>();
        ListItem alphabet = new ListItem();

        for (int i = 65; i <= 91; i++)
        {
            alphabet = new ListItem();
            alphabet.Value = Char.ConvertFromUtf32(i);

            alphabet.Selected = alphabet.Value.Equals(ViewState["CurrentAlphabet"]);
            alphabets.Add(alphabet);
        }

        alphabet.Value = "ALL";
        alphabet.Selected = alphabet.Value.Equals(ViewState["CurrentAlphabet"]);
        //alphabets.Add(alphabet);

        rptAlphabets.DataSource = alphabets;
        rptAlphabets.DataBind();
    }
    protected void Alphabet_Click(object sender, EventArgs e)
    {
        LinkButton lnkAlphabet = (LinkButton)sender;
        ViewState["CurrentAlphabet"] = lnkAlphabet.Text;

        this.GenerateAlphabets();
        // RadGrid1.PageIndex = 0;
        //this.BindGrid1();
        SearchByAlphabet(lnkAlphabet.Text.Trim());
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
            searchField = "color_name";
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
        obj.SetCommandQry = "select * from color_master_tbl  where " + searchField + " like  '%'+'" + pname + "'+ '%' ";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            // lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            // lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    private void SearchByAlphabet(string name)
    {
        Session["searchField"] = null;
        Session["value"] = null;
        Session["name"] = name;
        DataTable dt = new DataTable();        

        MastersBLL obj = new MastersBLL();
        obj.ColorName = name;
        dt = obj.SearchColorsByAlphabet();

        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    private void SearchGrid(string searchField)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from color_master_tbl where color_name='" + searchField + "'";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    private void ManageGrid()
    {
        try
        {

            //if (Session["searchField"] != null)
            //{
            //    SearchGrid(ddlCat.SelectedItem.Text.Trim());
            //    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
            //    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            //}

            if (Session["name"] != null)
            {
                SearchByAlphabet(Session["name"].ToString());
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
    private void BindGrid()
    {
        DataTable dt = new DataTable();
        MastersBLL obj = new MastersBLL();      
        dt = obj.GetColorsList();
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
    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        int id = 0;
        if (e.CommandName == "Delete")
        {
            id = Int32.Parse(e.CommandArgument.ToString());
            MastersBLL obj = new MastersBLL();
            obj.Id = id;

            int exe = obj.DeleteColors();

            if (exe > 0)
            {
                RadGrid1.DataBind();
            }
        }
    }   
    protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {

        Label lblCodeText = (Label)e.Item.FindControl("lblCode");
        Label lblCode = (Label)e.Item.FindControl("lblColorCode");
        if(lblCode!=null)
        {
            try
            {
                lblCode.BackColor = System.Drawing.ColorTranslator.FromHtml(lblCodeText.Text);
            }
            catch { }
        }
    }
}