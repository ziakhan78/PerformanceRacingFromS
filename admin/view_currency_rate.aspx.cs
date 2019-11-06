using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_view_currency_rate : System.Web.UI.Page
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
   protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteCurrencyRate";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                RadGrid1.DataBind();              
            }
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