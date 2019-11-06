using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class admin_view_users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            permission();
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    protected void RadGrid1_ItemDeleted(object source, Telerik.Web.UI.GridDeletedEventArgs e)
    {
    }
    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        int uid = 0;
        if (e.CommandName == "Delete")
        {
            uid = Int32.Parse(e.CommandArgument.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteAdminUser";
            obj.AddParam("@UID", uid);

            int i = obj.ExecuteNonQuery();

            if (i > 0)
            {
                RadGrid1.DataBind();
            }
        }
    }
    public void permission()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "SELECT * FROM admin_users_tbl";

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
