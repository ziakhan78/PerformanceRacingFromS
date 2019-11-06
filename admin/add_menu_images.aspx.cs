using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;
using System.IO;

public partial class admin_add_menu_images : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                imgId.Visible = false;               
                if (Request.QueryString["cid"] != null)
                {
                    int cid = int.Parse(Request.QueryString["cid"].ToString());
                    GetImage(cid);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }

    private void GetImage(int cid)
    {
        imgId.Visible = true;       
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetMenuImage";
        obj.AddParam("@id", cid);
        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            ddlMenu.SelectedItem.Text = dt.Rows[0]["menu"].ToString(); 
            txtCaption.Text = dt.Rows[0]["caption"].ToString();
            string thumbnail = dt.Rows[0]["menu_image"].ToString();
            if (thumbnail != "")
            {
                Session["menu_image"] = thumbnail;
            }

            imgId.ImageUrl = "../" + dt.Rows[0]["menu_image"].ToString();
  
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["cid"] != null)
            {
                UpdateCategory();
            }
            else
            {
                AddCategory();
            }
        }
    }

    private void AddCategory()
    {
        DBconnection dbcon = new DBconnection();
        dbcon.SetCommandSP = "z_AddMenuImage";
        dbcon.AddParam("@menu", ddlMenu.SelectedItem.Text.Trim());
        dbcon.AddParam("@caption", ToTitleCase(txtCaption.Text.Trim()));
        dbcon.AddParam("@menu_image", Session["menu_image"].ToString());
       
        int i = dbcon.ExecuteNonQuery();
        if (i > 0)
        {
            string jv = "<script>alert('Menu Image has been added successfully!');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            txtCaption.Text = "";           
        }
    }

    private void UpdateCategory()
    {

        int cid = int.Parse(Request.QueryString["cid"].ToString());
        DBconnection dbcon = new DBconnection();
        dbcon.SetCommandSP = "z_UpdateCollectionCateory";
        dbcon.AddParam("@id", cid);
        dbcon.AddParam("@menu", ddlMenu.SelectedItem.Text.Trim());
        dbcon.AddParam("@caption", ToTitleCase(txtCaption.Text.Trim()));     


        try
        {
            dbcon.AddParam("@menu_image", Session["menu_image"].ToString());
        }
        catch
        {
            dbcon.AddParam("@menu_image", DBNull.Value);
        }

       

        int i = dbcon.ExecuteNonQuery();
        if (i > 0)
        {
            //string jv = "<script>alert('Category has been updated successfully');</script>";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);         
            //imgId.ImageUrl = "../Image_Gallery/" + Session["category_image"].ToString(); 
            txtCaption.Text = "";
           // showmsg("Menu Image Has Been Updated Successfully", "view_gallery_category.aspx");
        }
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

    public string ToTitleCase(string str)
    {
        return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str.ToLower());
    }

    protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            //foreach (UploadedFile file in RadAsyncUpload1.UploadedFiles)
            //{
            //    string path = Server.MapPath("~/WAV/");
            //    file.SaveAs(path + file.FileName);

            //    string track_name = file.FileName;
            //    track_name = track_name.Substring(0, track_name.LastIndexOf("."));
            //    string file_name = file.FileName;
            //    Int32 track_size = file.ContentLength;
            //    string track_type = file.ContentType;

            //    AddMusic(track_name, file_name, track_size, track_type);
            //}            


            string strPath = "MenuImages/" + ddlMenu.SelectedItem.Text.Trim().ToString();
            if (!Directory.Exists(Server.MapPath("~/" + strPath)))
            {
                Directory.CreateDirectory(Server.MapPath("~/" + strPath));
            }

            if (!Directory.Exists(Server.MapPath("~/" + strPath)))
            {
                Directory.CreateDirectory(Server.MapPath("~/" + strPath));
            }

            //int filesizeInBytes = e.File.ContentLength;
            //Session["category_image"] = filesizeInBytes;
            //string filename = e.File.FileName;

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
            Session["category_image"] = strPath + "/" + file_name;

            e.File.SaveAs(path);
        }
        catch
        {
        }
    }
  

    protected void btnCancel_Click(object sender, EventArgs e)
    {
    }
}