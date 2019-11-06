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

public partial class Admin_ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // this.Form.DefaultButton = this.btnsubmit.UniqueID;

        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                txtOldPass.Focus();
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
        
    }
    
    public void clear()
    {
        txtOldPass.Text = "";
        txtPass.Text = "";
        txtCPass.Text = "";

        txtOldPass.Focus();
    }
    public void show(string msg)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
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
    protected void btnreset_Click(object sender, EventArgs e)
    {
        clear();
    }
    protected void btnGenPassword_Click(object sender, EventArgs e)
    {

        string pass = MakePassword(8);
        txtPass.Text = pass;
        txtCPass.Text = pass;
    }

    private string MakePassword(int length)
    {
        Random ran = new Random(DateTime.Now.Second);
        char[] password = new char[length];

        for (int i = 0; i < length; i++)
        {
            int[] n = { ran.Next(48, 57), ran.Next(65, 90), ran.Next(97, 122), ran.Next(35, 38) };
            int picker = ran.Next(0, 4);
            if (picker == 4)//if i make the maxvalue 2 it "never" appears... dunno whats going on there 
                picker = 3;
            password[i] = (char)n[picker];
        }

        return new string(password);

    }
   
    private void Clear()
    {
        txtOldPass.Text = "";
        txtCPass.Text = "";
        txtPass.Text = "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AccessPassword";
            obj.AddParam("@oldpass", txtOldPass.Text.Trim());
            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            if (dt.Rows.Count == 0)
            {
                //show("Wrong Old password!");
                string jv = "<script>alert('Wrong Old Password!');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                clear();
            }
            else
            {
                if (dt.Rows[0]["Password"].ToString() == txtOldPass.Text.Trim())
                {
                    DBconnection con = new DBconnection();
                    con.SetCommandQry = "update admin_users_tbl set Password='" + txtPass.Text.Trim() + "' where Password='" + txtOldPass.Text.Trim() + "'";
                    if (con.ExecuteNonQuery() > 0)
                    {
                        //showmsg("Password Updated Succeessfully!", "Default.aspx");
                        string jv = "<script>alert('Password Updated Succeessfully!');</script>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                    }
                    else { }
                }
                else
                {
                    //show("Wrong Password");
                    string jv = "<script>alert('Wrong Password!');</script>";
                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                    clear();
                }
            }
        }
    }
}