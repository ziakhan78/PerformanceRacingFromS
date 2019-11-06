using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;

public partial class admin_view_newsletter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {                       
                CheckUserPermission();               
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteNewsletter";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                RadGrid1.DataBind();
                // ManageGrid();
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
                    id = Int32.Parse(lblId.Text.ToString());
                    //email = lblEmail.Text.ToString();
                    if (id != 0)
                    {
                        try
                        {
                            DBconnection con = new DBconnection();
                            con.SetCommandQry = "update newsletter_tbl set status='" + chkbox.SelectedItem.Text.Trim() + "' where  id=" + id;
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