using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_news : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            startDate.SelectedDate = DateTime.Now;
           
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetNews(id);
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
                UpdateNews(id);
            }
            else
            {
                AddNews();
            }
        }
    }
    private void GetNews(int id)
    {
        NewsBll obj = new NewsBll();
        DataTable dt = new DataTable();
        obj.Id = id;

        dt = obj.GetNewsById();
        if (dt.Rows.Count > 0)
        {
            txtNews.Content = dt.Rows[0]["news"].ToString();
            startDate.SelectedDate = DateTime.Parse(dt.Rows[0]["start_date"].ToString());
            endDate.SelectedDate = DateTime.Parse(dt.Rows[0]["end_date"].ToString());
        }
    }
    private void AddNews()
    {
        try
        {           
            NewsBll obj = new NewsBll();
            obj.News = txtNews.Content.ToString();
            obj.StartDate = DateTime.Parse(startDate.SelectedDate.ToString());
            obj.EndDate = DateTime.Parse(endDate.SelectedDate.ToString());

            int i = obj.AddNews();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('News Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateNews(int id)
    {
        try
        {
            NewsBll obj = new NewsBll();

            obj.Id = id;
            obj.News = txtNews.Content.ToString();
            obj.StartDate = DateTime.Parse(startDate.SelectedDate.ToString());
            obj.EndDate = DateTime.Parse(endDate.SelectedDate.ToString());
           
            int i = obj.UpdateNews();

            if (i > 0)
            {
                ShowMsg("News Has Been Updated Successfully", "view_news.aspx");
            }
        }
        catch { }
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
    
    private void Clear()
    {
        txtNews.Content = "";
        startDate.Clear();
        endDate.Clear();

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
}