using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;

public partial class admin_ViewDealersOrders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           // GetOrderList();

            PanelDate.Visible = false;
            txtName.Visible = true;
            btnSearch.Visible = true;
        }
    }

    //private void GetOrderList()
    //{
    //    DataTable dt;
    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandSP = "ViewOrder_sp";

    //    dt = obj.ExecuteTable();

    //    RadGrid1.DataSource = dt;
    //    RadGrid1.DataBind();

    //}

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

    private void SearchByAlphabet(string title)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "z_SearchByAlphabetOrders";
        obj.AddParam("@name", title);

        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            //lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            //lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string searchField = "";
        int i = int.Parse(rbtnSearch.SelectedValue.ToString());
        if (i == 0)
        {
            searchField = "OrderNo";
        }
        if (i == 1)
        {
            searchField = "CreatedOn";
        }

        if (i == 2)
        {
            searchField = "email";
        }

        string val = txtName.Text.Trim().ToString();
        SearchGrid(searchField, val);
    }


    private void SearchGrid(string searchField, string pname)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * from View_Orders  where " + searchField + " like  '%'+'" + pname + "'+ '%' order by CreatedOn desc";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            //lblError.Visible = false;
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

    #endregion


    //protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    //{
    //    DropDownList chkbox = (DropDownList)e.Item.FindControl("chkActive");
    //    Label lblStatus = (Label)e.Item.FindControl("lblStatus");

    //    if (lblStatus != null)
    //    {
    //        string b = lblStatus.Text.Trim().ToString();

    //        if (b == "Pending")
    //        {
    //            chkbox.SelectedIndex = 0;
    //        }           
    //        if (b == "Processing")
    //        {
    //            chkbox.SelectedIndex = 1;
    //        }
    //        if (b == "Completed")
    //        {
    //            chkbox.SelectedIndex = 2;
    //        }
           
    //    }
    //}

    //protected void chkActive_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    //int id = 0;
    //    string cartId = ""; 
    //    try
    //    {
    //        foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
    //        {

    //            DropDownList chkbox = (DropDownList)item.FindControl("chkActive");
    //            Label lblId = (Label)item.FindControl("lblId");

    //            //Label lblEmail = (Label)item.FindControl("lblEmail");

    //            string strC = chkbox.SelectedItem.Text.Trim();
    //            if (strC != "Select")
    //            {
    //                //if (strC == "Active")
    //                //    strC = "True";
    //                //if (strC == "Inactive")
    //                //    strC = "False";

    //                cartId = lblId.Text.ToString();
    //                //email = lblEmail.Text.ToString();
    //                if (cartId != "")
    //                {
    //                    try
    //                    {
    //                        DBconnection con = new DBconnection();
    //                        con.SetCommandQry = "update cart_tbl set Status='" + strC + "' where  Cart_Id='" + cartId + "'";
    //                        int exe = con.ExecuteNonQuery();

    //                    }
    //                    catch { }
    //                }
    //            }
    //            chkbox.SelectedIndex = 0;
    //        }
    //        RadGrid1.DataBind();
    //    }
    //    catch { }

    //}

    protected void btnSortdateSubmit_Click(object sender, EventArgs e)
    {
       // Session["ByDateTime"] = "ByDateTime";
        BindGridDate();
    }
    private void BindGridDate()
    {
        DateTime dFromm = DateTime.Parse(dateFrom.DbSelectedDate.ToString());
        DateTime dtoo = DateTime.Parse(dateTo.DbSelectedDate.ToString());      

        DBconnection obj = new DBconnection();
        
        obj.SetCommandSP = "z_SortOrderbyDate_sp";
        obj.AddParam("@dFrom", dFromm);
        obj.AddParam("@dTo", dtoo);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
           // lblMsg.Visible = false;
            RadGrid1.Visible = true;

            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            //lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    protected void rbtnSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strOrder = rbtnSearch.SelectedItem.Value.ToString();
        if(strOrder=="0")
        {
            PanelDate.Visible = false;
            txtName.Visible = true;
            btnSearch.Visible = true;
        }
        if (strOrder == "1")
        {
            PanelDate.Visible = true;
            txtName.Visible = false;
            btnSearch.Visible = false;
        }
        if (strOrder == "2")
        {
            PanelDate.Visible = false;
            txtName.Visible = true;
            btnSearch.Visible = true;
        }
    }
}
