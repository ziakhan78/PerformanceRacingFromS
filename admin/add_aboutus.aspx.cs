using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_aboutus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //if (Request.QueryString["id"] != null)
            //{
            //    Session["images"] = null;
            //    int id = int.Parse(Request.QueryString["id"].ToString());
            //    GetAboutAaryans(id);
            //}
            Session["IsEmpty"] = null;
            //string strLanguage = Session["Language"].ToString();
            GetAboutUs();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Session["IsEmpty"]!= null)
            {
                UpdateAboutUs();
            }
            else
            {
                AddAboutUs();
            }
        }
    }
    private void GetAboutUs()
    {
        AboutBLL objAbout = new AboutBLL();
        DataTable dt = new DataTable();
        dt = objAbout.GetAboutUs();
        if (dt.Rows.Count > 0)
        {
            RadEditor1.Content = dt.Rows[0]["contents"].ToString();
            Session["IsEmpty"] = "About";
        }
        else
        {
            Session["IsEmpty"] = null;
            RadEditor1.Content = "About Us Text Comes Here.";
        }

        
    }
    private void AddAboutUs()
    {
        try
        {
            AboutBLL objAbout = new AboutBLL();
            objAbout.Contents = RadEditor1.Content;

            int i = objAbout.AddAboutUs();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('About Us Contents Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateAboutUs()
    {
        try
        {
            AboutBLL objAbout = new AboutBLL();
            objAbout.Contents = RadEditor1.Content;
            int i = objAbout.UpdateAboutUs();

            if (i > 0)
            {
                string jv = "<script>alert('About Us Contents Has Been Updated Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
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
        Clear();
    }
    private void Clear()
    {
        RadEditor1.Content = "";
    }   
}