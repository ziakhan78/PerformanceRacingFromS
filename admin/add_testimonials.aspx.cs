using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_testimonials : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlProduct.Items.Insert(0, "Select");
            img.Visible = false;
           lblHeading.Text = "Add Testimonials";
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetTestimonial(id);
            }
        }
    }
    private void GetTestimonial(int id)
    {

        TestiomonialsBll obj = new TestiomonialsBll();
        obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetTestiomonialById();
        if (dt.Rows.Count > 0)
        {

            lblHeading.Text = "Edit Testimonials";
            txtName.Text = dt.Rows[0]["name"].ToString();
            txtDesig.Text = dt.Rows[0]["designation"].ToString();
            txtTestimonials.Content = dt.Rows[0]["testimonial"].ToString();
            DDLBrandName.SelectedItem.Text = dt.Rows[0]["brand"].ToString();
            ddlProduct.SelectedItem.Text = dt.Rows[0]["product"].ToString();

            string thumbnail = dt.Rows[0]["image"].ToString();
            if (thumbnail != "")
            {
                img.Visible = true;
                Session["TestimonialImage"] = thumbnail;
            }

            img.ImageUrl = "../Images/" + dt.Rows[0]["image"].ToString();

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

            TestiomonialsBll obj = new TestiomonialsBll();          

            obj.Name = txtName.Text.Trim().ToString();
            obj.Designation = txtDesig.Text.Trim().ToString();
            obj.Testimonial = txtTestimonials.Content;
            obj.Brand = DDLBrandName.SelectedItem.Text.Trim().ToString();
            obj.Product = ddlProduct.SelectedItem.Text.Trim().ToString();
            try
            {
                obj.Image = Session["TestimonialImage"].ToString();
            }
            catch { obj.Image = ""; }

            obj.Ipaddress = ipaddress;

            int i = obj.AddTestiomonial();

            if (i > 0)
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
            TestiomonialsBll obj = new TestiomonialsBll();
            obj.Id = id;
            obj.Name = txtName.Text.Trim().ToString();
            obj.Designation = txtDesig.Text.Trim().ToString();
            obj.Testimonial = txtTestimonials.Content;
            obj.Brand = DDLBrandName.SelectedItem.Text.Trim().ToString();
            obj.Product = ddlProduct.SelectedItem.Text.Trim().ToString();
            try
            {
                obj.Image = Session["TestimonialImage"].ToString();
            }
            catch { obj.Image = ""; }

            int i = obj.UpdateTestiomonial();

            if (i > 0)
            {
                Clear();
                ShowMsg("Testimonial Has Been Updated Successfully", "view_testimonials.aspx");
            }
        }
        catch { }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    private void Clear()
    {
        txtName.Text = "";
        txtDesig.Text = "";
        txtTestimonials.Content = "";
        DDLBrandName.SelectedIndex = 0;
       // ddlProduct.SelectedIndex = 0;
        Session["TestimonialImage"] = null;
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
    public void ShowMsg(string msg, string redirectUrl)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "window.location='" + redirectUrl + "';";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }

    protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            string strPath = "Images";

            string file_name = "";
            string ext = "";
            file_name = e.File.FileName;
            file_name = file_name.Substring(file_name.LastIndexOf("\\") + 1);
            string strDate = System.DateTime.Now.ToString();
            strDate = strDate.Replace("/", "");
            strDate = strDate.Replace("-", "");
            strDate = strDate.Replace(":", "");
            strDate = strDate.Replace(" ", "");
            ext = file_name.Substring(file_name.LastIndexOf("."));
            file_name = file_name.Substring(0, file_name.LastIndexOf("."));
            file_name = strDate + ext;

            string path = Server.MapPath("~/" + strPath + "/" + file_name);
            Session["TestimonialImage"] = file_name;
            e.File.SaveAs(path);
        }
        catch
        {
        }
    }
   
}