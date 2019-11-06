using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_faq : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetTestimonial(id);
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateTestimonial(id);
            }
            else
            {
                AddTestimonial();
            }
        }
    }
    private void GetTestimonial(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetTestimonial";

        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            txtQues.Text = dt.Rows[0]["name"].ToString();
            txtAnswer.Text = dt.Rows[0]["designation"].ToString();
           
        }
    }
    private void AddTestimonial()
    {
        try
        {

            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddTestimonial";
            obj.AddParam("@name", txtQues.Text.Trim().ToString());
            obj.AddParam("@designation", txtAnswer.Text.Trim().ToString());           
            obj.AddParam("@ipaddress", ipaddress);

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();

                string jv = "<script>alert('Testimonial Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdateTestimonial(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateTestimonial";

            obj.AddParam("@id", id);
            obj.AddParam("@name", txtQues.Text.Trim().ToString());
            obj.AddParam("@designation", txtAnswer.Text.Trim().ToString());           
            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                showmsg("Testimonial Has Been Updated Successfully", "view_testimonials.aspx");
            }
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
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("view_testimonials.aspx");
    }

    private void Clear()
    {
        txtQues.Text = "";
        txtAnswer.Text = "";       
    }
}