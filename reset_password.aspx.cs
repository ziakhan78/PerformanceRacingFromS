using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class reset_password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ticket"] != null)
            {
                string key = Request.QueryString["ticket"].ToString();
                // IsAlreadyVerify(key);
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                string key = Request.QueryString["ticket"].ToString();
                DBconnection obj = new DBconnection();
                obj.SetCommandSP = "sc_SetNewPassword";
                obj.AddParam("@Password", txtPass.Text.Trim());
                obj.AddParam("@email_verification_code", key);

                int exe = obj.ExecuteNonQuery();
                if (exe > 0)
                {
                    showmsg("Your password has been reset successfully", "cart/login.aspx");
                }
            }
            catch { }
        }
    }

    //private void IsAlreadyVerify(string key)
    //{
    //    try
    //    {
    //        DBconnection obj = new DBconnection();
    //        obj.SetCommandQry = "Select email_verification_code from Customer where is_email_verify='True' and email_verification_code='" + key + "'";

    //        DataTable dt = new DataTable();
    //        dt = obj.ExecuteTable();

    //        if (dt.Rows.Count > 0)
    //        {
    //            Panel1.Visible = false;
    //            Panel2.Visible = true;
    //        }

    //        else
    //        {
    //            VerifyEmail(key);
    //        }
    //    }
    //    catch { }
    //}

    public void showmsg(string msg, string RedirectUrl)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "window.location='" + RedirectUrl + "';";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }

}