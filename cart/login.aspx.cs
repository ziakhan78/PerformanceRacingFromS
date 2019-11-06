using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class cart_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblmsg.Visible = false;
        txtuname.Focus();
        try
        {
            if (!IsPostBack)
            {
                Session["Fname"] = null;
                Session["Lname"] = null;
                Session["EmailId"] = null;
                Session["MobileCC"] = null;
                Session["Mobile"] = null;


                string email = Request.Form["txtuname"];
                string psw = Request.Form["txtpsw"];
                string remember1 = Request.Form["ckremember1"];
                Page.SetFocus("txtuname");
                if (email != null)
                {
                    txtuname.Text = email.Trim();
                    txtpsw.Attributes.Add("value", psw.Trim());
                    if (remember1 == "on")
                    {
                        ckremember1.Checked = true;
                    }
                    else
                    {
                        ckremember1.Checked = false;
                    }
                    cvisvaliduser.IsValid = ValidateUser(email.Trim(), psw.Trim());
                }
                else
                {
                    if (Request.Cookies["UserCook"] != null)
                    {
                        ckremember1.Checked = true;
                        HttpCookie cook = Request.Cookies["UserCook"];
                        txtuname.Text = cook["UserName"].ToString();
                        //txtpsw.Text = cook["pass"].ToString();
                        txtpsw.Attributes.Add("value", cook["pass"].ToString());
                    }
                }
            }
        }
        catch { }
    }
    protected void cvisvaliduser_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = ValidateUser(txtuname.Text, txtpsw.Text);
    }
    public bool ValidateUser(string uname, string psw)
    {
        bool Isvalid = false;
        try
        {
            //DBconnection con = new DBconnection("DBConn");
            DBconnection con = new DBconnection();
            DataTable objdt = new DataTable();
            con.SetCommandSP = "sc_CustomerLogin";
            con.AddParam("@uname", uname);
            con.AddParam("@pass", psw);
            objdt = con.ExecuteTable();
            if (objdt.Rows.Count > 0)
            {
                Isvalid = true;
                Session["UserType"] = "Customer";
                Session["uname"] = objdt.Rows[0]["billFName"].ToString() + " " + objdt.Rows[0]["billLName"].ToString();
                Session["CustomerID"] = objdt.Rows[0]["id"].ToString();
                Session["UserEmail"] = uname.ToString();

                Session["GstCode"]= objdt.Rows[0]["state_code_gst"].ToString();
                if (ckremember1.Checked)
                {
                    if (Request.Browser.Cookies == true)
                    {
                        HttpCookie loginCook = new HttpCookie("UserCook");
                        loginCook["UserName"] = uname;
                        loginCook["pass"] = psw;
                        loginCook.Expires = DateTime.Now.AddDays(1);
                        Response.Cookies.Add(loginCook);
                    }
                }
                if (Session["cartId"] != null)
                {
                    DBconnection objcon = new DBconnection();
                    objcon.SetCommandSP = "sc_UpdateCartDetails";
                    objcon.AddParam("@Cart_Id", Session["cartId"]);
                    objcon.AddParam("@Cust_Id", Session["CustomerID"]);
                    if (objcon.ExecuteNonQuery() > 0)
                    {
                        //Response.Redirect("ConfirmOrder.aspx");
                         Response.Redirect("registrations.aspx");
                    }
                }
                else
                {
                    Response.Redirect("registrations.aspx");
                }
            }
            else
            {
                return false;

            }
        }
        catch
        {
            return false;

        }
        return Isvalid;

    }
    protected void cvemail_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "sc_CheckEmailId";
            obj.AddParam("@emailid", txtEmail.Text.Trim());

            object res = obj.ExecuteScalar();
            if (res != null)
                args.IsValid = false;
            else
                args.IsValid = true;
        }
        catch
        {
            args.IsValid = true;
        }
    }
    protected void btnCreateAccount_Click(object sender, EventArgs e)
    {
        if (chkTC.Checked && chkPP.Checked)
        {
            lblmsg.Visible = false;
            if (Page.IsValid)
            {
                Session["Fname"] = txtFirstName.Text.Trim().ToString();
                Session["Lname"] = txtLastName.Text.Trim().ToString();
                Session["EmailId"] = txtEmail.Text.Trim().ToString();
                Session["MobileCC"] = txtMobileCc.Text.Trim().ToString();
                Session["Mobile"] = txtMobile.Text.Trim().ToString();
                Response.Redirect("registrations.aspx");
            }
        }
        else
        {
            lblmsg.Visible = true;
            //string jv = "<script>alert('Terms & Conditions must be read and checked before the user registration !');</script>";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

            //return;
        }

    }

}
