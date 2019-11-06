﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class uc_testimonial : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindTestimonials();
        }
    }

    private void BindTestimonials()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * from testimonials_tbl order by order_no asc";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            Repeater2.DataSource = dt.DefaultView;
            Repeater2.DataBind();
        }
        else
        {
        }
    }
}