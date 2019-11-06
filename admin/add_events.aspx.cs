using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_events : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                BindTime();
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetEvents(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Server.Transfer("Default.aspx");
        }

    }
    private void BindTime()
    {
        string s = "";
        for (int i = 1; i <= 12; i++)
        {
            if (i <= 9)
            {
                s = "0" + i;
            }
            else
            {
                s = i.ToString();
            }
            DDLTimeH.Items.Add(s.ToString());
        }
        DDLTimeH.Items.Insert(0, "HH");
        DDLTimeH.Items.Insert(1, "00");
        for (int i = 5; i <= 55; i = i + 5)
        {
            if (i <= 9)
            {
                s = "0" + i;
            }
            else
            {
                s = i.ToString();
            }
            DDLTimeM.Items.Add(s.ToString());
        }
        DDLTimeM.Items.Insert(0, "MM");
        DDLTimeM.Items.Insert(1, "00");
    }

    private void GetEvents(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_Get_upcoming_events";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            eventDate.DbSelectedDate = DateTime.Parse(dt.Rows[0]["event_date"].ToString());
            string[] time = dt.Rows[0]["event_time"].ToString().Split(':');
            DDLTimeH.SelectedValue = time[0].ToString();
            DDLTimeM.SelectedValue = time[1].ToString();
            DDLTimeAMPM.SelectedValue = time[2].ToString();

            txtEventName.Text = dt.Rows[0]["event_name"].ToString();
            txtEventDesc.Content = dt.Rows[0]["event_description"].ToString();
            txtVenue1.Text = dt.Rows[0]["venue1"].ToString();
            txtVenue2.Text = dt.Rows[0]["venue2"].ToString();
            txtVenue3.Text = dt.Rows[0]["venue3"].ToString();

        
          

            txtGPSLati.Text = dt.Rows[0]["gps_latitude"].ToString();
            txtGPSLongi.Text = dt.Rows[0]["gps_longitude"].ToString();

            txtDressCode.Text = dt.Rows[0]["dress_code"].ToString();

          

            string map = dt.Rows[0]["direction_map"].ToString();
            if (map != "")
            {
                Session["DirectionMap"] = map;
            }
            string img = dt.Rows[0]["image"].ToString();

            if (img != "")
            {
                Session["EventImage"] = img;
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
                UpdateEvents(id);
            }
            else
            {
                AddEvents();
            }
        }
    }
    private void AddEvents()
    {
        string map = "";
        string imgPath = "";
        
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_add_upcoming_events";
        obj.AddParam("@event_name", txtEventName.Text.Trim().ToString());
        obj.AddParam("@event_date", DateTime.Parse(eventDate.SelectedDate.ToString()));
        obj.AddParam("@event_time", DDLTimeH.SelectedValue.Trim() + ":" + DDLTimeM.SelectedValue.Trim() + ":" + DDLTimeAMPM.SelectedValue.Trim());
        obj.AddParam("@event_description", txtEventDesc.Content);       
        
        obj.AddParam("@venue1", txtVenue1.Text.Trim().ToString());
        obj.AddParam("@venue2", txtVenue2.Text.Trim().ToString());
        obj.AddParam("@venue3", txtVenue3.Text.Trim().ToString());
           
        obj.AddParam("@gps_latitude", txtGPSLati.Text.Trim().ToString());
        obj.AddParam("@gps_longitude", txtGPSLongi.Text.Trim().ToString());

        obj.AddParam("@dress_code", txtDressCode.Text.Trim().ToString());

        SaveImages img = new SaveImages();
        map = img.AddImages(FileUpload1.PostedFile, "Images");
        imgPath = img.AddImages(FileUploadImage.PostedFile, "Images");
        obj.AddParam("@direction_map", map);
        obj.AddParam("@image", imgPath);

        int exe = obj.ExecuteNonQuery();
        if (exe != 0)
        {         
            string jv = "<script>alert('Record has been added successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
    }

    private void UpdateEvents(int id)
    {
        string map = "";
        string imgPath = "";

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_update_upcoming_events";
        obj.AddParam("@id", id);
        obj.AddParam("@event_name", txtEventName.Text.Trim().ToString());
        obj.AddParam("@event_date", DateTime.Parse(eventDate.SelectedDate.ToString()));
        obj.AddParam("@event_time", DDLTimeH.SelectedValue.Trim() + ":" + DDLTimeM.SelectedValue.Trim() + ":" + DDLTimeAMPM.SelectedValue.Trim());
        obj.AddParam("@event_description", txtEventDesc.Content);

        obj.AddParam("@venue1", txtVenue1.Text.Trim().ToString());
        obj.AddParam("@venue2", txtVenue2.Text.Trim().ToString());
        obj.AddParam("@venue3", txtVenue3.Text.Trim().ToString());     
    

        obj.AddParam("@gps_latitude", txtGPSLati.Text.Trim().ToString());
        obj.AddParam("@gps_longitude", txtGPSLongi.Text.Trim().ToString());

        obj.AddParam("@dress_code", txtDressCode.Text.Trim().ToString());
        
        SaveImages img = new SaveImages();
        map = img.AddImages(FileUpload1.PostedFile, "Images");
        if (map == "")
        {
            obj.AddParam("@direction_map", map);
        }
        else
        {
            obj.AddParam("@direction_map", Session["DirectionMap"].ToString());
        }

        imgPath = img.AddImages(FileUploadImage.PostedFile, "Images");
        if (imgPath == "")
        {
            obj.AddParam("@image", imgPath);
        }
        else
        {
            obj.AddParam("@image", Session["EventImage"].ToString());
        }

        int exe = obj.ExecuteNonQuery();
        if (exe != 0)
        {

            showmsg("Record has been updated successfully", "view_events.aspx");

            //string jv = "<script>alert('Record has been updated successfully');</script>";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
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
}
