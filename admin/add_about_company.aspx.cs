using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_about_company : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindTOU();
        }
    }

    private void BindTOU()
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from terms_of_use_tbl";

        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            RadEditor1.Content = dt.Rows[0]["text"].ToString();
            Session["EmptyData"] = null;
        }
        else
        {
            Session["EmptyData"] = "No Data";
            //RadEditor1.Content = "Enter Privacy Polocy Text Here";

        }
    }
    private void AddTOU()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddTOU";

            obj.AddParam("@text", RadEditor1.Content);


            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                //clear();
                //showmsg("Record updated successfully !", "view_roll_of_honour.aspx");
                string jv = "<script>alert('Record Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdateTOU()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateTOU";

            obj.AddParam("@text", RadEditor1.Content);


            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                //clear();
                //showmsg("Record updated successfully !", "view_roll_of_honour.aspx");
                string jv = "<script>alert('Record Has Been Updated Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Session["EmptyData"] == null)
        {
            UpdateTOU();
        }
        else
        {
            AddTOU();
        }
    }
}