using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DealersLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //this.Form.DefaultButton = this.btnSign.UniqueID;

        try
        {
            Page.SetFocus("txtUsername");
            if (!IsPostBack)
            {               
                txtUsername.Visible = true;
                RFVEmail.Visible = true;
                RFVMem.Visible = false;

                Response.Cache.SetNoStore();
                Response.Buffer = true;
                Response.ExpiresAbsolute = System.DateTime.Now;
                Response.Expires = 0;
                Response.CacheControl = "no-cache";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetExpires(DateTime.Now);

                string email = Request.Form["txtUsername"];
                string psw = Request.Form["txtPassword"];
                string remember = Request.Form["ckremember"];
                Page.SetFocus("txtUsername");
                if (email != null)
                {
                    txtUsername.Text = email.Trim();
                    txtPassword.Attributes.Add("value", psw.Trim());
                    if (remember == "on")
                    {
                        ckremember.Checked = true;
                    }
                    else
                    {
                        ckremember.Checked = false;
                    }
                }
                else
                {
                    if (Request.Cookies["UserCook"] != null)
                    {
                        ckremember.Checked = true;
                        HttpCookie cook = Request.Cookies["UserCook"];
                        txtUsername.Text = cook["Username"].ToString();
                        txtPassword.Attributes.Add("value", cook["Pass"].ToString());
                    }
                }
            }
        }
        catch { }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtUsername.Text = "";
        txtPassword.Text = "";
        //LblInvalid.Visible = false;
    }
    protected void btnSign_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {               

                DBconnection con = new DBconnection();
                DataTable objdt = new DataTable();
                con.SetCommandSP = "z_DealersLogin";
                con.AddParam("@EmailId", txtUsername.Text.Trim().ToString());               
                con.AddParam("@Password", txtPassword.Text.Trim().ToString());
                objdt = con.ExecuteTable();
                if (objdt.Rows.Count > 0)
                {                   

                    if (ckremember.Checked)
                    {
                        if (Request.Browser.Cookies == true)
                        {
                            HttpCookie loginCook = new HttpCookie("UserCook");
                            loginCook["Username"] = txtUsername.Text.ToString();
                            loginCook["Pass"] = txtPassword.Text.ToString();
                            loginCook.Expires = DateTime.Now.AddDays(1);
                            Response.Cookies.Add(loginCook);
                        }
                    }

                    Session["UserType"] = "Dealer";
                    Session["DealerName"] = objdt.Rows[0]["Name"].ToString();
                    Session["CompanyName"] = objdt.Rows[0]["CompanyName"].ToString();                 
                    Session["DealerId"] = objdt.Rows[0]["id"].ToString();
                    Session["did"] = objdt.Rows[0]["DealerId"].ToString();
                    Session["DealerEmail"] = objdt.Rows[0]["EmailId"].ToString();
                    Session["GstCode"] = objdt.Rows[0]["state_code_gst"].ToString();

                    try
                    {
                        Response.Redirect("DealersProfile.aspx");
                    }
                    catch
                    {
                    }
                }
                else
                {
                    //LblInvalid.Visible = true;
                    string msg = "Invalid Email-Id or Password";
                    showmsg(msg);
                }
            }
            catch(Exception ex) { }
        }
    }
    public void showmsg(string msg)
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

}