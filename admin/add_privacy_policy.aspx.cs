using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_privacy_policy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPP();           
        }
    }

    private void BindPP()
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from pp_tbl";
        
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            RadEditor1.Content = dt.Rows[0]["pp_text"].ToString();
            Session["EmptyData"] = null;
        }
        else
        {
            Session["EmptyData"] = "No Data";
            //RadEditor1.Content = "Enter Privacy Polocy Text Here";
            
        }
    }
    private void AddPP()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddPP";

            obj.AddParam("@pp_text", RadEditor1.Content);


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

    private void UpdatePP()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdatePP";

            obj.AddParam("@pp_text", RadEditor1.Content);


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
        if (Session["EmptyData"]== null)
        {
            UpdatePP();
        }
        else
        {
            AddPP();
        }
    }
}