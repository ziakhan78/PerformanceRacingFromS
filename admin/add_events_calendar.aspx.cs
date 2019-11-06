using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_add_events_calendar : System.Web.UI.Page
{
    public static bool checkList = false;

    protected void Page_Load(object sender, System.EventArgs e)
    {
        //trDaily.Visible = false;
        //trWeekly.Visible = false;
        //trMonthly.Visible = false;

        if (!IsPostBack)
        {
            //// bindMonth();
            BindTime();
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
            DDLsh.Items.Add(s.ToString());
            DDLeh.Items.Add(s.ToString());
        }
        DDLsh.Items.Insert(0, "HH");
        DDLsh.Items.Insert(1, "00");
        DDLeh.Items.Insert(0, "HH");
        DDLeh.Items.Insert(1, "00");

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

            DDLsm.Items.Add(s.ToString());
            DDLem.Items.Add(s.ToString());

        }
        DDLsm.Items.Insert(0, "MM");
        DDLsm.Items.Insert(1, "00");
        DDLem.Items.Insert(0, "MM");
        DDLem.Items.Insert(1, "00");
    }

    //private void bindMonth()
    //{
    //    for (int i = 1; i <= 31; i++)
    //    {
    //        chkMonthly.Items.Add(i.ToString());
    //    }
    //}
    private void reset()
    {
        //DDLFrequency.ClearSelection();
        txtDesc.Text = "";
        StartDate.Clear();
        EndDate.Clear();
        txtEventTitle.Text = "";
        txtVenu.Text = "";
        //StartTime.Clear();
        //EndTime.Clear();
        DDLsh.ClearSelection(); DDLsm.ClearSelection(); DDLeh.ClearSelection(); DDLem.ClearSelection(); DDLsampm.ClearSelection(); DDLeampm.ClearSelection();
        chkClub.Checked = false;
        chkDining.Checked = false;
        chkEnter.Checked = false;

        ////if (checkList)
        ////{
        ////    foreach (ListItem li in chkMonthly.Items)
        ////    {
        ////        li.Selected = false;
        ////    }
        ////}
    }

    private void AddEvents()
    {
        string strDate = "";
        string strDays = "";
        string strIsEvery = "";
        //string strFrequency = DDLFrequency.SelectedItem.Text;
        //if (strFrequency == "Select")
        //{
        //    strFrequency = "";
        //}
        strDate = StartDate.SelectedDate.ToString();
        ////switch (strFrequency)
        ////{
        ////    case "Daily":
        ////        if (chkWeekdays.Checked)
        ////        {
        ////            strDays = "Weekdays;";
        ////        }
        ////        if (chkWeekends.Checked)
        ////        {
        ////            strDays += "Weekends;";
        ////        }
        ////        break;

        ////    case "Weekly":
        ////        if (chkSun.Checked)
        ////        {
        ////            strDays = "Sunday;";
        ////        }
        ////        if (chkMon.Checked)
        ////        {
        ////            strDays += "Monday;";
        ////        }
        ////        if (chkTue.Checked)
        ////        {
        ////            strDays += "Tuesday;";
        ////        }
        ////        if (chkWed.Checked)
        ////        {
        ////            strDays += "Wednesday;";
        ////        }
        ////        if (chkThu.Checked)
        ////        {
        ////            strDays += "Thursday;";
        ////        }
        ////        if (chkFri.Checked)
        ////        {
        ////            strDays += "Friday;";
        ////        }
        ////        if (chkSat.Checked)
        ////        {
        ////            strDays += "Saturday;";
        ////        }

        ////        break;

        ////    case "Monthly":
        ////        foreach (ListItem li in chkMonthly.Items)
        ////        {
        ////            if (li.Selected)
        ////            {
        ////                strDays += li.Text + ";";
        ////            }
        ////        }
        ////        if (chkEvery.Checked)
        ////        {
        ////            //txtEndDate.Text = "12/31/" + DateTime.Now.Year.ToString();
        ////        }
        ////        break;
        ////}

        // save event type 

        string strEventType = "";
        string iconsPath = "";

        if (chkDining.Checked)
        {
            strEventType += "Bar & Restaraunts" + ",";
            iconsPath += "images/icon2.gif" + ";";
        }
        if (chkEnter.Checked)
        {
            strEventType += "Sports" + ",";
            iconsPath += "images/icon8.gif" + ";";
        }

        if (chkClub.Checked)
        {
            strEventType += "Club Facilities" + ",";
            iconsPath += "images/icon5.gif" + ";";
        }

        if (strEventType != "")
        {
            strEventType = strEventType.Substring(0, strEventType.Length - 1);
        }
        if (iconsPath != "")
        {
            iconsPath = iconsPath.Substring(0, iconsPath.Length - 1);
        }

        string evnt_name = txtEventTitle.Text;
        string evnt_date = StartDate.SelectedDate.ToString();
        string enddate = EndDate.SelectedDate.ToString();
        string evnt_location = txtVenu.Text;
        string evnt_shrt_des = txtDesc.Text;

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_add_events_cal";
        obj.AddParam("@event_name", txtEventTitle.Text.Trim().ToString());
        obj.AddParam("@event_description", txtDesc.Text.Trim().ToString());
        obj.AddParam("@event_type", strEventType);
        obj.AddParam("@event_location", txtVenu.Text.Trim().ToString());
        obj.AddParam("@event_start_date", DateTime.Parse(StartDate.SelectedDate.ToString()));
        try
        {
            obj.AddParam("@event_end_date", DateTime.Parse(EndDate.SelectedDate.ToString()));
        }
        catch
        {
            obj.AddParam("@event_end_date", DateTime.Parse(StartDate.SelectedDate.ToString()));
        }


        obj.AddParam("@event_start_time", DDLsh.SelectedValue.Trim() + ":" + DDLsm.SelectedValue.Trim() + ":" + DDLsampm.SelectedValue.Trim());
        obj.AddParam("@event_end_time", DDLeh.SelectedValue.Trim() + ":" + DDLem.SelectedValue.Trim() + ":" + DDLeampm.SelectedValue.Trim());
        ////obj.AddParam("@frequency", strFrequency);
        obj.AddParam("@frequency", "Select");
        obj.AddParam("@days", strDays);
        obj.AddParam("@is_every", strIsEvery);

        int exe = obj.ExecuteNonQuery();
        if (exe != 0)
        {
            reset();
            string jv = "<script>alert('Record Added Successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
    }
    protected void DDLFrequency_SelectedIndexChanged(object sender, EventArgs e)
    {
        ////string strfrequency = DDLFrequency.SelectedValue.ToString();
        ////{
        ////    if (strfrequency == "Daily")
        ////    {
        ////        trDaily.Visible = true;
        ////    }

        ////    if (strfrequency == "Weekly")
        ////    {
        ////        trWeekly.Visible = true;
        ////    }

        ////    if (strfrequency == "Monthly")
        ////    {
        ////        trMonthly.Visible = true;
        ////        foreach (ListItem li in chkMonthly.Items)
        ////        {
        ////            string strDOM = li.Selected.ToString();
        ////        }
        ////    }
        ////}
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            AddEvents();
        }
    }
}