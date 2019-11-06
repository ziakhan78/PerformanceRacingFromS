using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_view_assembly_master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }   
  
    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        int id = 0;
        if (e.CommandName == "Delete")
        {
            id = Int32.Parse(e.CommandArgument.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteAssembly";
            obj.AddParam("@id", id);

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                RadGrid1.DataBind();
            }
        }
    }
}